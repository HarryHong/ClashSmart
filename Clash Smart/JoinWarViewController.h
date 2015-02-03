//
//  JoinWarViewController.h
//  Clash Smart
//
//  Created by Joshua Jiang on 2015-02-02.
//  Copyright (c) 2015 Joshua Jiang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JoinWarViewController : UIViewController

@property (strong, nonatomic) IBOutlet UITextField *joinId;
@property (strong, nonatomic) IBOutlet UIButton *joinButton;

-(IBAction)joinButtonTapped:(id)sender;

@end
