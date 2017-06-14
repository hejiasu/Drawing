//
//  DrawUnlockVC.m
//  Drawing
//
//  Created by user on 2017/6/13.
//  Copyright © 2017年 xiaoyi. All rights reserved.
//

#import "DrawUnlockVC.h"

@interface  VCView: UIView

@end

@implementation VCView

-(void)drawRect:(CGRect)rect{
    
    UIImage *image = [UIImage imageNamed:@"Home_refresh_bg"];
    [image drawInRect:rect];
}
@end


@interface LockView : UIView
@property (nonatomic,strong) NSMutableArray *slectedArray;
@property (nonatomic,assign) CGPoint currentP;

@end

@implementation LockView

-(NSMutableArray *)slectedArray{
    if (_slectedArray == nil) {
        _slectedArray = [[NSMutableArray alloc]init];
    }

    return _slectedArray;
}

//加载完xib时调用
-(void)awakeFromNib{
    
    [super awakeFromNib];

    
    //给view添加一个是手势
    UIPanGestureRecognizer *panGesture = [[UIPanGestureRecognizer alloc]init];
    
    [panGesture addTarget:self action:@selector(pan:)];
    [self addGestureRecognizer:panGesture];
    
    
    //创建9个按钮
    for (int i =0; i < 9; i++) {
        UIButton *but = [UIButton buttonWithType:UIButtonTypeCustom];
        //不允许用户交互，按钮就不能点击，也就不能达到高亮状态
        [but setUserInteractionEnabled:NO];
        [but setImage:[UIImage imageNamed:@"gesture_node_normal"] forState:UIControlStateNormal];
        [but setTag:i];
        [but setImage:[UIImage imageNamed:@"gesture_node_highlighted"] forState:UIControlStateSelected];
        
        
        [self addSubview:but];
    }
    
    

}

#pragma mark-为什么要在这个方法布局子控件，因为只要一调用这个方法，就表示父控件的尺寸确定了
-(void)layoutSubviews{
    
    [super layoutSubviews];
    
    NSInteger count = self.subviews.count;

    NSInteger cols = 3;//总列数
    
    CGFloat x = 0;
    CGFloat y = 0;
    CGFloat w = 74;
    CGFloat h = 74;
    CGFloat margin = (self.bounds.size.width - cols * w) / (cols + 1);
    
    CGFloat col = 0;
    CGFloat row = 0;
    
    
    for (int i = 0; i < count; i++) {
        UIButton *but = self.subviews[i];
        
        col = i % cols;
        row = i / cols;
        x = margin + col * (margin + w);
        y = row * (margin + w);
        
        but.frame = CGRectMake(x, y, w, h);
    }
}


-(void)pan:(UIPanGestureRecognizer *)pan{

    //获取当前点
    self.currentP = [pan locationInView:self];
    
    //判断触摸点在不在按钮上
    for (UIButton *but in self.subviews) {
        
        //判断点在不在某个范围内,按钮有没有选中
        if(CGRectContainsPoint(but.frame,self.currentP) && but.selected == NO){
            [but setSelected:YES];
            [self.slectedArray addObject:but];
        }
        
    }
    //重绘
    [self setNeedsDisplay];
    
    if(pan.state == UIGestureRecognizerStateEnded){
        
        
        
        
        //还原界面
        
        //取消选中按钮
        NSMutableString *str = [NSMutableString string];
        for (UIButton *button in self.slectedArray) {
            [button setSelected:NO];
            [str appendFormat:@"%ld",button.tag];
        }
        
        NSLog(@"本次输入密码%@",str);
        
        
        //清楚画线,把选中按钮清空
        [self.slectedArray removeAllObjects];
        
    }

}



//只要调用这个方法，就会把之前绘制的所有的东西全部清空
-(void)drawRect:(CGRect)rect{
    
    //没有选中按钮不需要连线
    if (self.slectedArray.count == 0) return;
    
    
    //把所有选中按钮中心连接
    UIBezierPath *path = [UIBezierPath bezierPath];
    
    //把所有选中按钮连好线
    for (int i = 0; i < self.slectedArray.count;i++) {
       
        UIButton *buton = self.slectedArray[i];
        if (i == 0){
            //设置起点
            [path moveToPoint:buton.center];

        }else{
            [path addLineToPoint:buton.center];
        }
    }
    
    
    //连线到手指接触点
    [path addLineToPoint:self.currentP];
    
    
    [[UIColor redColor] set];
    [path setLineWidth:5];
    [path setLineJoinStyle:kCGLineJoinRound];
    [path stroke];
    
    
    
    
}

@end



@interface DrawUnlockVC ()

@end

@implementation DrawUnlockVC

- (void)viewDidLoad {
   
    [super viewDidLoad];

    self.title = @"手势解锁";

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
