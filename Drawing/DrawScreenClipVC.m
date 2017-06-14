//
//  DrawScreenClipVC.m
//  Drawing
//
//  Created by user on 2017/6/12.
//  Copyright © 2017年 xiaoyi. All rights reserved.
//

#import "DrawScreenClipVC.h"

@interface DrawScreenClipVC ()

@end

@implementation DrawScreenClipVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"截屏";

    
    //UIImage转换为NSData
    NSData *imageData = UIImagePNGRepresentation([self imageWithCaputureView:self.view]);
    [imageData writeToFile:@"/Users/user/Desktop/Drawing/Drawing/image.png" atomically:YES];

}

- (UIImage *)imageWithCaputureView:(UIView *)view
{
    //创建位图上下文
    UIGraphicsBeginImageContextWithOptions(self.view.bounds.size, NO, 0);
    //获取当前上下文
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    //把view的layer层渲染到上下文,layer只能渲染不能绘制，所以在此前需要获取当前上下文
    [self.view.layer renderInContext:ctx];
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    //关闭上下文
    UIGraphicsEndImageContext();
    
    return image;
}







- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
