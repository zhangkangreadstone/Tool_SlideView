//
//  SlideView.m
//  SlideBarView
//
//  Created by LSH on 2018/12/17.
//  Copyright © 2018 None. All rights reserved.
//

#import "SlideView.h"
@implementation SlideItem


@end


@interface SlideView()


@property (nonatomic,strong) UIScrollView *scrollView;
@property (nonatomic,strong) UIView *slideSep;//底部滑块

@property (nonatomic,strong) NSMutableArray *midSeps;//中间分隔块

@end

#define kScreenW  [UIScreen mainScreen].bounds.size.width
static const CGFloat kSlideH = 44.0f;
static const CGFloat kSepH = 2.0f;

@implementation SlideView

-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:self.scrollView];
        [self.scrollView addSubview:self.slideSep];
        self.midSeps = [NSMutableArray array];

        UIView *sep = [[UIView alloc]initWithFrame:CGRectMake(0, frame.size.height-0.5, frame.size.width, 0.5)];
        sep.backgroundColor = [UIColor lightGrayColor];
        [self addSubview:sep];
    }
    return self;
}

- (instancetype)initWithItems:(NSMutableArray *)items{
    if (!items.count) {
        return nil;
    }
    self = [self initWithFrame:CGRectMake(0, 90, kScreenW, kSlideH)];
    CGFloat w = kScreenW/4.0;
    if (items.count > 4) {
        w = kScreenW/3.5;
    }
    _scrollView.contentSize = CGSizeMake(w*items.count, kSlideH);
    _scrollView.showsHorizontalScrollIndicator = NO;

    for (NSInteger i = 0; i < items.count; i ++) {
        SlideItem *item = items[i];
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        btn.selected = NO;
        btn.frame = CGRectMake(w*i, 0, w, kSlideH-1-kSepH);
        btn.backgroundColor = [UIColor whiteColor];
        if (item.title.length) {
            [btn setTitle:item.title forState:UIControlStateNormal];
            [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
            if (item.defaultColor) {
                [btn setTitleColor:item.defaultColor forState:UIControlStateNormal];
            }
            if (item.selectedColor) {
                [btn setTitleColor:item.selectedColor forState:UIControlStateSelected];
            }
        }
        if (item.imgName.length) {
            [btn setImage:[UIImage imageNamed:item.imgName] forState:UIControlStateNormal];
            [btn setImage:[UIImage imageNamed:item.selectedImgName] forState:UIControlStateSelected];
        }
        if (i != items.count-1) {
            UIView *sep = [[UIView alloc]initWithFrame:CGRectMake(w-1, 6, 1, btn.frame.size.height-6*2)];
            sep.backgroundColor = [UIColor redColor];
            [btn addSubview:sep];
            [self.midSeps addObject:sep];
        }
        if (i == 0) {
            btn.selected = YES;
            self.slideSep.center = CGPointMake(btn.center.x, kSlideH-2);
        }
        [btn addTarget:self action:@selector(btnClicked:) forControlEvents:UIControlEventTouchUpInside];
        [_scrollView addSubview:btn];
    }
    return self;
}

- (void)btnClicked:(UIButton *)sender
{
    [self.scrollView.subviews enumerateObjectsUsingBlock:^(__kindof UIView * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if ([obj isKindOfClass:[UIButton class]]) {
            UIButton *btn = (UIButton *)obj;
            btn.selected = NO;
        }
    }];
    sender.selected = YES;
    [UIView animateWithDuration:0.15 animations:^{
        self.slideSep.center = CGPointMake(sender.center.x, kSlideH-2);
        [self.scrollView scrollRectToVisible:sender.frame animated:YES];
    }];
}
-(void)setMidSepShow:(BOOL)midSepShow
{
    _midSepShow = midSepShow;
    [self.midSeps enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        UIView *sep = obj;
        sep.hidden = !midSepShow;
    }];

}

-(void)setBottomSepColor:(UIColor *)bottomSepColor
{
    _bottomSepColor = bottomSepColor;
    _slideSep.backgroundColor = bottomSepColor;
}

-(void)setBottomSepW:(CGFloat)bottomSepW
{
    _bottomSepW = bottomSepW;
    _slideSep.frame = CGRectMake(_slideSep.frame.origin.x+(_slideSep.frame.size.width-bottomSepW)*0.5, _slideSep.frame.origin.y, bottomSepW, _slideSep.frame.size.height);

}


-(UIScrollView *)scrollView
{
    if (!_scrollView) {
        _scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, kScreenW, kSlideH)];
    }
    return _scrollView;
}

-(UIView *)slideSep
{
    if (!_slideSep) {
        _slideSep = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 30, 2)];
        _slideSep.backgroundColor = [UIColor redColor];
    }
    return _slideSep;
}
@end
