//
//  LoginViewController.h
//  Clash Smart
//
//  Created by honghao on 2015-02-02.
//  Copyright (c) 2015 Joshua Jiang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>
#import <FacebookSDK/FacebookSDK.h>

@interface LoginViewController : UIViewController


@end
@interface LoginViewController : UIViewController<UITextFieldDelegate,registrationViewDelegate,UIAlertViewDelegate>
{
    id<loginViewDelegate> __unsafe_unretained delegate;
}

@property(nonatomic,assign) id<loginViewDelegate> __unsafe_unretained delegate;

@property (strong, nonatomic) IBOutlet UITextField *txtEmail;
@property (strong, nonatomic) IBOutlet UITextField *txtPassword;

-(IBAction)btnLoginPressed:(id)sender;
-(IBAction)btnRegistrationPressed:(id)sender;
@end
