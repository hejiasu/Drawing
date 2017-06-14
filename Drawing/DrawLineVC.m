//
//  DrawLineVC.m
//  Drawing
//
//  Created by user on 2017/6/9.
//  Copyright © 2017年 xiaoyi. All rights reserved.
//

#import "DrawLineVC.h"

@interface DrawLineVC ()

@end

@implementation DrawLineVC

- (void)viewDidLoad {
    [super viewDidLoad];


    self.title = @"画线";
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
@end


@interface DrawLineView:UIView

@end

@implementation DrawLineView
//只有这个方法里面才能获取到跟View的layer相关的图形上下文
//当这个View要显示的时候drawRect才会调用，rect是当前的bounds
- (void)drawRect:(CGRect)rect{
    
    [self drawLine1];
//    [self drawLine2];
//    [self drawLine3];
    
    [self drawCurve1];
//    [self drawCurve2];
//    [self drawCurve3];
    
    [self drawDottedLine];
}

-(void)drawCurve1{
    //1、获取上下文
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    //2、描述路径
    CGContextMoveToPoint(ctx, 150, 150);
    //cpx(150)，cpy(200)指的是控制点坐标
    CGContextAddQuadCurveToPoint(ctx, 250, 200, 350, 150);
    //3、渲染上下文
    CGContextStrokePath(ctx);
}
-(void)drawCurve2{
    //1、获取图形上下文
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    //2、描述路径（底层封装路径）
    CGContextMoveToPoint(ctx, 50, 50);
    CGContextAddQuadCurveToPoint(ctx, 150, 200, 250, 50);
    //3、渲染上下文到View的layer
    CGContextStrokePath(ctx);
}
-(void)drawCurve3{
    //贝瑟尔路径
    //1、创建路径
    UIBezierPath *path = [UIBezierPath bezierPath];
    //2、设置起点
    [path moveToPoint:CGPointMake(50, 50)];
    //设置终点
    [path addQuadCurveToPoint:CGPointMake(250, 50) controlPoint:CGPointMake(150, 200)];
    //3、渲染上下文到View的layer
    [path stroke];

}

-(void)drawLine1{
    
    //1、获取图形上下文
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    //2、描述路径
    //创建路径
    CGMutablePathRef path =  CGPathCreateMutable();
    //设置起点
    CGPathMoveToPoint(path, NULL, 50, 150);
    //设置终点
    CGPathAddLineToPoint(path, NULL, 100, 100);
    

    //颜色
    [[UIColor redColor] setStroke];
    //线宽
    CGContextSetLineWidth(ctx, 20.0);
    //设置连接样式
    CGContextSetLineJoin(ctx, kCGLineJoinBevel);
    //设置顶角样式
    CGContextSetLineCap(ctx, kCGLineCapButt);
    
    
    //3、把路径添加到上下文
    CGContextAddPath(ctx, path);
    //4、渲染上下文到View的layer
    CGContextStrokePath(ctx);
}
-(void)drawLine2{
    //1、获取图形上下文
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    //2、描述路径（底层封装路径）
    CGContextMoveToPoint(ctx, 50, 50);
    CGContextAddLineToPoint(ctx , 200, 200);
    //3、渲染上下文到View的layer
    CGContextStrokePath(ctx);
    
    
}
-(void)drawLine3{
    //贝瑟尔路径
    //1、创建路径
    UIBezierPath *path = [UIBezierPath bezierPath];
    //2、设置起点
    [path moveToPoint:CGPointMake(50, 50)];
    //设置终点
    [path addLineToPoint:CGPointMake(200, 100)];
    
    [path setLineWidth:10.0];
    [path setLineJoinStyle:kCGLineJoinBevel];
    [path setLineCapStyle:kCGLineCapButt];
    [[UIColor redColor] setStroke];

    //3、渲染上下文到View的layer
    [path stroke];
    
    //1、创建路径
    UIBezierPath *path1 = [UIBezierPath bezierPath];
    //2、设置起点
    [path1 moveToPoint:CGPointMake(150, 150)];
    //设置终点
    [path1 addLineToPoint:CGPointMake(210, 110)];
    
    [path1 setLineWidth:5.0];
    [path1 setLineJoinStyle:kCGLineJoinRound];
    [path1 setLineCapStyle:kCGLineCapRound];
    [[UIColor yellowColor] setStroke];
    //3、渲染上下文到View的layer
    [path1 stroke];
    
}


-(void)drawDottedLine{
    CAShapeLayer *dotteShapeLayer = [CAShapeLayer layer];
    CGMutablePathRef dotteShapePath =  CGPathCreateMutable();
    //设置虚线颜色为blackColor
    [dotteShapeLayer setStrokeColor:[[UIColor orangeColor] CGColor]];
    //设置虚线宽度
    dotteShapeLayer.lineWidth = 2.0f ;
    //10=线的宽度 5=每条线的间距
    NSArray *dotteShapeArr = [[NSArray alloc] initWithObjects:[NSNumber numberWithInt:10],[NSNumber numberWithInt:5], nil];
    [dotteShapeLayer setLineDashPattern:dotteShapeArr];
    CGPathMoveToPoint(dotteShapePath, NULL, 50 ,50);
    CGPathAddLineToPoint(dotteShapePath, NULL, 100, 100);
    [dotteShapeLayer setPath:dotteShapePath];
    CGPathRelease(dotteShapePath);
    //把绘制好的虚线添加上来
    [self.layer addSublayer:dotteShapeLayer];
}


@end


