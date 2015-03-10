//
//  ViewController.m
//  backgroundProcessing
//
//  Created by ShikshaPC-41 on 23/02/15.
//  Copyright (c) 2015 Shiksha Infotech Pvt Ltd. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
bool allowsNotif;
bool allowsSound;
bool allowsBadge;
bool allowsAlert;
@synthesize labelAlert;


- (void)viewDidLoad
{
    NSNotificationCenter *center = [NSNotificationCenter defaultCenter];
    [center addObserverForName:nil
                        object:nil
                         queue:nil
                    usingBlock:^(NSNotification *notification)
    {
        NSLog(@"###%@", notification.name);
    }];
    self.datePicker.minimumDate = [NSDate date];
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)addNotification:(id)sender {
    
    UIUserNotificationType notificationType = UIUserNotificationTypeAlert | UIUserNotificationTypeBadge | UIUserNotificationTypeSound;
    
    UIUserNotificationSettings *settings = [UIUserNotificationSettings settingsForTypes:notificationType categories:nil];
    
    [[UIApplication sharedApplication]registerUserNotificationSettings:settings];
    
    UILocalNotification *localNotification = [[UILocalNotification alloc]init];
    
    if(localNotification)
    {
        if(allowsNotif)
        {
            [localNotification setFireDate:_datePicker.date];
            [localNotification setTimeZone:[NSTimeZone localTimeZone]];
            [localNotification setRepeatInterval:NSCalendarUnitDay];
        }
        
        if(allowsBadge)
        {
            [localNotification setApplicationIconBadgeNumber:[[UIApplication sharedApplication] applicationIconBadgeNumber]+1];
        }
        
        if(allowsAlert)
        {
            [localNotification setAlertBody:_textField.text];
        }
        if(allowsSound)
        {
            [localNotification setSoundName:UILocalNotificationDefaultSoundName];
        }
        
    }
//    [localNotification setFireDate:[NSDate dateWithTimeIntervalSinceNow:[_datePicker countDownDuration]]];
//    [localNotification setFireDate:_datePicker.date];
//    [localNotification setTimeZone:[NSTimeZone timeZoneWithAbbreviation:@"IST"]];
//    [localNotification setAlertAction:@"Launch"]; //The button's text that launches the application and is shown in the alert
//    NSLog(@"text %@", [self.textField  text]);
//    [localNotification setAlertBody:[self.textField text]]; //Set the message in the notification from the textField's text
//    [localNotification setHasAction: YES]; //Set that pushing the button will launch the application
//    [localNotification setApplicationIconBadgeNumber:[[UIApplication sharedApplication] applicationIconBadgeNumber]+1]; //Set the Application Icon Badge Number of the application's icon to the current Application Icon Badge Number plus 1
    
    [[UIApplication sharedApplication] scheduleLocalNotification:localNotification];
    [[UIApplication sharedApplication]presentLocalNotificationNow:localNotification];
    NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
    [formatter setDateFormat:@"MM-dd-yyy hh:mm"];
    [formatter setTimeZone:[NSTimeZone timeZoneWithAbbreviation:@"IST"]];
    [formatter stringFromDate:_datePicker.date];
}

-(void)setNotificationAllowed
{
    UIUserNotificationSettings *setting = [[UIApplication sharedApplication]currentUserNotificationSettings];
    
    allowsNotif = (setting.types != UIUserNotificationTypeNone);
    allowsSound = (setting.types & UIUserNotificationTypeSound) != 0;
    allowsBadge = (setting.types & UIUserNotificationTypeBadge) != 0;
    allowsAlert = (setting.types & UIUserNotificationTypeAlert) != 0;
}


-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [self.textField resignFirstResponder];
    return YES;
}

@end
