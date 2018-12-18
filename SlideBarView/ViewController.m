//
//  ViewController.m
//  SlideBarView
//
//  Created by LSH on 2018/12/17.
//  Copyright © 2018 None. All rights reserved.
//

#import "ViewController.h"
#import "SlideView.h"
#import "UIColor+Hex.h"
#define ThemeColor [UIColor colorWithHexString:@"#00C87F"]//App主色 主要用于顶部 以及特殊文字和折线

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    NSArray *titles = @[@"AAA",@"BB",@"CCCCC",@"FFFF",@"EEEEEEE"];
    NSMutableArray *arr = [NSMutableArray array];
    for (NSInteger i = 0; i < 5; i ++) {
        SlideItem *item = [[SlideItem alloc]init];
        item.title = titles[i];
        item.defaultColor = [UIColor blackColor];
        item.selectedColor = ThemeColor;
        [arr addObject:item];
    }

    SlideView *slideView = [[SlideView alloc]initWithItems:arr type:SlideStyle_Suit];
    slideView.bottomSepW = 50;
    slideView.bottomSepColor = ThemeColor;
    slideView.midSepH = 12;
    slideView.midSepColor = ThemeColor;
    slideView.midSepShow = YES;
    [self.view addSubview:slideView];




}


@end
