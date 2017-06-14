//
//  ViewController.m
//  Drawing
//
//  Created by user on 2017/6/9.
//  Copyright © 2017年 xiaoyi. All rights reserved.
//


#import "ViewController.h"
@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic,strong) NSArray *textArray;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"All kinds of drawing";
    self.automaticallyAdjustsScrollViewInsets = NO;
}


-(NSArray *)textArray{
    if (!_textArray) {
        _textArray = @[@"画线",@"画图形",@"环形进度条",@"饼图",@"柱状图",@"绘制文字和图片",@"绘制水印",@"平移缩放旋转",@"图形裁剪",@"截屏",@"截图",@"图片擦除",@"手势解锁",@"画板"];
        
    }
    return _textArray;
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.textArray.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *identifer = @"baseCell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifer];
    
    if (!cell){
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifer];
    }
    cell.textLabel.text = self.textArray[indexPath.row];
    return cell;
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    switch (indexPath.row) {
        case 0:{
            [self performSegueWithIdentifier:@"toDrawLineVC" sender:self];
            
        }
            break;
        case 1:{
            [self performSegueWithIdentifier:@"toDrawShapeVC" sender:self];

        }
            break;
        case 2:{
         
            [self performSegueWithIdentifier:@"toDrawProgress" sender:self];
        }
            break;
        case 3:{
            [self performSegueWithIdentifier:@"toDrawPieChart" sender:self];
        }
            break;
        case 4:{
            [self performSegueWithIdentifier:@"toDrawHistogram" sender:self];
        }
            break;
        case 5:{
            [self performSegueWithIdentifier:@"toDrawTextAndImage" sender:self];
        }
            break;
        case 6:{
            [self performSegueWithIdentifier:@"toDrawImageMark" sender:self];
        }
            break;
        case 7:{
            [self performSegueWithIdentifier:@"toDrawMatrix" sender:self];
        }
            break;
        case 8:{
            [self performSegueWithIdentifier:@"toDrawImageClip" sender:self];
        }
            break;
        case 9:{
            [self performSegueWithIdentifier:@"toDrawScreenClip" sender:self];
        }
            break;
        case 10:{
            [self performSegueWithIdentifier:@"toDrawPicture" sender:self];
        }
            break;
        case 11:{
            [self performSegueWithIdentifier:@"toDrawPictureClear" sender:self];
        }
            break;
        case 12:{
            [self performSegueWithIdentifier:@"toDrawUnlock" sender:self];
        }
            break;
        case 13:{
            [self performSegueWithIdentifier:@"toDrawingBoard" sender:self];
        }
            break;
        default:
            break;
    }
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
