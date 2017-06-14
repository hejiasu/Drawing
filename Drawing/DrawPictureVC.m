//
//  DrawPictureVC.m
//  Drawing
//
//  Created by user on 2017/6/12.
//  Copyright © 2017年 xiaoyi. All rights reserved.
//

#import "DrawPictureVC.h"

@interface DrawPictureVC ()
@property (weak, nonatomic) IBOutlet UIView *backView;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (nonatomic,strong) UIView *clipView;

@property (nonatomic,assign) CGPoint startP;
@end

@implementation DrawPictureVC

- (void)viewDidLoad {
    [super viewDidLoad];

    self.title = @"截图";
    //给view添加一个是手势
    UIPanGestureRecognizer *panGesture = [[UIPanGestureRecognizer alloc]init];
    
    [panGesture addTarget:self action:@selector(pan:)];
    [self.backView addGestureRecognizer:panGesture];

}

-(UIView *)clipView{
    
    if (_clipView == nil) {
        _clipView = [[UIView alloc]init];
        [_clipView setBackgroundColor:[UIColor grayColor]];
        [_clipView setAlpha:0.5];
        [self.backView addSubview:_clipView];
    }
    return _clipView;
}

-(void)pan:(UIPanGestureRecognizer *)pan{
    
    CGPoint endP = CGPointZero;
 
    if (pan.state == UIGestureRecognizerStateBegan){
       
        //开始拖动的时候，获取开始点
        self.startP = [pan locationInView:self.backView];
        
    }else if (pan.state == UIGestureRecognizerStateChanged){
        
        //一直处于拖动的时候，获取变化点

        endP = [pan locationInView:self.backView];
        
        CGFloat w = endP.x - self.startP.x;
        CGFloat h = endP.y - self.startP.y;
        //生成矩形变化范围
        [self.clipView setFrame:CGRectMake(self.startP.x, self.startP.y, w, h)];
        

    }else if (pan.state == UIGestureRecognizerStateEnded){
        
        //停止拖动的时候

        //创建位图上下文
        UIGraphicsBeginImageContextWithOptions(self.backView.bounds.size, NO, 0);

        //设置裁剪区域
        UIBezierPath *backPath = [UIBezierPath bezierPathWithRect:self.clipView.frame];
        [backPath addClip];
        
        //获取当前上下文
        CGContextRef ctx = UIGraphicsGetCurrentContext();
        //把控件上的内容渲染到上下文
        [self.imageView.layer renderInContext:ctx];
        
        //获取图片
        self.imageView.image = UIGraphicsGetImageFromCurrentImageContext();
       //关闭上下文
        UIGraphicsEndImageContext();
        
        //移除置nil
        [self.clipView removeFromSuperview];
        self.clipView = nil;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end


















































