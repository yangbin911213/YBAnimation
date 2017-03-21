//
//  YWWaterWaveController.m
//  Animation_Demo
//
//  Created by yangbin on 2017/2/8.
//  Copyright © 2017年 yangbin. All rights reserved.
//

#import "YWWaterWaveController.h"

@interface YWWaterWaveController ()
{
    CGFloat offsetX;
    CGFloat waveSpeed;
    CGFloat currentK;
    CGFloat waterWaveWidth;
    CGFloat waveA;
    CGFloat waveW;
    CAShapeLayer *firstWaveLayer;
    CAShapeLayer *secondWaveLayer;
}
@end

@implementation YWWaterWaveController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    CADisplayLink *waveDisplaylink = [[CADisplayLink alloc] init];
    firstWaveLayer = [[CAShapeLayer alloc]init];
    secondWaveLayer = [[CAShapeLayer alloc] init];
    
    // 水纹振幅
    waveA = 10;
    
    // 水纹周期
    waveW = 1/30.0;
    
    // 位移
    offsetX = 0;
    
    // 当前波浪高度Y
    currentK = 0;
    
    // 水纹速度
    waveSpeed = 0;
    
    
    // 波浪宽度
    waterWaveWidth = self.view.bounds.size.width;
    
    // 波浪颜色
    UIColor *firstWaveColor = [UIColor greenColor];
    
    // 波浪速度
    waveSpeed = 0.4 / M_PI;
    
    // 设置闭环的颜色
    firstWaveLayer.fillColor = [UIColor colorWithRed:73/255.0 green:142/255.0 blue:178/255.0 alpha:0.5].CGColor;
    
    // 设置边缘线的颜色
//    firstWaveLayer.strokeColor = [UIColor redColor].CGColor;
    
    firstWaveLayer.strokeStart = 0.0;
    firstWaveLayer.strokeEnd = 0.8;
    
    // 设置闭环的颜色
//    secondWaveLayer.strokeColor = [UIColor yellowColor].CGColor;
    secondWaveLayer.fillColor =[UIColor colorWithRed:73/255.0 green:142/255.0 blue:178/255.0 alpha:0.5].CGColor;
    secondWaveLayer.strokeStart = 0.0;
    secondWaveLayer.strokeEnd = 0.8;
    
    [self.view.layer addSublayer:firstWaveLayer];
    [self.view.layer addSublayer:secondWaveLayer];
    
    // 设置波浪流动速度
    waveSpeed = 0.05;
    
    // 设置振幅
    waveA = 8;
    
    // 设置周期
    waveW = (2 * M_PI) / self.view.bounds.size.width;
    
    // 设置波浪纵向位置
    currentK = self.view.bounds.size.height / 2;
    
    waveDisplaylink = [CADisplayLink displayLinkWithTarget:self selector:@selector(getCurrentWave)];
    [waveDisplaylink addToRunLoop:[NSRunLoop currentRunLoop] forMode:NSRunLoopCommonModes];
    
    
    // Do any additional setup after loading the view.
}

- (void)getCurrentWave {
    
    // 实时位移
    offsetX += waveSpeed;
    [self setCurrentFirstWaveLayerPath];
}

- (void)setCurrentFirstWaveLayerPath {
    
    // 创建一个路径
    CGMutablePathRef path = CGPathCreateMutable();
    CGFloat y = currentK;
    CGPathMoveToPoint(path, NULL, 0, y);
    
    for (CGFloat i = 0; i < waterWaveWidth; i ++) {
        y = waveA * sin(waveW * i + offsetX) + currentK;
        CGPathAddLineToPoint(path, NULL, i, y);
    }
    
    CGPathAddLineToPoint(path, NULL, waterWaveWidth, self.view.bounds.size.height);
    CGPathAddLineToPoint(path, NULL, 0, self.view.bounds.size.height);
    CGPathCloseSubpath(path);
    
    firstWaveLayer.path = path;
    
    
    // 创建一个路径
    
    CGMutablePathRef path2 = CGPathCreateMutable();
    CGFloat y2 = currentK;
    CGPathMoveToPoint(path2, NULL, 0, y2);
    for (CGFloat i = 0; i < waterWaveWidth; i ++) {
        y2 = waveA * sin(waveW * i + offsetX - waterWaveWidth / 2) + currentK;
        CGPathAddLineToPoint(path2, NULL, i, y2);
    }
    
    CGPathAddLineToPoint(path2, NULL, waterWaveWidth, self.view.bounds.size.height);
    CGPathAddLineToPoint(path2, NULL, 0, self.view.bounds.size.height);
    CGPathCloseSubpath(path2);
    
    secondWaveLayer.path = path2;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
