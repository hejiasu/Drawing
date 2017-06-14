//
//  DrawingBoardVC.m
//  Drawing
//
//  Created by user on 2017/6/14.
//  Copyright © 2017年 xiaoyi. All rights reserved.
//

#import "DrawingBoardVC.h"

@interface DrawPath : UIBezierPath
@property (nonatomic,strong) UIColor *pathColor;

@end
@implementation DrawPath



@end

@interface DrawView : UIView
@property (nonatomic,strong) DrawPath *path;
@property (nonatomic,strong) NSMutableArray *pathArray;
@property (nonatomic,assign) float lineWidth;
@property (nonatomic,strong) UIColor *lineColor;
@property (nonatomic,strong) UIImage *image;

-(void)clear;
-(void)unDo;
@end

@implementation DrawView

#pragma mark - 仅仅在加载xib时加载
-(void)awakeFromNib{
    [super awakeFromNib];
    [self setUp];

}
#pragma mark - 仅仅在代码中初始化时加载
-(instancetype)initWithFrame:(CGRect)frame{
    
    if (self = [super initWithFrame:frame]) {
        [self setUp];
    }
    return self;
}

#pragma mark - 初始化设置
- (void)setUp{
    //给view添加一个是手势
    UIPanGestureRecognizer *panGesture = [[UIPanGestureRecognizer alloc]init];
    
    [panGesture addTarget:self action:@selector(pan:)];
    [self addGestureRecognizer:panGesture];
    
    self.lineWidth = 3;
    self.path.pathColor = [UIColor blackColor];
}

-(NSMutableArray *)pathArray{
    if (_pathArray == nil)
    {
        _pathArray = [NSMutableArray array];
    }
    return _pathArray;
}

-(void)pan:(UIPanGestureRecognizer *)pan{
    
    CGPoint currentP = [pan locationInView:self];

    if (pan.state == UIGestureRecognizerStateBegan){
        
        self.path = [[DrawPath alloc]init];
        self.path.lineWidth = self.lineWidth;
        self.path.pathColor = self.lineColor;
        
        //起点
        [self.path moveToPoint:currentP];
        //保存描述好的路径
        [self.pathArray addObject:self.path];
    }

    [self.path addLineToPoint:currentP];
    [self setNeedsDisplay];
}

#pragma mark-
-(void)drawRect:(CGRect)rect{
    
    for (DrawPath *path in self.pathArray) {
    
        if ([path isKindOfClass:[UIImage class]]){
            
            //绘制图片
            UIImage *image = (UIImage *)path;
            [image drawInRect:rect];
        }else{
            //画线
            [path.pathColor set];
            [path stroke];

        }
        
    }

}
-(void)clear{
    [self.pathArray removeAllObjects];
    [self setNeedsDisplay];
}
-(void)unDo{
    [self.pathArray removeLastObject];
    [self setNeedsDisplay];
}

-(void)setImage:(UIImage *)image{
    
    _image = image;
    [self.pathArray addObject:_image];
    [self setNeedsDisplay];
}




@end

@interface DrawingBoardVC ()<UINavigationControllerDelegate, UIImagePickerControllerDelegate>
@property (weak, nonatomic) IBOutlet DrawView *drawView;

@end

@implementation DrawingBoardVC
- (IBAction)valueChange:(UISlider *)sender {
    
    self.drawView.lineWidth = sender.value;
}

- (IBAction)colorChange:(UIButton *)sender {

    self.drawView.lineColor = sender.backgroundColor;
}

- (IBAction)clear:(id)sender {
    [self.drawView clear];
}

- (IBAction)unDo:(id)sender {
    [self.drawView unDo];

}

- (IBAction)earser:(id)sender {
    [self.drawView setLineColor:self.drawView.backgroundColor];

}


- (IBAction)markPhoto:(id)sender {
    //读取系统相册
    UIImagePickerController *imagePicker = [[UIImagePickerController alloc]init];
    
    imagePicker.sourceType = UIImagePickerControllerSourceTypeSavedPhotosAlbum;
    imagePicker.delegate = self;
    [self.navigationController presentViewController:imagePicker animated:YES completion:nil];
}
- (IBAction)save:(id)sender {
    
    UIGraphicsBeginImageContextWithOptions(self.drawView.bounds.size, NO, 0);
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    [self.drawView.layer renderInContext:ctx];
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    
    //image:写入的图片
    //self:监听图片保存的监听者
    //@selector:想要监听图片是否保存成功,保存完成的方法不可乱写，需要实现
    UIImageWriteToSavedPhotosAlbum(image, self, @selector(image:didFinishSavingWithError:contextInfo:), nil);

    
}

- (void)image:(UIImage *)image didFinishSavingWithError:(NSError *)error contextInfo:(void *)contextInfo{
    NSLog(@"保存成功");
}





- (void)viewDidLoad {
    [super viewDidLoad];


    self.title = @"画板";
}

#pragma mark- 当用户选择一个图片时调用
-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info{
    
    UIImage *image = info[@"UIImagePickerControllerOriginalImage"];
    self.drawView.image = image;
    [self.navigationController dismissViewControllerAnimated:YES completion:nil];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
