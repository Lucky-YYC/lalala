//
//  BrowserViewController.m
//  CycleImageBrowser
//
//  Created by 王月超 on 2017/8/2.
//  Copyright © 2017年 heiqiu. All rights reserved.
//

#import "BrowserViewController.h"
#import "LWImageBrowser.h"
@interface BrowserViewController ()<SDCycleScrollViewDelegate,LWImageBrowserDelegate>
@property (nonatomic,strong)SDCycleScrollView *sdCycleView;
@property (nonatomic,strong)NSMutableArray *imageArray;
@property (nonatomic,strong)NSMutableArray *hdImageArray;
@end

@implementation BrowserViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"browser";
    self.view.backgroundColor = [UIColor whiteColor];
    self.sdCycleView.frame = CGRectMake(0, 64, screen_width, (screen_height-64)/2);
    self.sdCycleView.imageURLStringsGroup = self.imageArray;
    [self.view addSubview:self.sdCycleView];
}


- (void)cycleScrollView:(SDCycleScrollView *)cycleScrollView didScrollToIndex:(NSInteger)index{
    
}
- (void)cycleScrollView:(SDCycleScrollView *)cycleScrollView didSelectItemAtIndex:(NSInteger)index{
    NSMutableArray* tmps = [[NSMutableArray alloc] init];
    for (NSInteger i = 0; i < self.imageArray.count; i ++) {
        LWImageBrowserModel* model = [[LWImageBrowserModel alloc]
                                      initWithplaceholder:nil
                                      thumbnailURL:[NSURL URLWithString:self.imageArray[i]]
                                      HDURL:[NSURL URLWithString:self.hdImageArray[i]]
                                      containerView:self.view
                                      positionInContainer:self.sdCycleView.frame
                                      index:i];
        [tmps addObject:model];
    }
    LWImageBrowser* browser = [[LWImageBrowser alloc] initWithImageBrowserModels:tmps currentIndex:index];
    browser.delegate = self;
    [browser show];
}

- (void)browserEndedOnIndex:(NSInteger)index{
    [self.sdCycleView.mainView scrollToItemAtIndexPath:[NSIndexPath indexPathForItem:index inSection:0] atScrollPosition:UICollectionViewScrollPositionNone animated:NO];
}

- (SDCycleScrollView *)sdCycleView{
    if(!_sdCycleView){
        _sdCycleView = [SDCycleScrollView cycleScrollViewWithFrame:CGRectZero delegate:self placeholderImage:[UIImage imageNamed:@"placeholder0"]];
        _sdCycleView.pageControlStyle = SDCycleScrollViewPageContolStyleClassic;
        _sdCycleView.pageControlAliment = SDCycleScrollViewPageContolAlimentCenter;
        _sdCycleView.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        _sdCycleView.autoScroll = NO;
        _sdCycleView.infiniteLoop = YES;
        _sdCycleView.hidesForSinglePage = YES;
        _sdCycleView.firstIndex = 0;
    }
    return _sdCycleView;
}

- (NSMutableArray *)imageArray{
    if(!_imageArray){
        _imageArray = [[NSMutableArray alloc]initWithObjects:@"http://timeline.heyjoy.cc/1000013-tl1501038099643046.png?x-oss-process=style/43",@"http://timeline.heyjoy.cc/1000013-tl1501038099757116.png?x-oss-process=style/43",@"http://timeline.heyjoy.cc/1000013-tl1501038099773296.png?x-oss-process=style/43",@"http://timeline.heyjoy.cc/1000013-tl1501038099787358.png?x-oss-process=style/43",@"http://timeline.heyjoy.cc/1000013-tl1501038099815468.png?x-oss-process=style/43", nil];
        
    }
    return _imageArray;
}

- (NSMutableArray *)hdImageArray{
    if(!_hdImageArray){
        _hdImageArray = [[NSMutableArray alloc]initWithObjects:@"http://timeline.heyjoy.cc/1000013-tl1501038099643046.png",@"http://timeline.heyjoy.cc/1000013-tl1501038099757116.png",@"http://timeline.heyjoy.cc/1000013-tl1501038099773296.png",@"http://timeline.heyjoy.cc/1000013-tl1501038099787358.png",@"http://timeline.heyjoy.cc/1000013-tl1501038099815468.png",nil];
    }
    return _hdImageArray;
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
