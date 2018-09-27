//
//  ViewController.m
//  GLAppMessageShow
//
//  Created by lang on 2018/9/25.
//  Copyright © 2018年 cnovit. All rights reserved.
//

#import "ViewController.h"
#import "GLAppMessageAlter.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *lable1;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    UIButton * btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setTitle:@"点击" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    btn.frame = CGRectMake(20, 200, 200, 50);
    [btn addTarget:self action:@selector(clcik) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
}

- (void)clcik{
    
    GLAppMessageAlter * alter = [[GLAppMessageAlter alloc] init];
    alter.showSureBtn = NO;
    [alter alterWithTitle:@"更新提示" contentArray:@[@"1.修复了收件箱闪退问题",@"2.增加新功能",@"3.这个app是关于收发短信的便捷app，所以你们好好用",@"4.这个app是关于收发短信的便捷app，所以你们好好用"] cancel:@"取消" sure:@"去更新" cancelBtnClick:^{
        NSLog(@"取消");
        self.lable1.text = @"点击了取消按钮";
    } sureBtnClick:^{
        self.lable1.text = @"点击了确认按钮按钮";
    }];
    
    [alter show];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
