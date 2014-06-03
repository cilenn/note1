//
//  checkDataViewController.h
//  dataSend_server
//
//  Created by kazuhiro on 2014/05/28.
//  Copyright (c) 2014年 kazuhiro. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface checkDataViewController : UIViewController
<UITextFieldDelegate>
{
    UITextField *form;
    NSMutableArray *array;
}
@property (nonatomic, strong)NSMutableArray *array;
@property (nonatomic)NSString *challenge;



@end
