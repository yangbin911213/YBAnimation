//
//  YWDrawLineController.m
//  Animation_Demo
//
//  Created by yangbin on 2017/2/8.
//  Copyright © 2017年 yangbin. All rights reserved.
//

#import "YWDrawLineController.h"

@interface YWDrawLineController ()

@end

@implementation YWDrawLineController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIBezierPath *beziePaht = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(50, 100, 250, 500)];
    CAShapeLayer *shapeLayer = [[CAShapeLayer alloc] init];
    shapeLayer.strokeColor = [UIColor purpleColor].CGColor;
    shapeLayer.fillColor = [UIColor clearColor].CGColor;
    shapeLayer.lineWidth = 2;
    shapeLayer.lineJoin = kCALineJoinRound;
    shapeLayer.lineCap = kCALineCapRound;
    shapeLayer.path = beziePaht.CGPath;
    [self.view.layer addSublayer:shapeLayer];
    
    CABasicAnimation *pathAnim = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    pathAnim.duration = 5;
    pathAnim.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    pathAnim.fromValue = @0;
    pathAnim.toValue = @1;
    pathAnim.autoreverses = YES;
    pathAnim.fillMode = kCAFillModeForwards;
    pathAnim.repeatCount = INFINITY;
    [shapeLayer addAnimation:pathAnim forKey:@"strokeEndAnim"];
    
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
