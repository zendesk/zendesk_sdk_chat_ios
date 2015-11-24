/*
 *
 *  ChatStyling.m
 *  ZDCChat
 *
 *  Created by Zendesk on 03/12/2014.
 *
 *  Copyright (c) 2015 Zendesk. All rights reserved.
 *
 *  By downloading or using the Zopim Chat SDK, You agree to the Zendesk Terms
 *  of Service https://www.zendesk.com/company/terms and Application Developer and API License
 *  Agreement https://www.zendesk.com/company/application-developer-and-api-license-agreement and
 *  acknowledge that such terms govern Your use of and access to the Chat SDK.
 *
 */


#import "ChatStyling.h"


@implementation ChatStyling


+ (void) applyStyling
{
    UIEdgeInsets insets;

    ////////////////////////////////////////////////////////////////////////////////////////////////
    // Configuring the chat widget/overlay
    ////////////////////////////////////////////////////////////////////////////////////////////////

    [[ZDCChat instance].overlay setEnabled:YES];
    [[ZDCChatOverlay appearance] setAlignment:@(ZDCOverlayAlignmentBottomLeft)];
    [[ZDCChatOverlay appearance] setMessageCountColor:[UIColor redColor]];
    [[ZDCChatOverlay appearance] setTypingIndicatorColor:[UIColor colorWithRed:1.0 green:0.0 blue:0.0 alpha:0.5f]];
    [[ZDCChatOverlay appearance] setTypingIndicatorHighlightColor:[UIColor redColor]];
    [[ZDCChatOverlay appearance] setTypingIndicatorDiameter:@(4.0f)];
    [[ZDCChatOverlay appearance] setMessageCountFont:[UIFont systemFontOfSize:15.0f]];
    [[ZDCChatOverlay appearance] setInsets:[NSValue valueWithUIEdgeInsets:UIEdgeInsetsMake(75.0f, 15.0f, 15.0f, 15.0f)]];

    ////////////////////////////////////////////////////////////////////////////////////////////////
    // Style the chat loading screen
    ////////////////////////////////////////////////////////////////////////////////////////////////

    [[ZDCLoadingView appearance] setLoadingLabelFont:[UIFont boldSystemFontOfSize:12.0f]];
    [[ZDCLoadingView appearance] setLoadingLabelTextColor:[UIColor colorWithWhite:0.2f alpha:1.0f]];

    ////////////////////////////////////////////////////////////////////////////////////////////////
    // Style loading errors/notifications
    ////////////////////////////////////////////////////////////////////////////////////////////////

    [[ZDCLoadingErrorView appearance] setIconImage:nil]; // provide an image name to override default image

    [[ZDCLoadingErrorView appearance] setTitleFont:[UIFont boldSystemFontOfSize:15.0f]];
    [[ZDCLoadingErrorView appearance] setTitleColor:[UIColor colorWithWhite:0.2f alpha:1.0f]];
    [[ZDCLoadingErrorView appearance] setMessageFont:[UIFont systemFontOfSize:15.0f]];
    [[ZDCLoadingErrorView appearance] setMessageColor:[UIColor colorWithWhite:0.2f alpha:1.0f]];
    [[ZDCLoadingErrorView appearance] setButtonFont:[UIFont boldSystemFontOfSize:15.0f]];
    [[ZDCLoadingErrorView appearance] setButtonTitleColor:[UIColor whiteColor]];
    [[ZDCLoadingErrorView appearance] setButtonBackgroundColor:[UIColor colorWithRed:0.35f green:0.73f blue:0.88f alpha:1.0f]];
    [[ZDCLoadingErrorView appearance] setButtonImage:nil]; // provide an image name to override default image

    ////////////////////////////////////////////////////////////////////////////////////////////////
    // Style the pre-chat form
    ////////////////////////////////////////////////////////////////////////////////////////////////

    insets = UIEdgeInsetsMake(10.0f, 15.0f, 0.0f, 15.0f);
    [[ZDCFormCellSingleLine appearance] setTextFrameInsets:[NSValue valueWithUIEdgeInsets:insets]];
    insets = UIEdgeInsetsMake(5.0f, 15.0f, 5.0f, 15.0f);
    [[ZDCFormCellSingleLine appearance] setTextInsets:[NSValue valueWithUIEdgeInsets:insets]];
    [[ZDCFormCellSingleLine appearance] setTextFrameBorderColor:[UIColor colorWithWhite:0.9f alpha:1.0f]];
    [[ZDCFormCellSingleLine appearance] setTextFrameBackgroundColor:[UIColor whiteColor]];
    [[ZDCFormCellSingleLine appearance] setTextFrameCornerRadius:@(3.0f)];
    [[ZDCFormCellSingleLine appearance] setTextFont:[UIFont systemFontOfSize:13.0f]];
    [[ZDCFormCellSingleLine appearance] setTextColor:[UIColor colorWithWhite:0.2f alpha:1.0f]];

    insets = UIEdgeInsetsMake(10.0f, 15.0f, 0.0f, 15.0f);
    [[ZDCFormCellDepartment appearance] setTextFrameInsets:[NSValue valueWithUIEdgeInsets:insets]];
    insets = UIEdgeInsetsMake(5.0f, 15.0f, 5.0f, 15.0f);
    [[ZDCFormCellDepartment appearance] setTextInsets:[NSValue valueWithUIEdgeInsets:insets]];
    [[ZDCFormCellDepartment appearance] setTextFrameBorderColor:[UIColor colorWithWhite:0.9f alpha:1.0f]];
    [[ZDCFormCellDepartment appearance] setTextFrameBackgroundColor:[UIColor whiteColor]];
    [[ZDCFormCellDepartment appearance] setTextFrameCornerRadius:@(3.0f)];
    [[ZDCFormCellDepartment appearance] setTextFont:[UIFont systemFontOfSize:13.0f]];
    [[ZDCFormCellDepartment appearance] setTextColor:[UIColor colorWithWhite:0.2f alpha:1.0f]];

    insets = UIEdgeInsetsMake(10.0f, 15.0f, 10.0f, 15.0f);
    [[ZDCFormCellMessage appearance] setTextFrameInsets:[NSValue valueWithUIEdgeInsets:insets]];
    insets = UIEdgeInsetsMake(5.0f, 10.0f, 5.0f, 10.0f);
    [[ZDCFormCellMessage appearance] setTextInsets:[NSValue valueWithUIEdgeInsets:insets]];
    [[ZDCFormCellMessage appearance] setTextFrameBorderColor:[UIColor colorWithWhite:0.9f alpha:1.0f]];
    [[ZDCFormCellMessage appearance] setTextFrameBackgroundColor:[UIColor whiteColor]];
    [[ZDCFormCellMessage appearance] setTextFrameCornerRadius:@(3.0f)];
    [[ZDCFormCellMessage appearance] setTextFont:[UIFont systemFontOfSize:13.0f]];
    [[ZDCFormCellMessage appearance] setTextColor:[UIColor colorWithWhite:0.2f alpha:1.0f]];

    ////////////////////////////////////////////////////////////////////////////////////////////////
    // Style the chat cells
    ////////////////////////////////////////////////////////////////////////////////////////////////

    insets = UIEdgeInsetsMake(10.0f, 70.0f , 10.0f, 20.0f);
    [[ZDCJoinLeaveCell appearance] setTextInsets:[NSValue valueWithUIEdgeInsets:insets]];
    [[ZDCJoinLeaveCell appearance] setTextColor:[UIColor colorWithWhite:0.26f alpha:1.0f]];
    [[ZDCJoinLeaveCell appearance] setTextFont:[UIFont boldSystemFontOfSize:14]];

    insets = UIEdgeInsetsMake(8.0f, 75.0f , 7.0f, 15.0f);
    [[ZDCVisitorChatCell appearance] setBubbleInsets:[NSValue valueWithUIEdgeInsets:insets]];
    insets = UIEdgeInsetsMake(12.0f, 15.0f, 12.0f, 15.0f);
    [[ZDCVisitorChatCell appearance] setTextInsets:[NSValue valueWithUIEdgeInsets:insets]];
    [[ZDCVisitorChatCell appearance] setBubbleBorderColor:[ZDUUtil darkerColorForColor:[ZDUUtil navBarTintColor] by:0.2f]];
    [[ZDCVisitorChatCell appearance] setBubbleColor:[ZDUUtil navBarTintColor]];
    [[ZDCVisitorChatCell appearance] setBubbleCornerRadius:@(3.0f)];
    [[ZDCVisitorChatCell appearance] setTextAlignment:@(NSTextAlignmentLeft)];
    [[ZDCVisitorChatCell appearance] setTextColor:[ZDUUtil navTintColor]];
    [[ZDCVisitorChatCell appearance] setTextFont:[UIFont systemFontOfSize:14.0f]];
    [[ZDCVisitorChatCell appearance] setUnsentTextColor:[UIColor colorWithWhite:0.26f alpha:1.0f]];
    [[ZDCVisitorChatCell appearance] setUnsentTextFont:[UIFont systemFontOfSize:12.0f]];
    [[ZDCVisitorChatCell appearance] setUnsentMessageTopMargin:@(5.0f)];
    [[ZDCVisitorChatCell appearance] setUnsentIconLeftMargin:@(10.0f)];

    insets = UIEdgeInsetsMake(8.0f, 55.0f, 7.0f, 30.0f);
    [[ZDCAgentChatCell appearance] setBubbleInsets:[NSValue valueWithUIEdgeInsets:insets]];
    insets = UIEdgeInsetsMake(12.0f, 15.0f, 12.0f, 15.0f);
    [[ZDCAgentChatCell appearance] setTextInsets:[NSValue valueWithUIEdgeInsets:insets]];
    [[ZDCAgentChatCell appearance] setBubbleBorderColor:[UIColor colorWithWhite:0.90f alpha:1.0f]];
    [[ZDCAgentChatCell appearance] setBubbleColor:[UIColor colorWithWhite:0.95f alpha:1.0f]];
    [[ZDCAgentChatCell appearance] setBubbleCornerRadius:@(3.0f)];
    [[ZDCAgentChatCell appearance] setTextAlignment:@(NSTextAlignmentLeft)];
    [[ZDCAgentChatCell appearance] setTextColor:[UIColor colorWithWhite:0.26f alpha:1.0f]];
    [[ZDCAgentChatCell appearance] setTextFont:[UIFont systemFontOfSize:14.0f]];
    [[ZDCAgentChatCell appearance] setAvatarHeight:@(30.0f)];
    [[ZDCAgentChatCell appearance] setAvatarLeftInset:@(14.0f)];
    [[ZDCAgentChatCell appearance] setAuthorColor:[UIColor colorWithWhite:0.60f alpha:1.0f]];
    [[ZDCAgentChatCell appearance] setAuthorFont:[UIFont systemFontOfSize:12]];
    [[ZDCAgentChatCell appearance] setAuthorHeight:@(25.0f)];

    insets = UIEdgeInsetsMake(10.0f, 20.0f, 10.0f, 20.0f);
    [[ZDCSystemTriggerCell appearance] setTextInsets:[NSValue valueWithUIEdgeInsets:insets]];
    [[ZDCSystemTriggerCell appearance] setTextColor:[UIColor colorWithWhite:0.26f alpha:1.0f]];
    [[ZDCSystemTriggerCell appearance] setTextFont:[UIFont boldSystemFontOfSize:14.0f]];

    insets = UIEdgeInsetsMake(10.0f, 20.0f, 10.0f, 20.0f);
    [[ZDCChatTimedOutCell appearance] setTextInsets:[NSValue valueWithUIEdgeInsets:insets]];
    [[ZDCChatTimedOutCell appearance] setTextColor:[UIColor colorWithWhite:0.26f alpha:1.0f]];
    [[ZDCChatTimedOutCell appearance] setTextFont:[UIFont boldSystemFontOfSize:14.0f]];

    [[ZDCRatingCell appearance] setTitleColor:[UIColor colorWithWhite:0.26f alpha:1.0f]];
    [[ZDCRatingCell appearance] setTitleFont:[UIFont boldSystemFontOfSize:14]];
    [[ZDCRatingCell appearance] setCellToTitleMargin:@(20.0f)];
    [[ZDCRatingCell appearance] setTitleToButtonsMargin:@(10.0f)];
    [[ZDCRatingCell appearance] setRatingButtonToCommentMargin:@(20.0f)];
    [[ZDCRatingCell appearance] setEditCommentButtonHeight:@(44.0f)];
    [[ZDCRatingCell appearance] setRatingButtonSize:@(40.0f)];

    [[ZDCAgentAttachmentCell appearance] setActivityIndicatorViewStyle:@(UIActivityIndicatorViewStyleGray)];

    [[ZDCVisitorAttachmentCell appearance] setActivityIndicatorViewStyle:@(UIActivityIndicatorViewStyleGray)];


    ////////////////////////////////////////////////////////////////////////////////////////////////
    // Style the chat text entry area
    ////////////////////////////////////////////////////////////////////////////////////////////////

    [[ZDCTextEntryView appearance] setSendButtonImage:nil];
    [[ZDCTextEntryView appearance] setTopBorderColor:[UIColor colorWithWhite:0.831f alpha:1.0f]];
    [[ZDCTextEntryView appearance] setTextEntryFont:[UIFont systemFontOfSize:14.0f]];
    [[ZDCTextEntryView appearance] setTextEntryColor:[UIColor colorWithWhite:0.4f alpha:1.0f]];
    [[ZDCTextEntryView appearance] setTextEntryBackgroundColor:[UIColor colorWithWhite:0.945f alpha:1.0f]];
    [[ZDCTextEntryView appearance] setTextEntryBorderColor:[UIColor colorWithWhite:0.831f alpha:1.0f]];
    [[ZDCTextEntryView appearance] setAreaBackgroundColor:[UIColor whiteColor]];

    ////////////////////////////////////////////////////////////////////////////////////////////////
    // Style the chat UI background colors
    ////////////////////////////////////////////////////////////////////////////////////////////////

    // set all view backgrounds transparent
    //[[ZDCPreChatFormView appearance] setFormBackgroundColor:[UIColor clearColor]];
    //[[ZDCOfflineMessageView appearance] setFormBackgroundColor:[UIColor clearColor]];
    //[[ZDCChatView appearance] setChatBackgroundColor:[UIColor clearColor]];
    //[[ZDCLoadingView appearance] setLoadingBackgroundColor:[UIColor clearColor]];
    //[[ZDCLoadingErrorView appearance] setErrorBackgroundColor:[UIColor clearColor]];

    // Set the base view background color
    //[[ZDCChatUI appearance] setChatBackgroundColor:[UIColor colorWithWhite:0.96f alpha:1.0f]];

    ////////////////////////////////////////////////////////////////////////////////////////////////
    // Custom chat background (static image)
    ////////////////////////////////////////////////////////////////////////////////////////////////

    // set the base view background image name and anchor
    //[[ZDCChatUI appearance] setChatBackgroundImage:@"SampleBackground"];
    //[[ZDCChatUI appearance] setChatBackgroundAnchor:@(ZDCChatBackgroundAnchorCenter)];

    ////////////////////////////////////////////////////////////////////////////////////////////////
    // UI notifications
    ////////////////////////////////////////////////////////////////////////////////////////////////

    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(chatLoaded:) name:ZDC_CHAT_UI_DID_LOAD object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(chatLayout:) name:ZDC_CHAT_UI_DID_LAYOUT object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(chatUnloaded:) name:ZDC_CHAT_UI_WILL_UNLOAD object:nil];
}


+ (void) chatLoaded:(NSNotification*)notification
{
    ////////////////////////////////////////////////////////////////////////////////////////////////
    // Set a custom chat background (runtime image)
    ////////////////////////////////////////////////////////////////////////////////////////////////

    // Those attributes controllable by UIAppearance should still be controlled via the standard appearance
    // invocations. For a chat-wide background image to work you will need to also uncomment the background
    // color apperance settings above

    //ZDCChatUI *chatUI = notification.object;

    //chatUI.chatBackgroundAnchor = @(ZDCChatBackgroundAnchorTop);
    //chatUI.backgroundImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"SampleBackground"]];
}


+ (void) chatLayout:(NSNotification*)notification
{
    ////////////////////////////////////////////////////////////////////////////////////////////////
    // Customise the layout of any part of the chat UI here, this notification is received after
    // the standard/appearance configured layout has been applied
    ////////////////////////////////////////////////////////////////////////////////////////////////

    //ZDCChatUI *chatUI = notification.object;
    //chatUI.loadingView...
    //chatUI.formView...
    //chatUI.chatView...
}


+ (void) chatUnloaded:(NSNotification*)notification
{
    // The Chat UI has been dismissed
}


@end

