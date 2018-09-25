//
//  UIView+GLRect.h
//  输入框
//
//  Created by lang on 2018/9/19.
//  Copyright © 2018年 cnovit. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (GLRect)

/**
 控件起点
 */
@property (nonatomic, assign) CGPoint gl_origin;

/**
 控件起点x
 */
@property (nonatomic, assign) CGFloat gl_x;

/**
 控件起点y
 */
@property (nonatomic, assign) CGFloat gl_y;

/**
 控件宽
 */
@property (nonatomic, assign) CGFloat gl_width;

/**
 控件高
 */
@property (nonatomic, assign) CGFloat gl_height;

/**
 控件顶部
 */
@property (nonatomic, assign) CGFloat gl_top;

/**
 控件底部
 */
@property (nonatomic, assign) CGFloat gl_bottom;

/**
 控件左边
 */
@property (nonatomic, assign) CGFloat gl_left;

/**
 控件右边
 */
@property (nonatomic, assign) CGFloat gl_right;

/**
 控件中心点X
 */
@property (nonatomic, assign) CGFloat gl_centerX;

/**
 控件中心点Y
 */
@property (nonatomic, assign) CGFloat gl_centerY;

/**
 控件左下
 */
@property (nonatomic, assign) CGPoint gl_letfBottom;

/**
 控件右下
 */
@property (nonatomic, assign) CGPoint gl_rightBottom;

/**
 控件左上
 */
@property (nonatomic, assign) CGPoint gl_leftTop;

/**
 控件右上
 */
@property (nonatomic, assign) CGPoint gl_rightTop;

/**
 屏幕中心点X
 */
@property (nonatomic, readonly) CGFloat gl_middleX;

/**
 屏幕中心点Y
 */
@property (nonatomic, readonly) CGFloat gl_middleY;

/**
 屏幕中心点
 */
@property (nonatomic, readonly) CGPoint gl_middlePoint;

/**
 控件size
 */
@property (nonatomic) CGSize gl_size;

//-------------------------------------------//

/**
 设置上边圆角
 */
- (void)gl_setCornerOnTop:(CGFloat)conner;

/**
 设置下边圆角
 */
- (void)gl_setCornerOnBottom:(CGFloat)conner;

/**
 设置左边圆角
 */
- (void)gl_setCornerOnLeft:(CGFloat)conner;

/**
 设置右边圆角
 */
- (void)gl_setCornerOnRight:(CGFloat)conner;

/**
 设置左上圆角
 */
- (void)gl_setCornerOnleftTop:(CGFloat)conner;

/**
 设置右上圆角
 */
- (void)gl_setCornerOnRightTop:(CGFloat)conner;

/**
 设置左下圆角
 */
- (void)gl_setCornerOnLeftBottom:(CGFloat)conner;

/**
 设置右下圆角
 */
- (void)gl_setCornerOnRightBottom:(CGFloat)conner;

/**
 设置所有圆角
 */
- (void)gl_setAllCorner:(CGFloat)conner;

/**
 设置上边框线条
 */
- (void)gl_setToplineborderColor:(UIColor *)color borderWitdth:(CGFloat)width;

/**
 设置右边框线条
 */
- (void)gl_setRightlineborderColor:(UIColor *)color borderWitdth:(CGFloat)width;

/**
 设置下边框线条
 */
- (void)gl_setBottomlineborderColor:(UIColor *)color borderWitdth:(CGFloat)width;

/**
 设置左边框线条
 */
- (void)gl_setLftelineborderColor:(UIColor *)color borderWitdth:(CGFloat)width;

@end
