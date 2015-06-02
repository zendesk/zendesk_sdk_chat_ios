/*
 *
 *  ZDCAgentOptionsCell.m
 *  ZDCChat
 *
 *  Created by Zendesk on 24/09/2014.
 *
 *  Copyright (c) 2015 Zendesk. All rights reserved.
 *
 *  By downloading or using the Zopim Chat SDK, You agree to the Zendesk Terms
 *  of Service https://www.zendesk.com/company/terms and Application Developer and API License
 *  Agreement https://www.zendesk.com/company/application-developer-and-api-license-agreement and
 *  acknowledge that such terms govern Your use of and access to the Chat SDK.
 *
 */

#import "ZDCAgentChatCell.h"

/**
 * View foer presenting a shortcut option.
 */
@interface ZDCOptionView : UIView

/**
 * The index of this option.
 */
@property (nonatomic, assign) NSInteger optionIndex;

/**
 * If this option is presented as selected.
 */
@property (nonatomic, assign) BOOL selected;

/**
 * The radio button view.
 */
@property (nonatomic, strong) UIView *radio;

/**
 * The option text view.
 */
@property (nonatomic, strong) UILabel *optionText;

/**
 * Bubble insets.
 */
@property (nonatomic, assign) UIEdgeInsets optionBubbleInsets;

/*
 * Text insets.
 */
@property (nonatomic, assign) UIEdgeInsets optionTextInsets;


/**
 * Create a new option view with the option text provided.
 * @param frame the initial frame for the view
 * @param option the option text
 * @return the new instance
 */
- (instancetype) initWithFrame:(CGRect)frame andOption:(NSString*)option;


@end


#pragma mark -


/**
 * Option delegate for notifying of selection and providing a cache of views.
 */
@protocol ZDCOptionDelegate <NSObject>


/**
 * Notify that an option has been selected.
 * @param event the event for which an option was selected
 * @param index the index of the selected
 */
- (void) optionSelected:(ZDCChatEvent*)event;

/**
 * Get an option view from the queue, creating new object as necessary.
 * @param option the option string
 * @param index the option index
 * @param radioRadius the radius of the radio button
 * @param borderColor the border color for the option bubble and radio button
 * @param font the option text font
 * @param textColor the option text color
 * @param bubbleCornerRadius the option bubble corner radius
 * @param backgroundColor the bubble background color
 * @return the option view
 */
- (ZDCOptionView*) dequeueOptionView:(NSString*)option
                             atIndex:(NSInteger)index
                         radioRadius:(CGFloat)radioRadius
                         borderColor:(UIColor*)borderColor
                                font:(UIFont*)font
                           textColor:(UIColor*)textColor
                  bubbleCornerRadius:(CGFloat)bubbleCornerRadius
                     backgroundColor:(UIColor*)backgroundColor;

/**
 * Return an optin view to the queue;
 */
- (void) requeueOptionView:(ZDCOptionView*)optionView;

/**
 * String size cache.
 * @param string the string to be sized
 * @param font presentation font
 * @param width the available text width
 * @return the calculated size
 */
- (CGFloat) sizeOfString:(NSString*)string usingFont:(UIFont*)font forWidth:(CGFloat)width;


@end


#pragma mark -


@interface ZDCAgentOptionsCell : ZDCAgentChatCell


/**
 * Array of views which present an option list.
 */
@property (nonatomic, strong) NSMutableArray *options;

/**
 * Selection delegate.
 */
@property (nonatomic, weak) id<ZDCOptionDelegate>optionDelegate;

/**
 * Animate the cell to the selected option.
 */
- (void) animateSelectedOption;


@end

