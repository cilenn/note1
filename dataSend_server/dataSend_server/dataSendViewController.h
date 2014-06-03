//
//  dataSendViewController.h
//  dataSend_server
//
//  Created by kazuhiro on 2014/05/28.
//  Copyright (c) 2014年 kazuhiro. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "checkDataViewController.h"


@interface dataSendViewController : UIViewController
<UITextFieldDelegate>
{
    UITextField *field;
    NSString *message;
    
}


@end
