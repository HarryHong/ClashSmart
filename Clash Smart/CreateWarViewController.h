//
//  CreateWarViewController.h
//  Clash Smart
//
//  Created by Joshua Jiang on 2015-02-02.
//  Copyright (c) 2015 Joshua Jiang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CreateWarViewController : UIViewController<UIPickerViewDelegate, UIPickerViewDelegate>

@property (strong, nonatomic) IBOutlet UITextField *myClanName;
@property (strong, nonatomic) IBOutlet UITextField *enemyClanName;
@property (strong, nonatomic) IBOutlet UIButton *warSizeButton;
@property (strong, nonatomic) IBOutlet UIButton *timerButton;
@property (strong, nonatomic) IBOutlet UITextField *warSizeTextField;
@property (strong, nonatomic) IBOutlet UITextField *timerTextField;

@end
