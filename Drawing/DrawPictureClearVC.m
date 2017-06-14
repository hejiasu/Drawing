//
//  DrawPictureClearVC.m
//  Drawing
//
//  Created by user on 2017/6/13.
//  Copyright © 2017年 xiaoyi. All rights reserved.
//

#import "DrawPictureClearVC.h"

@interface DrawPictureClearVC ()
@property (weak, nonatomic) IBOutlet UIView *backView;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@end

@implementation DrawPictureClearVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"图片擦除";
    
    
    //给view添加一个是手势
    UIPanGestureRecognizer *panGesture = [[UIPanGestureRecognizer alloc]init];
    
    [panGesture addTarget:self action:@selector(pan:)];
    [self.backView addGestureRecognizer:panGesture];
    
}

-(void)pan:(UIPanGestureRecognizer *)pan{
    
    //获取当前点
    CGPoint moveP = [pan locationInView:self.backView];
    
    //获取擦除的矩形范围
    CGFloat wh = 30;
    CGFloat x = moveP.x - wh *0.5;
    CGFloat y = moveP.y - wh *0.5;
    
    CGRect rect = CGRectMake(x, y, wh, wh);
    
    //创建位图上下文
    UIGraphicsBeginImageContextWithOptions(self.backView.bounds.size, NO, 0);
    
    //获取当前上下文
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    //把控件上的内容渲染到上下文
    [self.imageView.layer renderInContext:ctx];
    //擦除图片
    CGContextClearRect(ctx, rect);
    
    //获取图片
    self.imageView.image = UIGraphicsGetImageFromCurrentImageContext();
    //关闭上下文
    UIGraphicsEndImageContext();
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
