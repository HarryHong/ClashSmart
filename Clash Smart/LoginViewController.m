//
//  LoginViewController.m
//  Clash Smart
//
//  Created by honghao on 2015-02-02.
//  Copyright (c) 2015 Joshua Jiang. All rights reserved.
//

#import "LoginViewController.h"
#import "RegistrationViewController.h"
#import <Parse/Parse.h>
#import <FacebookSDK/FacebookSDK.h>


@interface LoginViewController ()

@end

@implementation LoginViewController
@synthesize delegate;
@synthesize txtEmail, txtPassword;

- (void)viewDidLoad {
    [super viewDidLoad];
    FBLoginView *loginView = [[FBLoginView alloc] init];
    loginView.center = self.view.center;
    [self.view addSubview:loginView];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

-(IBAction)btnRegistrationPressed:(id)sender
{
    RegistrationViewController *registrationView    =   [self.storyboard instantiateViewControllerWithIdentifier:@"registrationView"];
    registrationView.delegate = self;
    UINavigationController *navController   =   [[UINavigationController alloc] initWithRootViewController:registrationView];
    
    [UIView transitionWithView:self.view.window
                      duration:0.5
                       options:UIViewAnimationOptionTransitionFlipFromLeft
                    animations:^{ [self.navigationController presentViewController:navController animated:NO completion:nil]; }
                    completion:nil];
}

/**
 *  Remove Registration View and back to login view
 */
-(void)dismissRegistrationView
{
    [UIView transitionWithView:self.view
                      duration:0.5
                       options:UIViewAnimationOptionTransitionFlipFromRight
                    animations:^{ [self dismissViewControllerAnimated:NO completion:nil]; }
                    completion:nil];

#pragma mark - login button tap
-(IBAction) btnLoginPressed:(id)sender
{
    [txtEmail resignFirstResponder];
    [txtPassword resignFirstResponder];
    
    if ([self isValid]) {
        [DSBezelActivityView newActivityViewForView:self.view.window];
        NSDictionary *dictOfParameters  =   [[NSDictionary alloc] initWithObjectsAndKeys:self.txtEmail.text,@"email",self.txtPassword.text,@"pwd", nil];
        
        [Utility GetDataForMethod:NSLocalizedString(@"LOGIN_METHOD", @"LOGIN_METHOD") parameters:dictOfParameters key:@"" withCompletion:^(id response){
            
            [DSBezelActivityView removeViewAnimated:YES];
            if ([response isKindOfClass:[NSArray class]]) {
                
                if ([[[response objectAtIndex:0] objectForKey:@"status"] intValue] == 0) {
                    [Utility alertNotice:@"" withMSG:[[response objectAtIndex:0] objectForKey:@"message"] cancleButtonTitle:@"OK" otherButtonTitle:nil];
                }
                else{
                    [Utility setNSUserDefaultValueForString:[[response objectAtIndex:0] objectForKey:@"user_id"] strKey:KUSERID];
                    
                    UIAlertView *av = [[UIAlertView alloc] initWithTitle:APPNAME message:@"Login Successful" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
                    [av setTag:99];
                    [av show];
                }
            }
            else if ([response isKindOfClass:[NSDictionary class]]){
                if ([[response objectForKey:@"status"] intValue] == 0) {
                    [Utility alertNotice:@"" withMSG:[response objectForKey:@"message"] cancleButtonTitle:@"OK" otherButtonTitle:nil];
                }
                else{
                    [Utility setNSUserDefaultValueForString:[response objectForKey:@"user_id"] strKey:KUSERID];
                    UIAlertView *av = [[UIAlertView alloc] initWithTitle:APPNAME message:@"Login Successful" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
                    [av setTag:99];
                    [av show];
                }
                
            }
            
        }WithFailure:^(NSString *error){
            NSLog(@"%@",error);
            [DSBezelActivityView removeViewAnimated:YES];
        }];
    }
}

-(BOOL)isValid
{
    NSString *message   =   @"";
    if (![txtEmail.text length]>0) {
        message =   @"Please enter email";
    }
    else if (![txtPassword.text length]>0){
        message =   @"Please enter password";
    }
    else if (![self validateEmail:txtEmail.text]){
        message =   @"Please enter valid email";
    }
    
    if ([message length]>0) {
        [Utility alertNotice:APPNAME withMSG:message cancleButtonTitle:@"OK" otherButtonTitle:nil];
        return NO;
    }
    return YES;
}

#pragma mark - email validation
-(BOOL)validateEmail:(NSString *) candidate {
    NSString *emailRegex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return [emailTest evaluateWithObject:candidate];
}

#pragma mark - Alert View Delegates
-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (alertView.tag == 99) {
        if (delegate) {
            [delegate dismissLoginView];
        }
    }
}


@end
