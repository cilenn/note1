//
//  AppDelegate.m
//  dataSend_server
//
//  Created by kazuhiro on 2014/05/28.
//  Copyright (c) 2014年 kazuhiro. All rights reserved.
//

#import "AppDelegate.h"
#import "dataSendViewController.h"
#import "checkDataViewController.h"



@implementation AppDelegate
@synthesize root;
@synthesize appArray;



- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor whiteColor];
    
    //ViewControllerを格納する配列を用意する
    NSMutableArray *viewControllers = [[NSMutableArray alloc] init];
    
    //それぞれのViewControllerを初期化
    dataSendViewController *tab1 = [[dataSendViewController alloc]init];
    checkDataViewController *tab2 = [[checkDataViewController alloc]init];
    
    
    //それぞれNavigationControllerにセット
    //一個ずつ配列に追加していきます。
    UINavigationController *firstNavi = [[UINavigationController alloc] initWithRootViewController:tab1];
    [firstNavi setNavigationBarHidden:NO]; //今回は最初のタブだけナビゲーションバーを非表示に設定。
    [viewControllers addObject:firstNavi];
    
    UINavigationController *secondNavi = [[UINavigationController alloc] initWithRootViewController:tab2];
    [viewControllers addObject:secondNavi];
    
    //最後にTabBarをセットして完了です。
    self.root = [[UITabBarController alloc] init];
    [self.root setViewControllers:viewControllers];
    
    self.window.rootViewController = self.root;
    
    [self.window makeKeyAndVisible];
    
    return YES;

}




- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
