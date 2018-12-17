//
//  ViewController.m
//  SlideBarView
//
//  Created by LSH on 2018/12/17.
//  Copyright © 2018 None. All rights reserved.
//

#import "ViewController.h"
#import "SlideView.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    NSMutableArray *arr = [NSMutableArray array];
    for (NSInteger i = 0; i < 5; i ++) {
        SlideItem *item = [[SlideItem alloc]init];
        item.title = [NSString stringWithFormat:@"%ld",i];
        item.defaultColor = [UIColor blackColor];
        item.selectedColor = [UIColor greenColor];
        [arr addObject:item];
    }

    SlideView *slideView = [[SlideView alloc]initWithItems:arr];
    slideView.bottomSepW = 50;
    slideView.midSepShow = YES;
    [self.view addSubview:slideView];




}


@end
