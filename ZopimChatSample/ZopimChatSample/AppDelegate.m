/*
 *
 *  AppDelegate.m
 *  ZDCChat
 *
 *  Created by Zendesk on 27/10/2014.
 *
 *  Copyright (c) 2016 Zendesk. All rights reserved.
 *
 *  By downloading or using the Zendesk Mobile SDK, You agree to the Zendesk Master
 *  Subscription Agreement https://www.zendesk.com/company/customers-partners/#master-subscription-agreement and Application Developer and API License
 *  Agreement https://www.zendesk.com/company/customers-partners/#application-developer-api-license-agreement and
 *  acknowledge that such terms govern Your use of and access to the Mobile SDK.
 *
 */


#import "AppDelegate.h"
#import "ViewController.h"
#import "ChatStyling.h"


@implementation AppDelegate

- (BOOL) application:(UIApplication*)application didFinishLaunchingWithOptions:(NSDictionary*)launchOptions
{
    [self styleApp];

    ////////////////////////////////////////////////////////////////////////////////////////////////
    // Chat setup
    ////////////////////////////////////////////////////////////////////////////////////////////////

    // apply appearance styling first if you want to customise the look of the chat
    //[ChatStyling applyStyling];

    // configure account key and pre-chat form
    [ZDCChat initializeWithAccountKey:@"your account key here"];

    // Uncomment to disable visitor data persistence between application runs
    //[[ZDCChat instance].session visitorInfo].shouldPersist = NO;

    // Uncomment if you don't want open chat sessions to be automatically resumed on application launch
    //[ZDCChat instance].shouldResumeOnLaunch = NO;

    // remember to switch off debug logging before app store submission!
    [ZDCLog enable:YES];
    [ZDCLog setLogLevel:ZDCLogLevelWarn];
    
    [[ZDCChat instance].overlay setEnabled:NO];

    ////////////////////////////////////////////////////////////////////////////////////////////////
    // sample app boiler plate
    ////////////////////////////////////////////////////////////////////////////////////////////////

    NSSetUncaughtExceptionHandler(&uncaughtExceptionHandler);

    [self setupRootViewController];
    [self.window makeKeyAndVisible];
    
    // push notifications
    [self requestPermissions];

    return YES;
}

- (void) setupRootViewController
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor colorWithWhite:0.94f alpha:1.0f];

    // top view controller
    ViewController *vc = [[ViewController alloc] initWithNibName:nil bundle:nil];

    // nav controller
    UINavigationController *navController = [[UINavigationController alloc] initWithRootViewController:vc];

    // assign nav controller as root
    self.window.rootViewController = navController;

}

- (void) styleApp
{
    // status bar
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];

    // nav bar
    NSDictionary *navbarAttributes = [NSDictionary dictionaryWithObjectsAndKeys:
                                      [UIColor whiteColor] ,NSForegroundColorAttributeName, nil];
    [[UINavigationBar appearance] setTintColor:[UIColor whiteColor]];
    [[UINavigationBar appearance] setTitleTextAttributes:navbarAttributes];
    [[UINavigationBar appearance] setBarTintColor:[UIColor colorWithRed:0.91f green:0.16f blue:0.16f alpha:1.0f]];

    if ([self isVersionOrNewer:@"8.0"]) {

        // For translucent nav bars set YES
        [[UINavigationBar appearance] setTranslucent:YES];
    }

    // For a completely transparent nav bar uncomment this and set 'translucent' above to YES
    // (you may also want to change the title text and tint colors above since they are white by default)
    //[[UINavigationBar appearance] setBarStyle:UIBarStyleDefault];
    //[[UINavigationBar appearance] setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
    //[[UINavigationBar appearance] setShadowImage:[UIImage new]];
    //[[UINavigationBar appearance] setBackgroundColor:[UIColor clearColor]];
}


- (void) requestPermissions
{
    UIUserNotificationSettings *s = [UIUserNotificationSettings settingsForTypes:(UIUserNotificationTypeSound |
                                                                                  UIUserNotificationTypeAlert |
                                                                                  UIUserNotificationTypeBadge)
                                                                      categories:nil];

    [[UIApplication sharedApplication] registerUserNotificationSettings:s];
}


- (void) application:(UIApplication*)application
    didRegisterUserNotificationSettings:(UIUserNotificationSettings*)notificationSettings
{
    [[UIApplication sharedApplication] registerForRemoteNotifications];
}


- (void) application:(UIApplication*)app didRegisterForRemoteNotificationsWithDeviceToken:(NSData*)tokenData
{
    [ZDCLog i:@"App obtained push token"];
    [ZDCChat setPushToken:tokenData];
}


- (void) application:(UIApplication*)app didFailToRegisterForRemoteNotificationsWithError:(NSError*)err
{
    [ZDCLog i:@"App failed to obtain push token"];
}


- (void) application:(UIApplication*)application didReceiveRemoteNotification:(NSDictionary*)userInfo
{
    [self setupRootViewController];
    [self.window makeKeyAndVisible];
    
    dispatch_async(dispatch_get_main_queue(), ^{
        [ZDCChat didReceiveRemoteNotification:userInfo];
    });
}

- (BOOL) application:(UIApplication *)application shouldRestoreApplicationState:(NSCoder *)coder
{
    return true;
}


void uncaughtExceptionHandler(NSException *exception) {
    [ZDCLog e:@"CRASH: %@", exception];
    [ZDCLog e:@"Stack Trace: %@", [exception callStackSymbols]];
}

- (BOOL) isVersionOrNewer:(NSString*)majorVersionNumber {
  return [[[UIDevice currentDevice] systemVersion] compare:majorVersionNumber options:NSNumericSearch] != NSOrderedAscending;
}

@end

