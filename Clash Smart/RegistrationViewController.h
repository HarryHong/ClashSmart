//
//  RegisterViewController.h
//  Clash Smart
//
//  Created by honghao on 2015-02-02.
//  Copyright (c) 2015 Joshua Jiang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RegistrationViewController : UIViewController

@property (strong, nonatomic) IBOutlet UITextField *txtUserName;
@property (strong, nonatomic) IBOutlet UITextField *txtEmail;
@property (strong, nonatomic) IBOutlet UITextField *txtPassword;
@property (strong, nonatomic) IBOutlet UITextField *txtCFMPassword;



-(IBAction)btnRegisterPressed:(id)sender;

@end
