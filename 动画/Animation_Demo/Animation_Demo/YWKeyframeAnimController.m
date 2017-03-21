//
//  YWKeyframeAnimController.m
//  Animation_Demo
//
//  Created by yangbin on 2017/2/8.
//  Copyright © 2017年 yangbin. All rights reserved.
//

#import "YWKeyframeAnimController.h"

@interface YWKeyframeAnimController ()

@end

@implementation YWKeyframeAnimController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIView *tempView = [[UIView alloc] initWithFrame:CGRectMake(50, 100, 250, 250)];
    
    UIBezierPath *bezierPath = [UIBezierPath bezierPathWithOvalInRect:tempView.frame];
    UIView *animView = [[UIView alloc] initWithFrame:CGRectMake(50, 50, 70, 80)];
    animView.backgroundColor = [UIColor redColor];
    [self.view addSubview:animView];
    
    CAKeyframeAnimation *orbitAnim = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    orbitAnim.duration = 5;
    orbitAnim.path = bezierPath.CGPath;
    orbitAnim.calculationMode = kCAAnimationPaced;
    orbitAnim.fillMode = kCAFillModeForwards;
    orbitAnim.repeatCount = INFINITY;
    orbitAnim.rotationMode = kCAAnimationRotateAutoReverse;
    [animView.layer addAnimation:orbitAnim forKey:@"orbitAnim"];
    
    CAShapeLayer *shapeLayer = [[CAShapeLayer alloc] init];
    shapeLayer.strokeColor = [UIColor purpleColor].CGColor;
    shapeLayer.fillColor = [UIColor clearColor].CGColor;
    shapeLayer.lineWidth = 0.5;
    shapeLayer.lineJoin = kCALineJoinRound;
    shapeLayer.lineCap = kCALineCapRound;
    shapeLayer.path = bezierPath.CGPath;
    [self.view.layer addSublayer:shapeLayer];
    
    
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
