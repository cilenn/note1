//
//  checkDataViewController.m
//  dataSend_server
//
//  Created by kazuhiro on 2014/05/28.
//  Copyright (c) 2014年 kazuhiro. All rights reserved.
//

#import "checkDataViewController.h"

@interface checkDataViewController ()

@end

@implementation checkDataViewController
@synthesize challenge;
@synthesize array;



- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.title = @"check";
        UIImage *icon = [UIImage imageNamed:@"18.png"];
        self.tabBarItem = [[UITabBarItem alloc]initWithTitle:@"check" image:icon tag:1];
        
        challenge = @"aaaaaa";
        array =[[NSMutableArray alloc]init];
    }
    return self;
}


-(void)viewDidLoad{
    
    [super viewDidLoad];
    
    form =
    [[UITextField alloc] initWithFrame:CGRectMake(30, 150, 320-60, 50)];
    form.borderStyle = UITextBorderStyleRoundedRect;
    form.delegate = self;
    
    
    int x=150;
    UIButton *btn;
    btn = [UIButton buttonWithType:UIButtonTypeInfoDark];
    btn.frame = CGRectMake((320-x)/2, 100, x, 30);
    [btn setTitle:@"arrayへ登録" forState:UIControlStateNormal];
    // ボタンがタッチダウンされた時に、hogeメソッドを呼び出す処理
    [btn addTarget:self action:@selector(hoge)
  forControlEvents:UIControlEventTouchDown];
   
    
    [self.view addSubview:form];
    [self.view addSubview:btn];

}


-(void)hoge
{
#if DEBUG
    NSLog(@"object_log:%@", form.text);
#endif
    [array addObject:form.text];
#if DEBUG
    NSLog(@"array_log:%@", array);
#endif
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    // the user pressed the "Done" button, so dismiss the keyboard
    // キーボードを非表示にする
    [textField resignFirstResponder];
    return YES;
}







@end
