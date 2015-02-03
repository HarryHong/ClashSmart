//
//  CreateWarViewController.m
//  Clash Smart
//
//  Created by Joshua Jiang on 2015-02-02.
//  Copyright (c) 2015 Joshua Jiang. All rights reserved.
//

#import "CreateWarViewController.h"

@interface CreateWarViewController () {
    NSArray *warSizeArray;
    NSArray *timerArray;
}

@end

@implementation CreateWarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    warSizeArray = @[@"10 vs 10", @"15 vs 15", @"20 vs 20", @"25 vs 25", @"30 vs 30", @"35 vs 35", @"40 vs 40", @"45 vs 45", @"50 vs 50"];
    timerArray = @[@"Quarter", @"Half Hour", @"1hr", @"2hr", @"3hr", @"4hr", @"5hr", @"6hr", @"7hr", @"8hr", @"9hr", @"10hr", @"12hr", @"16hr", @"20hr", @"24hr"];
    
    UIPickerView *warSizePickerView = [[UIPickerView alloc] initWithFrame:CGRectMake(0, 0, 0, 0)];
    warSizePickerView.tag = 11;
    warSizePickerView.showsSelectionIndicator = YES;
    warSizePickerView.dataSource = self;
    warSizePickerView.delegate = self;
    
    UIPickerView *timerPickerView = [[UIPickerView alloc] initWithFrame:CGRectMake(0, 0, 0, 0)];
    timerPickerView.tag = 11;
    timerPickerView.showsSelectionIndicator = YES;
    timerPickerView.dataSource = self;
    timerPickerView.delegate = self;
    
    // set change the inputView (default is keyboard) to UIPickerView
    self.warSizeTextField.inputView = warSizePickerView;
    self.timerTextField.inputView = timerPickerView;
    
    // add a toolbar with Cancel & Done button
    UIToolbar *toolBar = [[UIToolbar alloc] initWithFrame:CGRectMake(0, 0, 320, 44)];
    toolBar.barStyle = UIBarStyleBlackOpaque;
    
    UIBarButtonItem *doneButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(doneTouched:)];
    UIBarButtonItem *cancelButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCancel target:self action:@selector(cancelTouched:)];
    
    // the middle button is to make the Done button align to right
    [toolBar setItems:[NSArray arrayWithObjects:cancelButton, [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil], doneButton, nil]];
    self.warSizeTextField.inputAccessoryView = toolBar;
    self.timerTextField.inputAccessoryView = toolBar;
}

- (void)cancelTouched:(UIBarButtonItem *)sender
{
    // hide the picker view
    [self.warSizeTextField resignFirstResponder];
    [self.timerTextField resignFirstResponder];
}

- (void)doneTouched:(UIBarButtonItem *)sender
{
    // hide the picker view
    [self.warSizeTextField resignFirstResponder];
    [self.timerTextField resignFirstResponder];
    
    // perform some action
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

@end
