//
//  UIView+GLRect.m
//  view的分类，用来快速获取和设置view的相关属性
//
//  Created by lang on 2018/9/19.
//  Copyright © 2018年 cnovit. All rights reserved.
//

#import "UIView+GLRect.h"

@implementation UIView (GLRect)

- (CGPoint)gl_origin{
    return self.frame.origin;
}

- (void)setGl_origin:(CGPoint)gl_origin{
    CGRect newFrame = self.frame;
    newFrame.origin = gl_origin;
    self.frame      = newFrame;
}

- (CGFloat)gl_x{
    return self.frame.origin.x;
}

- (void)setGl_x:(CGFloat)gl_x{
    CGRect newFrame     = self.frame;
    newFrame.origin.x   = gl_x;
    self.frame          = newFrame;
}

- (CGFloat)gl_y{
    return self.frame.origin.y;
}

- (void)setGl_y:(CGFloat)gl_y{
    CGRect newFrame     = self.frame;
    newFrame.origin.y   = gl_y;
    self.frame          = newFrame;
}

- (CGFloat)gl_width {
    
    return CGRectGetWidth(self.bounds);
}

-(void)setGl_width:(CGFloat)gl_width {
    
    CGRect newFrame     = self.frame;
    newFrame.size.width = gl_width;
    self.frame          = newFrame;
}

- (CGFloat)gl_height {
    
    return CGRectGetHeight(self.bounds);
}

-(void)setGl_height:(CGFloat)gl_height {
    
    CGRect newFrame      = self.frame;
    newFrame.size.height = gl_height;
    self.frame           = newFrame;
}

- (CGFloat)gl_top {
    
    return self.frame.origin.y;
}

- (void)setGl_top:(CGFloat)gl_top {
    
    CGRect newFrame   = self.frame;
    newFrame.origin.y = gl_top;
    self.frame        = newFrame;
}

- (CGFloat)gl_bottom {
    
    return self.frame.origin.y + self.frame.size.height;
}

- (void)setGl_bottom:(CGFloat)gl_bottom {
    
    CGRect newFrame   = self.frame;
    newFrame.origin.y = gl_bottom - self.frame.size.height;
    self.frame        = newFrame;
}

- (CGFloat)gl_left {
    
    return self.frame.origin.x;
}

- (void)setGl_left:(CGFloat)gl_left {
    
    CGRect newFrame   = self.frame;
    newFrame.origin.x = gl_left;
    self.frame        = newFrame;
}

- (CGFloat)gl_right {
    
    return self.frame.origin.x + self.frame.size.width;
}

- (void)setGl_right:(CGFloat)gl_right {
    
    CGRect newFrame   = self.frame;
    newFrame.origin.x = gl_right - self.frame.size.width;
    self.frame        = newFrame;
}

- (CGFloat)gl_centerX {
    
    return self.center.x;
}
- (void)setGl_centerX:(CGFloat)gl_centerX {
    
    CGPoint newCenter = self.center;
    newCenter.x       = gl_centerX;
    self.center       = newCenter;
}

- (CGFloat)cl_centerY {
    
    return self.center.y;
}

- (void)setGl_centerY:(CGFloat)gl_centerY {
    
    CGPoint newCenter = self.center;
    newCenter.y       = gl_centerY;
    self.center       = newCenter;
}

- (CGPoint)gl_rightBottom
{
    CGFloat x = self.frame.origin.x + self.frame.size.width;
    CGFloat y = self.frame.origin.y + self.frame.size.height;
    return CGPointMake(x, y);
}

- (CGPoint)gl_letfBottom
{
    CGFloat x = self.frame.origin.x;
    CGFloat y = self.frame.origin.y + self.frame.size.height;
    return CGPointMake(x, y);
}

- (CGPoint)gl_rightTop
{
    CGFloat x = self.frame.origin.x + self.frame.size.width;
    CGFloat y = self.frame.origin.y;
    return CGPointMake(x, y);
}
- (CGPoint)gl_leftTop
{
    CGFloat x = self.frame.origin.x;
    CGFloat y = self.frame.origin.y;
    return CGPointMake(x, y);
}



- (CGFloat)gl_middleX {
    
    return CGRectGetWidth(self.bounds) / 2.f;
}

- (CGFloat)gl_middleY {
    
    return CGRectGetHeight(self.bounds) / 2.f;
}

- (CGPoint)gl_middlePoint {
    
    return CGPointMake(CGRectGetWidth(self.bounds) / 2.f, CGRectGetHeight(self.bounds) / 2.f);
}

- (CGSize)gl_size {
    return self.frame.size;
}

-(void)setGl_size:(CGSize)gl_size {
    CGRect frame = self.frame;
    frame.size = gl_size;
    self.frame = frame;
}

#pragma mark - 设置圆角
- (void)gl_setCornerOnTop:(CGFloat)conner{
    UIBezierPath *maskPath;
    maskPath = [UIBezierPath bezierPathWithRoundedRect:self.bounds byRoundingCorners:(UIRectCornerTopLeft | UIRectCornerTopRight) cornerRadii:CGSizeMake(conner, conner)];
    
    CAShapeLayer *maskLayer = [[CAShapeLayer alloc] init];
    maskLayer.frame = self.bounds;
    maskLayer.path = maskPath.CGPath;
    self.layer.mask = maskLayer;
}
- (void)gl_setCornerOnBottom:(CGFloat) conner {
    UIBezierPath *maskPath;
    maskPath = [UIBezierPath bezierPathWithRoundedRect:self.bounds
                                     byRoundingCorners:(UIRectCornerBottomLeft | UIRectCornerBottomRight)
                                           cornerRadii:CGSizeMake(conner, conner)];
    CAShapeLayer *maskLayer = [[CAShapeLayer alloc] init];
    maskLayer.frame = self.bounds;
    maskLayer.path = maskPath.CGPath;
    self.layer.mask = maskLayer;
}

- (void)gl_setCornerOnLeft:(CGFloat) conner {
    UIBezierPath *maskPath;
    maskPath = [UIBezierPath bezierPathWithRoundedRect:self.bounds
                                     byRoundingCorners:(UIRectCornerTopLeft | UIRectCornerBottomLeft)
                                           cornerRadii:CGSizeMake(conner, conner)];
    CAShapeLayer *maskLayer = [[CAShapeLayer alloc] init];
    maskLayer.frame = self.bounds;
    maskLayer.path = maskPath.CGPath;
    self.layer.mask = maskLayer;
}

- (void)gl_setCornerOnRight:(CGFloat) conner {
    UIBezierPath *maskPath;
    maskPath = [UIBezierPath bezierPathWithRoundedRect:self.bounds
                                     byRoundingCorners:(UIRectCornerTopRight | UIRectCornerBottomRight)
                                           cornerRadii:CGSizeMake(conner, conner)];
    CAShapeLayer *maskLayer = [[CAShapeLayer alloc] init];
    maskLayer.frame = self.bounds;
    maskLayer.path = maskPath.CGPath;
    self.layer.mask = maskLayer;
}

- (void)gl_setCornerOnleftTop:(CGFloat) conner {
    UIBezierPath *maskPath;
    maskPath = [UIBezierPath bezierPathWithRoundedRect:self.bounds
                                     byRoundingCorners:UIRectCornerTopLeft
                                           cornerRadii:CGSizeMake(conner, conner)];
    CAShapeLayer *maskLayer = [[CAShapeLayer alloc] init];
    maskLayer.frame = self.bounds;
    maskLayer.path = maskPath.CGPath;
    self.layer.mask = maskLayer;
}

- (void)gl_setCornerOnRightTop:(CGFloat) conner {
    UIBezierPath *maskPath;
    maskPath = [UIBezierPath bezierPathWithRoundedRect:self.bounds
                                     byRoundingCorners:UIRectCornerTopRight
                                           cornerRadii:CGSizeMake(conner, conner)];
    CAShapeLayer *maskLayer = [[CAShapeLayer alloc] init];
    maskLayer.frame = self.bounds;
    maskLayer.path = maskPath.CGPath;
    self.layer.mask = maskLayer;
}

- (void)gl_setCornerOnLeftBottom:(CGFloat) conner {
    UIBezierPath *maskPath;
    maskPath = [UIBezierPath bezierPathWithRoundedRect:self.bounds
                                     byRoundingCorners:UIRectCornerBottomLeft
                                           cornerRadii:CGSizeMake(conner, conner)];
    CAShapeLayer *maskLayer = [[CAShapeLayer alloc] init];
    maskLayer.frame = self.bounds;
    maskLayer.path = maskPath.CGPath;
    self.layer.mask = maskLayer;
}

- (void)gl_setCornerOnRightBottom:(CGFloat) conner {
    UIBezierPath *maskPath;
    maskPath = [UIBezierPath bezierPathWithRoundedRect:self.bounds
                                     byRoundingCorners:UIRectCornerBottomRight
                                           cornerRadii:CGSizeMake(conner, conner)];
    CAShapeLayer *maskLayer = [[CAShapeLayer alloc] init];
    maskLayer.frame = self.bounds;
    maskLayer.path = maskPath.CGPath;
    self.layer.mask = maskLayer;
}

- (void)gl_setAllCorner:(CGFloat) conner {
    UIBezierPath *maskPath;
    maskPath = [UIBezierPath bezierPathWithRoundedRect:self.bounds
                                          cornerRadius:conner];
    CAShapeLayer *maskLayer = [[CAShapeLayer alloc] init];
    maskLayer.frame = self.bounds;
    maskLayer.path = maskPath.CGPath;
    self.layer.mask = maskLayer;
}

- (void)gl_setToplineborderColor:(UIColor *)color borderWitdth:(CGFloat)width{
    CALayer *layer = [CALayer layer];
    layer.frame = CGRectMake(0, 0, self.frame.size.width, width);
    layer.backgroundColor = color.CGColor;
    [self.layer addSublayer:layer];
}


- (void)gl_setRightlineborderColor:(UIColor *)color borderWitdth:(CGFloat)width{
    CALayer *layer = [CALayer layer];
    layer.frame = CGRectMake(self.frame.size.width-width, 0, width, self.frame.size.height);
    layer.backgroundColor = color.CGColor;
    [self.layer addSublayer:layer];
}


- (void)gl_setBottomlineborderColor:(UIColor *)color borderWitdth:(CGFloat)width{
    CALayer *layer = [CALayer layer];
    layer.frame = CGRectMake(0, self.frame.size.height-width, self.frame.size.width, width);
    layer.backgroundColor = color.CGColor;
    [self.layer addSublayer:layer];
}


- (void)gl_setLftelineborderColor:(UIColor *)color borderWitdth:(CGFloat)width{
    CALayer *layer = [CALayer layer];
    layer.frame = CGRectMake(0, 0, width, self.frame.size.height);
    layer.backgroundColor = color.CGColor;
    [self.layer addSublayer:layer];
}

@end
