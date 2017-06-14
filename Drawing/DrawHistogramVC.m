//
//  DrawHistogramVC.m
//  Drawing
//
//  Created by user on 2017/6/11.
//  Copyright © 2017年 xiaoyi. All rights reserved.
//

#import "DrawHistogramVC.h"

@interface DrawHistogramVC ()

@end

@implementation DrawHistogramVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"柱状图";
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

@interface HistogramView:UIView

@end

@implementation HistogramView

- (void)drawRect:(CGRect)rect{
    
    
    
    
    //数据源
    NSArray *numberArray = @[@25,@15,@30,@10,@20];
    NSArray *colorArray = @[[UIColor redColor],[UIColor yellowColor],[UIColor purpleColor],[UIColor greenColor],[UIColor orangeColor]];
    
    CGFloat x = 0;
    CGFloat y = 0;
    CGFloat w = 0;
    CGFloat h = 0;

    for (int i = 0; i < numberArray.count; i ++) {
        
        w = rect.size.width / (2 *numberArray.count - 1);
        x = 2 * w * i;
        h = [numberArray[i] floatValue] / 100 * rect.size.height;
        y = rect.size.height - h;
        UIBezierPath *path = [UIBezierPath bezierPathWithRect:CGRectMake(x, y, w, h)];
        
        [colorArray[i] setFill];

        [path fill];
        
    }
    
}


@end































