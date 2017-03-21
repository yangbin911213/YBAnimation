//
//  YWBasicAnimController.m
//  Animation_Demo
//
//  Created by yangbin on 2017/2/8.
//  Copyright © 2017年 yangbin. All rights reserved.
//

#import "YWBasicAnimController.h"

@interface YWBasicAnimController ()

@end

@implementation YWBasicAnimController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    /**------------------------旋转动画-------------------------------------*/
    UIView *rorationViewX = [[UIView alloc] initWithFrame:CGRectMake(20, 100, 70, 70)];
    rorationViewX.backgroundColor = [UIColor redColor];
    [self.view addSubview:rorationViewX];
    CABasicAnimation *rotationAnimX = [CABasicAnimation animationWithKeyPath:@"transform.rotation.x"];
    rotationAnimX.beginTime = 0.0;
    rotationAnimX.toValue = @(2*M_PI);
    rotationAnimX.duration = 1.5;
    rotationAnimX.repeatCount = INFINITY;
    [rorationViewX.layer addAnimation:rotationAnimX forKey:@"rotationAnimX"];
    
    UIView *rorationViewY = [[UIView alloc] initWithFrame:CGRectMake(150, 100, 70, 70)];
    rorationViewY.backgroundColor = [UIColor redColor];
    [self.view addSubview:rorationViewY];
    CABasicAnimation *rotationAnimY = [CABasicAnimation animationWithKeyPath:@"transform.rotation.y"];
    rotationAnimY.beginTime = 0.0;
    rotationAnimY.toValue = @(2*M_PI);
    rotationAnimY.duration = 1.5;
    rotationAnimY.repeatCount = INFINITY;
    [rorationViewY.layer addAnimation:rotationAnimY forKey:@"rotationAnimY"];
    
    UIView *rorationViewZ = [[UIView alloc] initWithFrame:CGRectMake(280, 100, 70, 70)];
    rorationViewZ.backgroundColor = [UIColor redColor];
    [self.view addSubview:rorationViewZ];
    CABasicAnimation *rotationAnimZ = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    rotationAnimZ.beginTime = 0.0;
    rotationAnimZ.toValue = @(2*M_PI);
    rotationAnimZ.duration = 1.5;
    rotationAnimZ.repeatCount = INFINITY;
    [rorationViewZ.layer addAnimation:rotationAnimZ forKey:@"rotationAnimZ"];
    
    /**------------------------移动动画-------------------------------------*/
    UIView *moveView = [[UIView alloc] initWithFrame:CGRectMake(20, 240, 70, 70)];
    moveView.center = CGPointMake(40, 200);
    moveView.backgroundColor = [UIColor redColor];
    [self.view addSubview:moveView];
    CABasicAnimation *moveAnim = [CABasicAnimation animationWithKeyPath:@"position"];
    moveAnim.fromValue = [NSValue valueWithCGPoint:CGPointMake(40, 240)];
    moveAnim.toValue = [NSValue valueWithCGPoint:CGPointMake(300, 240)];
    moveAnim.duration = 2;
    moveAnim.repeatCount = INFINITY;
    moveAnim.autoreverses = true; // 动画结束时是否进行逆动画
    
    [moveView.layer addAnimation:moveAnim forKey:@"moveAnim"];
    
    /**------------------------背景颜色变化动画-----------------------------------*/
    UIView *colorView = [[UIView alloc] initWithFrame:CGRectMake(20, 310, 70, 70)];
    colorView.backgroundColor = [UIColor redColor];
    [self.view addSubview:colorView];
    CABasicAnimation *colorAnim = [CABasicAnimation animationWithKeyPath:@"backgroundColor"];
    colorAnim.fromValue = (id)[UIColor redColor].CGColor;
    colorAnim.toValue = (id)[UIColor greenColor].CGColor;
    colorAnim.autoreverses = true;
    colorAnim.repeatCount = INFINITY;
    colorAnim.duration = 2;
    [colorView.layer addAnimation:colorAnim forKey:@"colorAnim"];
    
    
    /**------------------------内容变化动画-------------------------------------*/
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(150, 310, 70, 70)];
    imageView.image = [UIImage imageNamed:@"from"];
    [self.view addSubview:imageView];
    CABasicAnimation *contentsAnim = [CABasicAnimation animationWithKeyPath:@"contents"];
    contentsAnim.toValue = (id)[UIImage imageNamed:@"to"].CGImage;
    contentsAnim.duration = 1.5;
    contentsAnim.autoreverses = true;
    contentsAnim.repeatCount = INFINITY;
    [imageView.layer addAnimation:contentsAnim forKey:@"contentsAnim"];
    
    
    /**------------------------圆角变化动画-------------------------------------*/
    UIView *cornerRadiusView = [[UIView alloc] initWithFrame:CGRectMake(280, 310, 70, 70)];
    cornerRadiusView.backgroundColor = [UIColor redColor];
    [self.view addSubview:cornerRadiusView];
    cornerRadiusView.layer.masksToBounds = YES;
    CABasicAnimation *cornerRadiusAnim = [CABasicAnimation animationWithKeyPath:@"cornerRadius"];
    cornerRadiusAnim.toValue = @(35);
    cornerRadiusAnim.duration = 2;
    cornerRadiusAnim.autoreverses = true;
    cornerRadiusAnim.repeatCount = INFINITY;
    [cornerRadiusView.layer addAnimation:cornerRadiusAnim forKey:@"cornerRadiusAnim"];
    
    /**------------------------比例缩放动画-------------------------------------*/
    UIView *scaleView = [[UIView alloc] initWithFrame:CGRectMake(20, 410, 70, 70)];
    scaleView.backgroundColor = [UIColor redColor];
    [self.view addSubview:scaleView];
    CABasicAnimation *scaleAnim = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    scaleAnim.fromValue = @(0.3);
    scaleAnim.toValue = @(1.3);
    scaleAnim.duration = 2;
    scaleAnim.autoreverses = YES;
    scaleAnim.repeatCount = INFINITY;
    [scaleView.layer addAnimation:scaleAnim forKey:@"scaleAnim"];
    
    /**------------------------比例缩放动画X-------------------------------------*/
    UIView *scaleViewX = [[UIView alloc] initWithFrame:CGRectMake(150, 410, 70, 70)];
    scaleViewX.backgroundColor = [UIColor redColor];
    [self.view addSubview:scaleViewX];
    CABasicAnimation *scaleAnimX = [CABasicAnimation animationWithKeyPath:@"transform.scale.x"];
    scaleAnimX.fromValue = @(0.3);
    scaleAnimX.toValue = @(1.3);
    scaleAnimX.duration = 2;
    scaleAnimX.autoreverses = YES;
    scaleAnimX.repeatCount = INFINITY;
    [scaleViewX.layer addAnimation:scaleAnimX forKey:@"scaleAnimX"];
    
    /**------------------------比例缩放动画Y-------------------------------------*/
    UIView *scaleViewY = [[UIView alloc] initWithFrame:CGRectMake(280, 410, 70, 70)];
    scaleViewY.backgroundColor = [UIColor redColor];
    [self.view addSubview:scaleViewY];
    CABasicAnimation *scaleAnimY = [CABasicAnimation animationWithKeyPath:@"transform.scale.y"];
    scaleAnimY.fromValue = @(0.3);
    scaleAnimY.toValue = @(1.3);
    scaleAnimY.duration = 2;
    scaleAnimY.autoreverses = YES;
    scaleAnimY.repeatCount = INFINITY;
    [scaleViewY.layer addAnimation:scaleAnimY forKey:@"scaleAnimY"];
    
    /**------------------------指定大小缩放-------------------------------------*/
    UIView *boundsView = [[UIView alloc] initWithFrame:CGRectMake(40, 520, 20, 80)];
    boundsView.backgroundColor = [UIColor redColor];
    [self.view addSubview:boundsView];
    CABasicAnimation *boundsAnim = [CABasicAnimation animationWithKeyPath:@"bounds"];
    boundsAnim.toValue = [NSValue valueWithCGRect:CGRectMake(800, 500, 90, 30)];
    boundsAnim.duration = 2;
    boundsAnim.autoreverses = YES;
    boundsAnim.repeatCount = INFINITY;
    [boundsView.layer addAnimation:boundsAnim forKey:@"boundsAnim"];
    
    /**------------------------透明动画-------------------------------------*/
    UIView *alphaView = [[UIView alloc] initWithFrame:CGRectMake(150, 520, 70, 70)];
    alphaView.backgroundColor = [UIColor redColor];
    [self.view addSubview:alphaView];
    CABasicAnimation *alphaAnim = [CABasicAnimation animationWithKeyPath:@"opacity"];
    alphaAnim.fromValue = @(0.3);
    alphaAnim.toValue = @(1);
    alphaAnim.duration = 0.6;
    alphaAnim.autoreverses = YES;
    alphaAnim.repeatCount = INFINITY;
    [alphaView.layer addAnimation:alphaAnim forKey:@"alphaAnim"];
    
    /**------------------------组合动画-------------------------------------*/
    UIView *groupView = [[UIView alloc] initWithFrame:CGRectMake(280, 520, 70, 70)];
    groupView.backgroundColor = [UIColor orangeColor];
    [self.view addSubview:groupView];
    CAAnimationGroup *group = [CAAnimationGroup animation];
    group.animations = [NSArray arrayWithObjects:boundsAnim,alphaAnim, nil];
    group.duration = 0.7;
    group.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut]; // 速度控制函数
    group.autoreverses = YES;
    group.repeatCount = INFINITY;
    [groupView.layer addAnimation:group forKey:@"group"];
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
