//
//  DrawProgressVC.m
//  Drawing
//
//  Created by user on 2017/6/10.
//  Copyright © 2017年 xiaoyi. All rights reserved.
//

#import "DrawProgressVC.h"

@interface DrawProgressView:UIView
@property (nonatomic,assign) CGFloat progress;
@end

@implementation DrawProgressView

-(void)setProgress:(CGFloat)progress{
    
    _progress = progress;
    //因为drawRect方法只是在视图刚刚出现的时候执行一次
    //重绘，系统会先创建于view相关联的上下文，然后再会自动调用drawRect
    [self setNeedsDisplay];
}

//不能手动调用drawRect方法，因为只有在drawRect里才能拿到上下文，图形上下文只能由系统创建
- (void)drawRect:(CGRect)rect{
    
    CGFloat radius = rect.size.width / 2;
    CGPoint center  = CGPointMake(rect.size.width/2, rect.size.height/2);
    
    CGFloat end = -M_PI_2 + self.progress * M_PI * 2;
    
    UIBezierPath *bezier = [UIBezierPath bezierPathWithArcCenter:center radius:radius-2 startAngle:-M_PI_2 endAngle:end clockwise:YES];
    [bezier stroke];
    
}

@end






@interface DrawProgressVC ()
@property (weak, nonatomic) IBOutlet UILabel *valueLabel;
@property (weak, nonatomic) IBOutlet DrawProgressView *progressView;

@end

@implementation DrawProgressVC

- (void)viewDidLoad {
    [super viewDidLoad];

    self.title = @"环形进度条";

}
- (IBAction)progressChange:(UISlider *)sender {
    
    self.valueLabel.text = [NSString stringWithFormat:@"%.2f%%",sender.value * 100];
    
    self.progressView.progress = sender.value;
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end






















