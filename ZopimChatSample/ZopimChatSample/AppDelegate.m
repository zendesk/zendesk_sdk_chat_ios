/*
 *
 *  AppDelegate.m
 *  ZDCChat
 *
 *  Created by Zendesk on 27/10/2014.
 *
 *  Copyright (c) 2015 Zendesk. All rights reserved.
 *
 *  By downloading or using the Zopim Chat SDK, You agree to the Zendesk Terms
 *  of Service https://www.zendesk.com/company/terms and Application Developer and API License
 *  Agreement https://www.zendesk.com/company/application-developer-and-api-license-agreement and
 *  acknowledge that such terms govern Your use of and access to the Chat SDK.
 *
 */


#import "AppDelegate.h"
#import "ViewController.h"
#import "ChatStyling.h"


@implementation AppDelegate


- (BOOL) application:(UIApplication*)application didFinishLaunchingWithOptions:(NSDictionary*)launchOptions
{
    ////////////////////////////////////////////////////////////////////////////////////////////////
    // Chat setup
    ////////////////////////////////////////////////////////////////////////////////////////////////

    // apply appearance styling first if you want to customise the look of the chat
    [ChatStyling applyStyling];

    // configure account key and pre-chat form
    [ZDCChat configure:^(ZDCConfig *defaults) {

        defaults.accountKey = @"your account key here";
        defaults.preChatDataRequirements.name = ZDCPreChatDataOptional;
        defaults.preChatDataRequirements.email = ZDCPreChatDataOptional;
        defaults.preChatDataRequirements.phone = ZDCPreChatDataOptional;
        defaults.preChatDataRequirements.department = ZDCPreChatDataOptional;
        defaults.preChatDataRequirements.message = ZDCPreChatDataOptional;
    }];

    // To override the default avatar uncomment and complete the image name
    //[[ZDCChatAvatar appearance] setDefaultAvatar:@"your_avatar_name_here"];

    // Uncomment to disable visitor data persistence between application runs
    //[[ZDCChat instance].session visitorInfo].shouldPersist = NO;

    // Uncomment if you don't want open chat sessions to be automatically resumed on application launch
    //[ZDCChat instance].shouldResumeOnLaunch = NO;

    // remember to switch off debug logging before app store submission!
    [ZDCLog enable:YES];
    [ZDCLog setLogLevel:ZDCLogLevelWarn];

    ////////////////////////////////////////////////////////////////////////////////////////////////
    // sample app boiler plate
    ////////////////////////////////////////////////////////////////////////////////////////////////

    NSSetUncaughtExceptionHandler(&uncaughtExceptionHandler);

    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor colorWithWhite:0.94f alpha:1.0f];

    // top view controller
    ViewController *vc = [[ViewController alloc] initWithNibName:nil bundle:nil];

    // nav controller
    UINavigationController *navController = [[UINavigationController alloc] initWithRootViewController:vc];

    // assign nav controller as root
    self.window.rootViewController = navController;

    // make key window
    [self.window makeKeyAndVisible];

    if ([ZDUUtil isVersionOrNewer:@(7)]) {

        // status bar
        [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];

        // nav bar
        NSDictionary *navbarAttributes = [NSDictionary dictionaryWithObjectsAndKeys:
                                          [UIColor whiteColor] ,UITextAttributeTextColor, nil];
        [[UINavigationBar appearance] setTintColor:[UIColor whiteColor]];
        [[UINavigationBar appearance] setBarTintColor:[UIColor colorWithRed:0.91f green:0.16f blue:0.16f alpha:1.0f]];
        [[UINavigationBar appearance] setTitleTextAttributes:navbarAttributes];

        // For translucent nav bars set YES
        [[UINavigationBar appearance] setTranslucent:NO];

        // For a completely transparent nav bar uncomment this and set 'translucent' above to YES
        // (you may also want to change the title text and tint colors above since they are white by default)
        //[[UINavigationBar appearance] setBarStyle:UIBarStyleDefault];
        //[[UINavigationBar appearance] setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
        //[[UINavigationBar appearance] setShadowImage:[UIImage new]];
        //[[UINavigationBar appearance] setBackgroundColor:[UIColor clearColor]];
    }
    return YES;
}


void uncaughtExceptionHandler(NSException *exception) {
    NSLog(@"CRASH: %@", exception);
    NSLog(@"Stack Trace: %@", [exception callStackSymbols]);
}



@end

