//
//  PaomadengController.m
//  CycleImageBrowser
//
//  Created by 王月超 on 2017/8/3.
//  Copyright © 2017年 heiqiu. All rights reserved.
//

#import "PaomadengController.h"

@interface PaomadengController (){
    int _index;
}
@property (nonatomic,strong)UILabel *textlb;
@property (nonatomic,strong)NSMutableArray *textArray;
@end

@implementation PaomadengController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"跑马灯";
    self.view.backgroundColor = [UIColor whiteColor];
    
    
    UIView *bgView = [[UIView alloc]init];
    bgView.frame = CGRectMake(0, 100, screen_width, 50);
    [self.view addSubview:bgView];
    
    NSMutableArray *textArray = [[NSMutableArray alloc]initWithObjects:@"跑马灯，哈哈哈哈哈。心中本无事",@"没人在乎你在乎的事，啊哈哈哈还是",@"fjjfjfjfaldkjflsjdlfjlasjdfljksaldjflskjdfljsa" ,nil];
    self.textArray = textArray;
    _index = -1;
    
    [self.view addSubview:self.textlb];
    

    
    
}
- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
   
    [self setAnimationWithIndex:_index];
}
- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    if (self.textlb) {
        [self.textlb.layer removeAllAnimations];
        [self.textlb removeFromSuperview];
        self.textlb = nil;
    }
}
- (void)setAnimationWithIndex:(int)index{
    index ++;
    if (index >= self.textArray.count) {
        index = 0;
    }
    self.textlb.text = self.textArray[index];
    self.textlb.frame = CGRectMake(-screen_width, 100, screen_width, 50);
    
    __weak PaomadengController *weakself = self;
    [UIView animateWithDuration:6 delay:0 options:UIViewAnimationOptionCurveLinear animations:^{
         weakself.textlb.frame = CGRectMake(screen_width, 100, screen_width, 50);
    } completion:^(BOOL finished) {
        [weakself setAnimationWithIndex:index];
    }];
}
- (void)dealloc{
    NSLog(@"%s",__func__);
    if (self.textlb) {
        
        [self.textlb.layer removeAllAnimations];
        [self.textlb removeFromSuperview];
        self.textlb = nil;
    }
}
- (UILabel *)textlb{
    if(!_textlb){
        _textlb = [[UILabel alloc]init];
        _textlb.textAlignment = NSTextAlignmentLeft;
        _textlb.font = [UIFont systemFontOfSize:14];
        _textlb.textColor = [UIColor cyanColor];
    }
    return _textlb;
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
