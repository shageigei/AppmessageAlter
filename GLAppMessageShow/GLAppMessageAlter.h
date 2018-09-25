//
//  GLAppMessageAlter.h
//  GLAppMessageShow
//
//  Created by lang on 2018/9/25.
//  Copyright © 2018年 cnovit. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^cancelBlock)(void);

typedef void(^sureBlock)(void);

@interface GLAppMessageAlter : UIView


@property (nonatomic, copy) cancelBlock cancel_block;
@property (nonatomic, copy) sureBlock sure_block;
@property (nonatomic,getter=isShowSureBtn) BOOL showSureBtn;

- (void)alterWithTitle:(NSString *)title
                  contentArray:(NSArray *)contentArray
                        cancel:(NSString *)cancel
                          sure:(NSString *)sure
                cancelBtnClick:(cancelBlock)cancelBlock
                  sureBtnClick:(sureBlock)sureBlock;

- (void)show;
@end
