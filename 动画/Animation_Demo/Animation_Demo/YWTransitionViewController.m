//
//  YWTransitionViewController.m
//  Animation_Demo
//
//  Created by yangbin on 2017/2/8.
//  Copyright © 2017年 yangbin. All rights reserved.
//

#import "YWTransitionViewController.h"

@interface YWTransitionViewController ()<CAAnimationDelegate>
{
    NSArray *animArr;
    NSInteger index;
    UILabel *transitionLab;
}
@end

@implementation YWTransitionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    animArr = @[@"cube",@"suckEffect",@"rippleEffect",@"pageCurl",@"pageUnCurl",@"oglFlip",@"cameraIrisHollowOpen",@"cameraIrisHollowClose",@"spewEffect",@"genieEffect",@"unGenieEffect",@"twist",@"tubey",@"swirl",@"charminUltra",@"zoomyIn",@"zoomyOut",@"oglApplicationSuspend"];
    transitionLab = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 200, 300)];
    transitionLab.center = CGPointMake(375/2, 667/2);
    transitionLab.backgroundColor = [UIColor orangeColor];
    transitionLab.font = [UIFont systemFontOfSize:20];
    transitionLab.numberOfLines = 0;
    transitionLab.textColor = [UIColor blueColor];
    transitionLab.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:transitionLab];
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeSystem];
    [btn setTitle:@"动画" forState:UIControlStateNormal];
    btn.frame = CGRectMake(0, 0, 50, 40);
    btn.center = CGPointMake(375/ 2, 640);
    [btn addTarget:self action:@selector(btnAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    
    
    // Do any additional setup after loading the view.
}

- (void)btnAction {
    
    CATransition *pageCurlAnim = [[CATransition alloc] init];
    pageCurlAnim.delegate = self;
    pageCurlAnim.duration = 1.0;
    pageCurlAnim.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut];
    pageCurlAnim.type = animArr[index];
    pageCurlAnim.subtype = kCATransitionFromLeft;
    pageCurlAnim.repeatCount = 1;
    [pageCurlAnim setValue:@"transitionAnim" forKey:@"anim"];
    [transitionLab.layer addAnimation:pageCurlAnim forKey:@"transition"];
    transitionLab.text = [NSString stringWithFormat:@"动画效果:%@",animArr[index]];
    
}

- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag {
    index = (index < animArr.count - 1) ? index + 1 : 0;
    if (flag) {
        CATransition *pageCurlAnim = [[CATransition alloc] init];
        pageCurlAnim.delegate = self;
        pageCurlAnim.duration = 1.0;
        pageCurlAnim.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
        pageCurlAnim.type = animArr[index];
        pageCurlAnim.subtype = kCATransitionFromLeft;
        pageCurlAnim.autoreverses = NO;
        pageCurlAnim.repeatCount = 1;
        [pageCurlAnim setValue:@"transitionAnim" forKey:@"anim"];
        [transitionLab.layer addAnimation:pageCurlAnim forKey:@"transition"];
        transitionLab.text = [NSString stringWithFormat:@"动画效果%@",animArr[index]];
    }
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
