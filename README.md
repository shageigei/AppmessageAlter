
# AppmessageAlter



自定义简单弹框，显示app更新的内容，支持配置强制更新


使用方法：

```objective-c
GLAppMessageAlter * alter = [[GLAppMessageAlter alloc] init];
    alter.showSureBtn = NO;//是否开启强制更新
    [alter alterWithTitle:@"更新提示" contentArray:@[@"1.修复了收件箱闪退问题",@"2.增加新功能",@"3.这个app是关于收发短信的便捷app，所以你们好好用",@"4.这个app是关于收发短信的便捷app，所以你们好好用"] cancel:@"取消" sure:@"去更新" cancelBtnClick:^{
        NSLog(@"取消");
        self.lable1.text = @"点击了取消按钮";
    } sureBtnClick:^{
        self.lable1.text = @"点击了确认按钮按钮";
    }];
    
    [alter show];
```



![alter2](https://github.com/shageigei/AppmessageAlter/blob/master/alter2.gif)

![alter](https://github.com/shageigei/AppmessageAlter/blob/master/alter.gif)