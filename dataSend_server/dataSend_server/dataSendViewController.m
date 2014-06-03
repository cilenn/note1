//
//  dataSendViewController.m
//  dataSend_server
//
//  Created by kazuhiro on 2014/05/28.
//  Copyright (c) 2014年 kazuhiro. All rights reserved.
//

#import "dataSendViewController.h"

@interface dataSendViewController ()

@end

@implementation dataSendViewController



- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.title = @"send";
        UIImage *icon = [UIImage imageNamed:@"11.png"];
        self.tabBarItem = [[UITabBarItem alloc]initWithTitle:@"send" image:icon tag:0];
    }
    return self;
}

- (BOOL)textFieldShouldReturn:(UITextField *)sender {
    
    // 受け取った入力をラベルに代入
    //self.mLabel.text = sender.text;
    
    // キーボードを閉じる
    [sender resignFirstResponder];
    
    return TRUE;
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor cyanColor];
    
    field =
    [[UITextField alloc] initWithFrame:CGRectMake(30, 100, 320-60, 50)];
    //field.text =@"";
    field.borderStyle = UITextBorderStyleRoundedRect;
    field.delegate = self;
    //message = @"おはよう！";
    
    message = field.text;
    
    
    
    int x=100;
    UIButton *btn;
    btn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    btn.frame = CGRectMake((320-x)/2, 200, x, 30);
    //btn.currentTitleColor = [UIColor whiteColor];
    [btn setTitle:@"同期通信(post)" forState:UIControlStateNormal];
    // ボタンがタッチダウンされた時に、hogeメソッドを呼び出す処理
    [btn addTarget:self action:@selector(send)
  forControlEvents:UIControlEventTouchDown];
    
    
    
    UIButton *btnAS;
    btnAS = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    btnAS.frame = CGRectMake((320-x)/2, 300, x, 30);
    //btn.currentTitleColor = [UIColor whiteColor];
    [btnAS setTitle:@"非同期通信(post)" forState:UIControlStateNormal];
    // ボタンがタッチダウンされた時に、hogeメソッドを呼び出す処理
    [btnAS addTarget:self action:@selector(sendAS)
  forControlEvents:UIControlEventTouchDown];
    
    
    UIButton *btnProperty;
    btnProperty = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    btnProperty.frame = CGRectMake((320-x)/2, 400, x, 30);
    //btn.currentTitleColor = [UIColor whiteColor];
    [btnProperty setTitle:@"プロパティ" forState:UIControlStateNormal];
    // ボタンがタッチダウンされた時に、hogeメソッドを呼び出す処理
    [btnProperty addTarget:self action:@selector(writing)
    forControlEvents:UIControlEventTouchDown];
    
    
//    int xx=150;
//    UIButton *btn_get;
//    btn_get = [UIButton buttonWithType:UIButtonTypeRoundedRect];
//    btn_get.frame = CGRectMake((320-x)/2, 200, x, 30);
//    //btn.currentTitleColor = [UIColor whiteColor];
//    [btn_get setTitle:@"同期通信" forState:UIControlStateNormal];
//    // ボタンがタッチダウンされた時に、hogeメソッドを呼び出す処理
//    [btn_get addTarget:self action:@selector(send_get)
//  forControlEvents:UIControlEventTouchDown];
//    
//    
//    UIButton *btnAS_get;
//    btnAS_get = [UIButton buttonWithType:UIButtonTypeRoundedRect];
//    btnAS_get.frame = CGRectMake((320-x)/2, 300, x, 30);
//    //btn.currentTitleColor = [UIColor whiteColor];
//    [btnAS_get setTitle:@"非同期通信" forState:UIControlStateNormal];
//    // ボタンがタッチダウンされた時に、hogeメソッドを呼び出す処理
//    [btnAS_get addTarget:self action:@selector(sendAS_get)
//    forControlEvents:UIControlEventTouchDown];

    
    
    [self.view addSubview:btnProperty];
    [self.view addSubview:btnAS];
    [self.view addSubview:btn];
//    [self.view addSubview:btnAS_get];
//    [self.view addSubview:btn_get];

    [self.view addSubview:field];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



/**
 * アップロードするファイルをNSDataとして取得する
 */
/*
-(NSData *)getUploadFile
{
	NSString *dataPath = [[NSBundle mainBundle] pathForResource:@"83978" ofType:@"caf"];
	NSFileManager *fm = [NSFileManager defaultManager];
	NSData *data;
	if([fm fileExistsAtPath:dataPath])
	{
		NSFileHandle *handle = [NSFileHandle fileHandleForReadingAtPath:dataPath];
		data = [handle readDataToEndOfFile];
		[handle closeFile];
	}
	return data;
}
 */

/////////////////////////////////////////////////////////////////////////////////////
//同期通信
// POSTでアップロードする。
-(void)send
{
    message = field.text;
    NSString *query = [NSString stringWithFormat:@"id=%@", message];
    NSData *queryData = [query dataUsingEncoding:NSUTF8StringEncoding];
    //送り先
    NSString *url = @"http://554526661036de62.lolipop.jp/home/www/data_box/index.php";
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc]init];
    [request setURL:[NSURL URLWithString:url]];
    [request setHTTPMethod:@"POST"];
    [request setHTTPBody:queryData];
    
    NSURLResponse *response;
    NSError *error;
    NSData *result = [NSURLConnection sendSynchronousRequest:request
                                           returningResponse:&response
                                                       error:&error];
    NSString *string = [[NSString alloc]initWithData:result encoding:NSUTF8StringEncoding];

    //NSLog(@"%@", string);
#if DEBUG
    NSLog(@"fin_log");
#endif
    
    
}
///////////////////////////////////////////////////////////////////////////////////



//非同期通信
-(void)sendAS{
    NSString *query = [NSString stringWithFormat:@"id=%@", @"sample"];
    NSData *queryData = [query dataUsingEncoding:NSUTF8StringEncoding];
    
    NSString *url = @"http://554526661036de62.lolipop.jp/home/www/data_box/index.php";
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc]init];
    [request setURL:[NSURL URLWithString:url]];
    [request setHTTPMethod:@"POST"];
    [request setHTTPBody:queryData];
    
    [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
    [NSURLConnection connectionWithRequest:request delegate:self];
#if DEBUG
    NSLog(@"debug_log");
#endif
    
}

//つまりはメソッドの中身は問題なく送ってるけど、、、って感じ
- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response {
    NSLog(@"receive response");
}


- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data {
    NSError *jsonError;
    NSMutableArray *returnedData = [[NSMutableArray alloc] init];
    returnedData = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&jsonError];
    NSLog(@"%@", returnedData);
}


- (void)connectionDidFinishLoading: (NSURLConnection *)connection {
    [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
    NSLog(@"finish connection");
}


-(void)writing{
    checkDataViewController*tab1 = [[checkDataViewController alloc]init];
    if (tab1.array.count == 0) {
        [self alert];
        
    }else{
#if DEBUG
    NSLog(@"debug_property:%@", tab1.array);
#endif
    
    field.text = tab1.array[1];
    }
}

-(void)alert
{
    UIAlertView *alert =
    [[UIAlertView alloc] initWithTitle:@"アラート" message:@"arrayが空ですよ。ごはんですよ。"
                              delegate:self cancelButtonTitle:@"おけ、ごめんね" otherButtonTitles:nil];
    [alert show];
}




@end
