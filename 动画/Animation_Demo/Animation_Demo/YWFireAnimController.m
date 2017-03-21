//
//  YWFireAnimController.m
//  Animation_Demo
//
//  Created by yangbin on 2017/2/8.
//  Copyright © 2017年 yangbin. All rights reserved.
//
// 粒子动画

#import "YWFireAnimController.h"

@interface YWFireAnimController ()
{
    // 发射器对象
    CAEmitterLayer *fireEmitter;
    UIImageView *candleIV;
}
@end

@implementation YWFireAnimController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor blackColor];
    
    fireEmitter = [CAEmitterLayer layer];
    
    // 发射器在xy平面的中心
    fireEmitter.emitterPosition = self.view.center;
    
//    fireEmitter.emitterSize = CGSizeMake(20, 60);
    
    // 发射器的形状
    fireEmitter.emitterShape = kCAEmitterLayerCircle;
    
    // 发射器渲染模式
    fireEmitter.renderMode = kCAEmitterLayerAdditive;
    
    // 发射单元 -- 火焰🔥
    CAEmitterCell *fire = [CAEmitterCell emitterCell];
    
    // 粒子的创建速率，默认为1/s
    fire.birthRate = 200;

    // 粒子的存活时间
    fire.lifetime = 0.2;
    
    // 粒子的生存时间容差
    fire.lifetimeRange = 0.5;
    fire.color = [UIColor colorWithRed:0.8 green:0.4 blue:0.2 alpha:0.1].CGColor;
    fire.contents = (id)[[UIImage imageNamed:@"fire.png"] CGImage];
    fire.name = @"fire";
    
    // 粒子的速度
    fire.velocity = 35;
    // 粒子动画的速度容差
    fire.velocityRange = 10;
    // 粒子在xy平面的发射角度
    fire.emissionLongitude = M_PI + M_PI_2;
    
    // 粒子发射角度的容差
    fire.emissionRange = M_PI_2;
    // 缩放速度
    fire.scaleSpeed = 0.3;
    
    // 旋转度
//    fire.spin = 0.2;
    
    fireEmitter.emitterCells = @[fire];
    [self.view.layer addSublayer:fireEmitter];
    
    // Do any additional setup after loading the view.
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
