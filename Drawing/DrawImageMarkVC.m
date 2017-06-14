//
//  DrawImageMarkVC.m
//  Drawing
//
//  Created by user on 2017/6/12.
//  Copyright © 2017年 xiaoyi. All rights reserved.
//

#import "DrawImageMarkVC.h"

@interface DrawImageMarkVC ()
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation DrawImageMarkVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"绘制水印";
    
    UIImage *image = [UIImage imageNamed:@"s"];
    /*
     size：位图上下文尺寸（新图片的尺寸）
     opaque：不透明YES，透明NO，通常一般是透明上下文
     scale：缩放，通常不需要缩放，取值为0表示不缩放，
     */
    UIGraphicsBeginImageContextWithOptions(image.size, NO, 0);

    //2、绘制原生图片
    [image drawAtPoint:CGPointZero];
    
    //3、给原生图片添加文字
    NSString *str = @"内涵段子";
    NSDictionary *dic = @{
                          NSForegroundColorAttributeName : [UIColor redColor],
                          NSFontAttributeName : [UIFont systemFontOfSize:20.0],

                          };
    [str drawAtPoint:CGPointMake(40, 0) withAttributes:dic];
    
    //给原生图片添加图片
    UIImage *imageMack = [UIImage imageNamed:@"a"];
    [imageMack drawInRect:CGRectMake(0, 0, 40, 40)];
    
    
    
    
    //4、从上下文中获取生成新图片
    UIImage *getImage = UIGraphicsGetImageFromCurrentImageContext();
    

    
    //5、关闭上下文
    UIGraphicsEndImageContext();
    
    
    self.imageView.image = getImage;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end


