//
//  AppDelegate.m
//  backgroundProcessing
//
//  Created by ShikshaPC-41 on 23/02/15.
//  Copyright (c) 2015 Shiksha Infotech Pvt Ltd. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"

@interface AppDelegate ()
@property (nonatomic, strong)ViewController *vc;
@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    self.vc = [[ViewController alloc]init];
    if([UIApplication instancesRespondToSelector:@selector(registerUserNotificationSettings:)])
    {
        [[UIApplication sharedApplication] registerUserNotificationSettings:[UIUserNotificationSettings settingsForTypes: UIUserNotificationTypeSound | UIUserNotificationTypeBadge | UIUserNotificationTypeAlert categories:nil]];
        [[UIApplication sharedApplication]setApplicationIconBadgeNumber:0];
    }
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    
    [[self.vc labelAlert]setHidden:YES];
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    
    [[self.vc labelAlert] setHidden:YES];
}

-(void)application:(UIApplication *)application didReceiveLocalNotification:(UILocalNotification *)notification
{
//    self.vc.labelAlert = [notification description];
    [self.vc.labelAlert setText:[NSString stringWithFormat:@"NOTIF->%@",notification]];
    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"local notif" message:notification.alertBody delegate:self cancelButtonTitle:@"ok" otherButtonTitles:nil, nil];
    [alert show];
}

- (void)application:(UIApplication *)application handleActionWithIdentifier:(NSString *)identifier forLocalNotification:(UILocalNotification *)notification completionHandler:(void(^)())completionHandler{
    [self.vc.labelAlert setText:notification.alertBody];
    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"local notif" message:notification.alertBody delegate:self cancelButtonTitle:@"ok" otherButtonTitles:nil, nil];
    [alert show];
}

@end
