
//
//  DrawPieChartVC.m
//  Drawing
//
//  Created by user on 2017/6/11.
//  Copyright © 2017年 xiaoyi. All rights reserved.
//

#import "DrawPieChartVC.h"

@interface DrawPieChartVC ()

@end

@implementation DrawPieChartVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"饼图";
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end




@interface PieChartView:UIView
@end

@implementation PieChartView

- (void)drawRect:(CGRect)rect{
    
   
    
    //数据源
    NSArray *numberArray = @[@25,@15,@30,@10,@20];
    NSArray *colorArray = @[[UIColor redColor],[UIColor yellowColor],[UIColor purpleColor],[UIColor greenColor],[UIColor orangeColor]];
    
    //半径
    CGFloat radius = rect.size.width / 2;
    //中心点
    CGPoint center = CGPointMake(radius, radius);
    
    //起始角度
    CGFloat startA = 0;
    //弧度
    CGFloat angle = 0;
    //结束角度
    CGFloat endA = 0;

    
    for (int i = 0; i < numberArray.count; i ++) {
       
        startA = endA;
        angle = [numberArray[i] floatValue] / 100.0 * M_PI * 2;
        endA = startA + angle;
        
        [self pieChartWithCenter:center withRadius:radius withStartAngle:startA withEndAngle:endA withColor:colorArray[i]];

    }
    
}

-(void)pieChartWithCenter:(CGPoint)center withRadius:(CGFloat)radius withStartAngle:(CGFloat)startA withEndAngle:(CGFloat)endA withColor:(UIColor*)color{
   
    //画弧
    UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:center radius:radius startAngle:startA endAngle:endA clockwise:YES];
    
    //添加一根线到圆心
    [path addLineToPoint:center];
    
    //设置颜色(描边和填充通用)
    [color setFill];
    
    [path fill];
}


@end
































