//
//  GLAppMessageAlter.m
//  GLAppMessageShow
//
//  Created by lang on 2018/9/25.
//  Copyright © 2018年 cnovit. All rights reserved.
//

#import "GLAppMessageAlter.h"
#import "UIView+GLRect.h"

#define messageWidth  ([UIScreen mainScreen].bounds.size.width - 100)

@interface GLAppMessageAlter()
{
    UIWindow *messageWindow;
}

@property (nonatomic, strong) UILabel *lblTitle;
@property (nonatomic, strong) UIButton *canBtn;
@property (nonatomic, strong) UIButton *sureBtn;

@property (nonatomic, strong) UIView *alterView;

@property (nonatomic, strong) NSArray *contentArray;

@end

@implementation GLAppMessageAlter

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        _alterView = [[UIView alloc] init];
        _alterView.backgroundColor = [UIColor whiteColor];
        [self addSubview:_alterView];
        self.frame = [UIScreen mainScreen].bounds;
    }
    return self;
}

- (void)configUI{
    
    //标题
    self.lblTitle.frame = CGRectMake(0, 0, messageWidth, 50);
    //内容
    CGRect lastLableFrame = CGRectMake(0, 0, messageWidth, 50);
    CGFloat contentHeight = 0;
    for (NSInteger i = 0; i < self.contentArray.count; i++) {

        NSString *descrip = self.contentArray[i];
        CGSize contenSize = [descrip boundingRectWithSize:CGSizeMake(messageWidth - 70, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingTruncatesLastVisibleLine attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:14]} context:nil].size;
        
        
        UILabel *descriptionLabel = [[UILabel alloc] init];
        descriptionLabel.textAlignment = NSTextAlignmentLeft;
        descriptionLabel.lineBreakMode = NSLineBreakByCharWrapping;
        descriptionLabel.numberOfLines = 0;
        descriptionLabel.backgroundColor = [UIColor whiteColor];
        descriptionLabel.text = descrip;
        descriptionLabel.font = [UIFont systemFontOfSize:14.f];
        descriptionLabel.frame = CGRectMake(50, CGRectGetMaxY(lastLableFrame), messageWidth - 70, contenSize.height);
        [_alterView addSubview:descriptionLabel];
        lastLableFrame = descriptionLabel.frame;
        contentHeight += descriptionLabel.frame.size.height;
    }
    
    if (self.isShowSureBtn) {//只显示确认按钮
        self.canBtn.frame = CGRectZero;
        self.sureBtn.frame = CGRectMake(0, CGRectGetMaxY(lastLableFrame)+5, messageWidth, 50);
        [_sureBtn gl_setToplineborderColor:[UIColor lightGrayColor] borderWitdth:1];
        
    }else{
        
        //取消按钮
        self.canBtn.frame = CGRectMake(0, CGRectGetMaxY(lastLableFrame) + 5, messageWidth/2, 50);
        [_canBtn gl_setToplineborderColor:[UIColor lightGrayColor] borderWitdth:1];
        [_canBtn gl_setRightlineborderColor:[UIColor lightGrayColor] borderWitdth:1];
        
        //确认按钮
        self.sureBtn.frame = CGRectMake(messageWidth/2, CGRectGetMaxY(lastLableFrame)+5, messageWidth/2, 50);
        [_sureBtn gl_setToplineborderColor:[UIColor lightGrayColor] borderWitdth:1];
    }
    
    
    _alterView.frame = CGRectMake(0, 0, messageWidth, CGRectGetHeight(self.lblTitle.frame) + contentHeight + CGRectGetHeight(self.sureBtn.frame));
    _alterView.center=CGPointMake([UIScreen mainScreen].bounds.size.width/2, [UIScreen mainScreen].bounds.size.height/2);
    _alterView.layer.cornerRadius=5;
    _alterView.layer.masksToBounds=YES;
    
    [_alterView addSubview:self.lblTitle];
    [_alterView addSubview:self.canBtn];
    [_alterView addSubview:self.sureBtn];
}

- (void)show{
    
    messageWindow = [self lastWindow];
    self.backgroundColor = [UIColor whiteColor];
    [messageWindow addSubview:self];
    
    CGAffineTransform transform = CGAffineTransformScale(CGAffineTransformIdentity,1.0,1.0);
    
    self.alterView.transform = CGAffineTransformScale(CGAffineTransformIdentity,0.2,0.2);
    self.alterView.alpha = 0;
    [UIView animateWithDuration:0.2 delay:0.1 usingSpringWithDamping:0.5 initialSpringVelocity:10 options:UIViewAnimationOptionCurveLinear animations:^{
        self.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:.4f];
        self.alterView.transform = transform;
        self.alterView.alpha = 1;
    } completion:^(BOOL finished) {
        
    }];
}

- (void)alterWithTitle:(NSString *)title
                  contentArray:(NSArray *)contentArray
                        cancel:(NSString *)cancel
                          sure:(NSString *)sure
                cancelBtnClick:(cancelBlock)cancelBlock
                  sureBtnClick:(sureBlock)sureBlock{
    self.contentArray = contentArray;
    [self configUI];
    
    self.lblTitle.text=title;
    [self.canBtn setTitle:cancel forState:UIControlStateNormal];
    [self.sureBtn setTitle:sure forState:UIControlStateNormal];
    self.cancel_block=cancelBlock;
    self.sure_block=sureBlock;
    
}
- (UIWindow *)lastWindow{
    
    NSArray *windows = [UIApplication sharedApplication].windows;
    for (UIWindow *windos in [windows reverseObjectEnumerator]) {
        if ([windos isKindOfClass:[UIWindow class]] && CGRectEqualToRect(windos.bounds, [UIScreen mainScreen].bounds)) {
            return windos;
        }
    }
    
    return [UIApplication sharedApplication].keyWindow;
}


#pragma mark - click
- (void)canlClick:(UIButton *)sender{
    [self removeFromSuperview];
    self.cancel_block();
}

- (void)sureClick:(UIButton *)sender{
    
    [self removeFromSuperview];
    self.sure_block();
}

#pragma mark - lazy set
- (UILabel *)lblTitle{
    if (!_lblTitle) {
        _lblTitle = [[UILabel alloc] init];
        _lblTitle.textAlignment = NSTextAlignmentCenter;
        _lblTitle.font = [UIFont systemFontOfSize:20.f];
        _lblTitle.textColor = [UIColor blackColor];
    }
    return _lblTitle;
}

- (UIButton *)canBtn{
    if (!_canBtn) {
        _canBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_canBtn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
        [_canBtn addTarget:self action:@selector(canlClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _canBtn;
}

- (UIButton *)sureBtn{
    if (!_sureBtn) {
        _sureBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_sureBtn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
        [_sureBtn addTarget:self action:@selector(sureClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _sureBtn;
}

@end
