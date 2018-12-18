//
//  SlideView.h
//  SlideBarView
//
//  Created by LSH on 2018/12/17.
//  Copyright © 2018 None. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SlideItem : NSObject

@property (nonatomic,strong) NSString *title;//标题
@property (nonatomic,strong) NSString *imgName;//图片名字
@property (nonatomic,strong) NSString *selectedImgName;//选中图片名字

@property (nonatomic,strong) UIColor *defaultColor;//默认色
@property (nonatomic,strong) UIColor *selectedColor;//选中色

@end
NS_ASSUME_NONNULL_BEGIN


typedef NS_ENUM(NSUInteger, SlideStyle) {
    SlideStyle_Normal,
    SlideStyle_Suit,
};

@interface SlideView : UIView

@property (nonatomic,assign) CGFloat item_w;//条目宽度
@property (nonatomic,strong) UIColor *bottomSepColor;//底部滑块颜色
@property (nonatomic,assign) CGFloat bottomSepW;//底部滑块宽度

@property (nonatomic,assign) BOOL midSepShow;//中间分割线是否显示
@property (nonatomic,assign) CGFloat midSepH;//中间分割线的上下距离
@property (nonatomic,strong) UIColor *midSepColor;//中间分隔线e颜色



- (instancetype)initWithItems:(NSMutableArray *)items type:(SlideStyle)type;


@end

NS_ASSUME_NONNULL_END
