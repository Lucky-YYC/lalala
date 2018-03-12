//
//  BiggerViewController.m
//  CycleImageBrowser
//
//  Created by 王月超 on 2018/3/9.
//  Copyright © 2018年 heiqiu. All rights reserved.
//

#import "BiggerViewController.h"

@interface BiggerViewController ()<CAAnimationDelegate>
@property (nonatomic,strong)UIImageView *myView;

@property (nonatomic,strong)UILabel *myLB;
@end

@implementation BiggerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.myView];
    self.myView.sd_layout
    .centerXEqualToView(self.view)
    .centerYEqualToView(self.view)
    .heightIs(self.myView.image.size.height*0.5)
    .widthIs(self.myView.image.size.width*0.5);
    
    [self.view addSubview:self.myLB];
    self.myLB.sd_layout
    .topSpaceToView(self.myView, 30)
    .centerXEqualToView(self.view)
    .heightIs(20);
    [self.myLB setSingleLineAutoResizeWithMaxWidth:MAXFLOAT];
    
    // Do any additional setup after loading the view.
}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self playAnimation1];
}
- (void)playAnimation3{
    CGFloat kAnimationDuration = 0.3f;
    CAGradientLayer *contentLayer = (CAGradientLayer *)self.myView.layer;
    CABasicAnimation *scaleAnimation = [CABasicAnimation animationWithKeyPath:@"transform"];
    scaleAnimation.fromValue = [NSValue valueWithCATransform3D:CATransform3DMakeScale(0, 0, 1)];
    scaleAnimation.toValue = [NSValue valueWithCATransform3D:CATransform3DMakeScale(1, 1, 1)];
    scaleAnimation.duration = kAnimationDuration;
    scaleAnimation.cumulative = NO;
    scaleAnimation.repeatCount = 1;
    [scaleAnimation setTimingFunction:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionDefault]];
    [contentLayer addAnimation: scaleAnimation forKey:@"myScale"];
    
    CABasicAnimation *showViewAnn = [CABasicAnimation animationWithKeyPath:@"opacity"];
    showViewAnn.fromValue = [NSNumber numberWithFloat:0.0];
    showViewAnn.toValue = [NSNumber numberWithFloat:1.0];
    showViewAnn.duration = kAnimationDuration;
    showViewAnn.fillMode = kCAFillModeForwards;
    showViewAnn.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    showViewAnn.removedOnCompletion = NO;
    showViewAnn.delegate = self;
    [contentLayer addAnimation:showViewAnn forKey:@"myShow"];
    
    CAAnimationGroup *group = [CAAnimationGroup animation];
    group.duration = kAnimationDuration;
    group.removedOnCompletion = NO;
    group.repeatCount = 1;
    group.fillMode = kCAFillModeForwards;
    [group setAnimations:@[scaleAnimation,showViewAnn]];
    
    [self.myView.layer addAnimation:group forKey:@"animationOpacity"];
}

- (void)playAnimation2{
    self.myView.transform = CGAffineTransformMakeScale(0.05, 0.05);
    [UIView animateWithDuration:0.5 animations:^{
         self.myView.transform = CGAffineTransformMakeScale(1.0, 1.0);
    }];
}
- (void)playAnimation1{
    // 设定为缩放
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    
    // 动画选项设定
    animation.duration = 0.4; // 动画持续时间
    animation.repeatCount = 1; // 重复次数
    animation.autoreverses = YES; // 动画结束时执行逆动画
    // 缩放倍数
    animation.fromValue = [NSNumber numberWithFloat:1.0]; // 开始时的倍率
    animation.toValue = [NSNumber numberWithFloat:1.2]; // 结束时的倍率
    
    // 添加动画
    [self.myLB.layer addAnimation:animation forKey:@"scale-layer"];
}
- (UIImageView *)myView{
    if(!_myView){
        _myView = [[UIImageView alloc]init];
        _myView.image = [UIImage imageNamed:@"girl.jpg"];
    }
    return _myView;
}
- (UILabel *)myLB{
    if(!_myLB){
        _myLB = [[UILabel alloc]init];
        _myLB.text = @"哒哒哒哒";
        _myLB.textAlignment = NSTextAlignmentCenter;
    }
    return _myLB;
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
