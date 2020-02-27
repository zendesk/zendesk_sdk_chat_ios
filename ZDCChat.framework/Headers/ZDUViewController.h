/*
 *
 *  ZDUViewController.h
 *  ZDCChat
 *
 *  Created by Zendesk on 29/04/2014.
 *
 *  Copyright (c) 2016 Zendesk. All rights reserved.
 *
 *  By downloading or using the Zendesk Mobile SDK, You agree to the Zendesk Master
 *  Subscription Agreement https://www.zendesk.com/company/customers-partners/#master-subscription-agreement and Application Developer and API License
 *  Agreement https://www.zendesk.com/company/customers-partners/#application-developer-api-license-agreement and
 *  acknowledge that such terms govern Your use of and access to the Mobile SDK.
 *
 */


#import <UIKit/UIKit.h>


/**
 * Base view controller class used by ZD components containing frequently used methods.
 */
@interface ZDUViewController : UIViewController

/**
 * Current keyboard height.
 */
@property (nonatomic, assign) CGFloat keyboardHeight;

/** 
 * Requires existence of navigation controller in parent view controller.
 */
@property (nonatomic, assign) BOOL requiresNavBar;

/**
 * The content view for this view controller. Any subviews should be added this.
 *
 * All subclasses should use this view as a base for their view hierarchy.
 */
@property (nonatomic, strong) UIView *contentView;

/**
 * The height of the currently displayed toast.
 */
@property (nonatomic, assign) CGFloat toastHeight;

#pragma mark keyboard event handling

/**
 * Called when the keyboard will show, invoke [super keyboardWillShow:]
 * @param aNotification the notification
 */
- (void) keyboardWillShow:(NSNotification*)aNotification;

/**
 * Called when the keyboard was shown, invoke [super keyboardDidShow:]
 * @param aNotification the notification
 */
- (void) keyboardDidShow:(NSNotification*)aNotification;

/**
 * Called when the keyboard is about to be hidden, invoke [super keyboardWillHide:]
 * @param aNotification the notification
 */
- (void) keyboardWillHide:(NSNotification*)aNotification;


#pragma mark toasts


/**
 * Dismiss the active toast.
 */
- (void) dismissActiveToast:(BOOL)animated;


#pragma mark offsets


/**
 * Top offset for IOS7+ transparent status and nav bars
 */
- (CGFloat) topViewOffset;

/**
 * Bottom offset for IOS7+ transparent toolbars
 */
- (CGFloat) bottomViewOffset;


#pragma mark - view controller utils


/**
 * Invoked if the view is about to be removed.
 */
- (void) viewWillBeDismissed;

/**
 * Get the top view controller from thw app window.
 *
 * @return the top view controller for the app.
 */
+ (UIViewController*) topViewController;

/**
 * Get the top view controller from root controller provided.
 *
 * @param the root view controller from which to start looking
 * @return the top view controller
 */
+ (UIViewController*) topViewControllerWithRootViewController:(UIViewController*)rootViewController;

/**
 * Present the view controller. If the current top view controller 
 * is or has a navigation controller then the view will be pushed on 
 * to that controller, otherwise a new navigation controller will be
 * pushed (vertical transition).
 */
+ (void) presentViewController:(UIViewController*)viewController requiresNavController:(BOOL)requiresNav;


@end

