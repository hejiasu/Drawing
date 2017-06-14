//
//  DrawTextAndImageVC.m
//  Drawing
//
//  Created by user on 2017/6/11.
//  Copyright © 2017年 xiaoyi. All rights reserved.
//

#import "DrawTextAndImageVC.h"

@interface DrawTextView:UIView
@end

@implementation DrawTextView

- (void)drawRect:(CGRect)rect{

    //不会换行
    [self drawTextAttribute];
    
    //会换行
    [self drawTextAttributeWithRect:rect];

}

-(void)drawTextAttributeWithRect:(CGRect)rect{
    NSString *text = @"hello worldhello worldhello worldhello worldhello worldhello worldhello worldhello worldhello worldhello worldhello worldhello worldhello worldhello worldhello worldhello worldhello worldhello worldhello worldhello worldhello worldhello worldhello worldhello worldhello worldhello worldhello worldhello worldhello worldhello world";

    [text drawInRect:rect withAttributes:nil];
}

-(void)drawTextAttribute{
    
    NSString *text = @"hello worldhello worldhello worldhello worldhello worldhello worldhello worldhello worldhello worldhello worldhello worldhello worldhello worldhello worldhello worldhello worldhello worldhello worldhello worldhello worldhello worldhello worldhello worldhello worldhello worldhello worldhello worldhello worldhello worldhello world";

    //设置阴影
    NSShadow *shadow = [[NSShadow alloc]init];
    shadow.shadowColor = [UIColor orangeColor];
    shadow.shadowOffset = CGSizeMake(5, 5);
    shadow.shadowBlurRadius = 3;
    
    
    //Point:文字起点
    //Attributes:文本属性(给普通文字添加颜色和字典，字体大小等等)
    NSDictionary *dic = @{
                          NSForegroundColorAttributeName:[UIColor redColor],/*颜色*/
                          NSFontAttributeName:[UIFont systemFontOfSize:30.0],/*大小*/
                          NSStrokeWidthAttributeName:@3,/*设置空心宽度*/
                          NSShadowAttributeName:shadow/*设置阴影*/
                          };
    
    [text drawAtPoint:CGPointZero withAttributes:dic];
}
@end

@interface DrawImageView:UIView
@end

@implementation DrawImageView

- (void)drawRect:(CGRect)rect{
    
    //图片裁剪（需要放在前面）
    UIRectClip(CGRectMake(0, 0, 50,50));
    
    UIImage *image =[UIImage imageNamed:@"v"];
    //默认绘制的内容和图片尺寸一样大
    [image drawAtPoint:CGPointZero];
    //会把图片放置在一定范围内（会压缩）
//    [image drawInRect:rect];
    //图片平铺（图片不会压缩）
//    [image drawAsPatternInRect:rect];
    
}

@end

@interface DrawTextAndImageVC ()

@end

@implementation DrawTextAndImageVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"绘制文字和图片";
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
@end

