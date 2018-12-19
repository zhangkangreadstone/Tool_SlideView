//
//  SliderHandler.h
//  SlideBarView
//
//  Created by LSH on 2018/12/19.
//  Copyright © 2018 None. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
NS_ASSUME_NONNULL_BEGIN

@interface SliderHandler : NSObject
+ (CGFloat)calculateWidthForTitle:(NSString *)title withFont:(UIFont *)font;

+ (UIColor *)colorWithHexString:(NSString *)color alpha:(CGFloat)alpha;

+ (UIColor *)colorWithHexString:(NSString *)color;


@end

NS_ASSUME_NONNULL_END
