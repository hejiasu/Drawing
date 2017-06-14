//
//  DrawShapeVC.m
//  Drawing
//
//  Created by user on 2017/6/10.
//  Copyright © 2017年 xiaoyi. All rights reserved.
//

#import "DrawShapeVC.h"

@interface DrawShapeVC ()

@end

@implementation DrawShapeVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"画图形";
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

@interface DrawShapeView:UIView

@end

@implementation DrawShapeView
- (void)drawRect:(CGRect)rect{
 
    [self drawRectangular];
    [self drawRound];
    [self drawOval];
    [self drawRadian];
    [self drawFan];
}
#pragma mark-矩形
-(void)drawRectangular{
    //cornerRadius：圆角半径（绘制矩形的左上角开始，也就是0，5）
    UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(10, 10, 50, 50) cornerRadius:5];
    [path stroke];
}
#pragma mark-圆
-(void)drawRound{
    //cornerRadius：圆角半径，如果圆角半径等于正方形长或宽的一半，绘制出来就是圆
    UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(70, 10, 50, 50) cornerRadius:25];
    [path stroke];
    //路径填充，必须是一个完整的封闭路径
    [path fill];
}
#pragma mark-椭圆
-(void)drawOval{
    //cornerRadius：圆角半径，如果圆角半径等于正方形长或宽的一半，绘制出来就是圆
    UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(130, 10, 100, 50)];
    [path stroke];
}

#pragma mark- 弧
-(void)drawRadian{
    //圆的起点是中心点右边的点
    //ArcCenter:圆心坐标
    //radius:半径
    //startAngle:弧度起始角度
    //endAngle:弧度结束M_PI==180度
    //clockwise:YES:顺时针NO:逆时针
    UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:CGPointMake(50, 100) radius:25 startAngle:0 endAngle:M_PI/2 clockwise:YES];
    [path stroke];
}
#pragma mark- 扇形
-(void)drawFan{
    
    UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:CGPointMake(100, 100) radius:25 startAngle:0 endAngle:M_PI/2 clockwise:YES];
    CGPoint center = CGPointMake(100, 100);
    //添加一根线到圆心
    [path addLineToPoint:center];
    //关闭路径，是从终点到起点
    [path closePath];
    [path stroke];

    //使用填充，默认就会自动关闭路径，（终点到起点）
    [path fill];
}
@end






























