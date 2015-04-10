/*
 *
 *  ZDChatVisitorChatCell.h
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

#import <UIKit/UIKit.h>
#import "ZDCChatCell.h"


/**
 * Delegate handling resend requests and state.
 */
@protocol ZDCMessageResendDelegate <NSObject>


/*
 * Check if the provided event has timed out and is not in the middle of a resend.
 * @param event the event to be evaluated
 * @return YES if the event should be presented as unsent
 */
- (BOOL) eventHasTimedOut:(ZDCChatEvent*)event;

/*
 * Request that a message is resent.
 * @param event the event for the message to resend
 */
- (void) resendMessage:(ZDCChatEvent*)event;


@end


#pragma mark -


/**
 * Cell for presenting a visitor chat message.
 */
@interface ZDCVisitorChatCell : ZDCChatCell


/**
 * Label displaying the chat message.
 */
@property (nonatomic, strong) UILabel *chatMessage;

/**
 * Chat bubble surrounding the message.
 */
@property (nonatomic, strong) UIButton *bubble;

/**
 * If a message is flagged as unsent this icon is displayed to the right of the message bubble.
 */
@property (nonatomic, strong) UIImageView *unsentMessageIcon;

/**
 * If a message is unsent this label is displayed under the message bubble.
 */
@property (nonatomic, strong) UILabel *unsentMessageLabel;

/**
 * YES if this cell current showing or transitioning to unsent state.
 */
@property (nonatomic, assign) BOOL unsent;

/**
 * Message resend delegate for checking message timeouts and requesting resend.
 */
@property (nonatomic, weak) id<ZDCMessageResendDelegate> resendDelegate;


#pragma mark appearance


/**
 * Insets of the chat bubble within the cell.
 */
@property (nonatomic, strong) NSValue *bubbleInsets UI_APPEARANCE_SELECTOR;

/**
 * Left margin for the unsent icon.
 */
@property (nonatomic, strong) NSNumber *unsentIconLeftMargin UI_APPEARANCE_SELECTOR;

/**
 * Margin between the bottom of the chat bubble and the top of the unsent message.
 */
@property (nonatomic, strong) NSNumber *unsentMessageTopMargin UI_APPEARANCE_SELECTOR;

/**
 * Unsent icon image name.
 */
@property (nonatomic, strong) NSString *unsentIconImage UI_APPEARANCE_SELECTOR;

/**
 * Border color of the chat bubble.
 */
@property (nonatomic, strong) UIColor *bubbleBorderColor UI_APPEARANCE_SELECTOR;

/**
 * Fill color of the chat bubble.
 */
@property (nonatomic, strong) UIColor *bubbleColor UI_APPEARANCE_SELECTOR;

/**
 * Corner radius of the chat bubble.
 */
@property (nonatomic, strong) NSNumber *bubbleCornerRadius UI_APPEARANCE_SELECTOR;

/**
 * Insets of the text within the chat bubble.
 */
@property (nonatomic, strong) NSValue *textInsets UI_APPEARANCE_SELECTOR;

/**
 * Text alignment of the text wrapped as NSNumber.
 */
@property (nonatomic, strong) NSNumber *textAlignment UI_APPEARANCE_SELECTOR;

/**
 * Label text colour.
 */
@property (nonatomic, strong) UIColor *textColor UI_APPEARANCE_SELECTOR;

/**
 * Label font.
 */
@property (nonatomic, strong) UIFont *textFont UI_APPEARANCE_SELECTOR;

/**
 * Unsent label text colour.
 */
@property (nonatomic, strong) UIColor *unsentTextColor UI_APPEARANCE_SELECTOR;

/**
 * Unsent label font.
 */
@property (nonatomic, strong) UIFont *unsentTextFont UI_APPEARANCE_SELECTOR;


/**
 * Performs the animation from sent to unsent state.
 */
- (void) animateToUnsent;

/**
 * Performs the animation from unsent to sent state.
 */
- (void) animateToSent;


@end

