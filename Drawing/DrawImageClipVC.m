//
//  DrawImageClipVC.m
//  Drawing
//
//  Created by user on 2017/6/13.
//  Copyright © 2017年 xiaoyi. All rights reserved.
//

#import "DrawImageClipVC.h"

@interface DrawImageClipVC ()
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation DrawImageClipVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"图形裁剪";
    
    UIImage *image = [UIImage imageNamed:@"a"];
    
    self.imageView.image = [self imageWithClipImage:image withBorderWidth:4 withBorderColor:[UIColor orangeColor]];
}



/**
 圆形头像截取
 
 @param image 要处理的头像图片
 @param border 圆环宽度
 @param color 圆环颜色
 @return 处理完的头像图片
 */
-(UIImage *)imageWithClipImage:(UIImage *)image withBorderWidth:(CGFloat)border withBorderColor:(UIColor *)color{
    
    //设置圆环的宽度
    CGFloat backImageWH = image.size.width + 2 * border;
    
    //创建位图上下文，大小和原图一样大
    UIGraphicsBeginImageContextWithOptions(CGSizeMake(backImageWH, backImageWH), NO, 0);
    //画底色大圆
    UIBezierPath *backPath = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(0,0,backImageWH, backImageWH)];
    [color set];
    [backPath fill];
    
    
    //设置圆形裁剪区域，正切与图片
    UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(border,border,image.size.width, image.size.height)];
    
    //把路径设置为裁剪区域
    [path addClip];
    
    //绘制图片
    [image drawAtPoint:CGPointMake(border, border)];
    
    //从上下文获取图片
    UIImage *clipImage = UIGraphicsGetImageFromCurrentImageContext();
    //关闭上下文
    UIGraphicsEndImageContext();
    
    
    
    return clipImage;
}



@end
