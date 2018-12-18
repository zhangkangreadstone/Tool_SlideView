//
//  NSString+Size.m
//  SlideBarView
//
//  Created by LSH on 2018/12/18.
//  Copyright © 2018 None. All rights reserved.
//

#import "NSString+Size.h"

@implementation NSString (Size)

//计算标题文字尺寸
- (CGFloat)calculateTitleWidthWithFont:(UIFont *)font
{
    NSDictionary *dic = @{NSFontAttributeName: font};
    CGSize size = [self boundingRectWithSize:CGSizeMake([UIScreen mainScreen].bounds.size.width, 0) options:NSStringDrawingTruncatesLastVisibleLine | NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading attributes:dic context:nil].size;
    return size.width;
}

//计算标题文字尺寸
- (CGFloat)calculateTitleHeightWithFont:(UIFont *)font forWith:(CGFloat)width
{
    NSDictionary *dic = @{NSFontAttributeName: font};
    CGSize size = [self boundingRectWithSize:CGSizeMake(width, 0) options:NSStringDrawingTruncatesLastVisibleLine | NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading attributes:dic context:nil].size;
    return size.height;
}

@end
