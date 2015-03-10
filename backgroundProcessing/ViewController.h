//
//  ViewController.h
//  backgroundProcessing
//
//  Created by ShikshaPC-41 on 23/02/15.
//  Copyright (c) 2015 Shiksha Infotech Pvt Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UITextFieldDelegate>

- (IBAction)addNotification:(id)sender;

@property (weak, nonatomic) IBOutlet UIDatePicker *datePicker;
@property (weak, nonatomic) IBOutlet UITextField *textField;

@property (weak, nonatomic) IBOutlet UILabel *labelAlert;


@end

