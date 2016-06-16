//
//  UIView+BH.h
//  bankHui
//
//  Created by 王帅广 on 16/3/10.
//  Copyright © 2016年 王帅广. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (BH)

@property (nonatomic) CGFloat left;
@property (nonatomic) CGFloat right;

@property (nonatomic) CGFloat top;
@property (nonatomic) CGFloat bottom;

@property (nonatomic) CGFloat width;
@property (nonatomic) CGFloat height;

@property (nonatomic) CGFloat centerX;
@property (nonatomic) CGFloat centerY;

@property (nonatomic) CGPoint origin;
@property (nonatomic, assign) CGFloat originX;
@property (nonatomic, assign) CGFloat originY;
@property (nonatomic) CGSize  size;


#pragma mark - 圆角
- (void)setRoundedCorners:(UIRectCorner)corners radius:(CGSize)size;

#pragma mark - 以递归的方式遍历(查找)subview
- (UIView*)findViewRecursively:(BOOL(^)(UIView* subview, BOOL* stop))recurse;

@end
