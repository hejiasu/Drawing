//
//  DrawMatrixVC.m
//  Drawing
//
//  Created by user on 2017/6/12.
//  Copyright © 2017年 xiaoyi. All rights reserved.
//

#import "DrawMatrixVC.h"

@interface DrawMatrixVC ()

@end

@implementation DrawMatrixVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"平移缩放旋转";
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
@interface DrawMatrixView:UIView
@end

@implementation DrawMatrixView

- (void)drawRect:(CGRect)rect{
    
    //获取上下文
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    //描述路径
    UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(0, 0, 200, 100)];
    
    
    //上下文矩阵操作(平移)
    //必须要在添加路径之前
    CGContextTranslateCTM(ctx, 100, 100);
    
    //上下文矩阵操作(缩放)
    CGContextScaleCTM(ctx, 0.5, 0.5);
    
    //上下文矩阵操作(旋转)
    CGContextRotateCTM(ctx, M_PI_4);
    
    
    
    //把路径添加到上下文
    CGContextAddPath(ctx, path.CGPath);
    
    [[UIColor redColor] set];

    CGContextFillPath(ctx);
    
    
}

@end








