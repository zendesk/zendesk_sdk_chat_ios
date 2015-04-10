/*
 *
 *  ZDChatCell.h
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
#import "ZDCChatEvent.h"
#import "ZDCChatAgent.h"
#import "ZDUImageLoader.h"


extern CGFloat const ZDC_CHAT_BUBBLE_LEAD_MESSAGE_MARGIN;
extern CGFloat const ZDC_CHAT_BUBBLE_TOP_MARGIN;
extern CGFloat const ZDC_CHAT_BUBBLE_BOTTOM_MARGIN;
extern CGFloat const ZDC_CHAT_BUBBLE_TOP_PADDING;
extern CGFloat const ZDC_CHAT_BUBBLE_BOTTOM_PADDING;
extern CGFloat const ZDC_CHAT_BUBBLE_LEFT_MARGIN;
extern CGFloat const ZDC_CHAT_BUBBLE_LEFT_MARGIN_AGENT;
extern CGFloat const ZDC_CHAT_BUBBLE_RIGHT_MARGIN;
extern CGFloat const ZDC_CHAT_BUBBLE_LEFT_PADDING;
extern CGFloat const ZDC_CHAT_BUBBLE_RIGHT_PADDING;
extern CGFloat const ZDC_CHAT_BUBBLE_AUTHOR_HEIGHT;
extern CGFloat const ZDC_CHAT_BUBBLE_CORNER_RADIUS;
extern CGFloat const ZDC_TYPING_CELL_HEIGHT;
extern CGFloat const ZDC_TYPING_CELL_HEIGHT_WITH_AVATAR;
extern CGFloat const ZDC_AVATAR_LEFT_INSET;
extern CGFloat const ZDC_AVATAR_TOP_INSET;
extern CGFloat const ZDC_AVATAR_HEIGHT;



/**
 * Abstract chat cell defining common methods.
 */
@interface ZDCChatCell : UITableViewCell


/**
 * The chat event being presented by this cell.
 */
@property (nonatomic, strong) ZDCChatEvent *event;

/**
 * The table image loader for avatars.
 */
@property (nonatomic, strong) ZDUImageLoader *imageLoader;


/**
 * Update the cell with the event provided.
 * @param event the event to be presented
 */
- (void) prepareWithEvent:(ZDCChatEvent*)event;

/**
 * Notify the cell of an update to the agent record.
 * @param agent the updated agent info
 */
- (void) agentUpdate:(ZDCChatAgent*)agent;

/**
 * Get the cell height.
 * @param event the chat event being displayed by thie cell
 * @param width the table/cell width
 * @return the calculated height, if not overridden this method defaults to 44
 */
- (CGFloat) heightForEvent:(ZDCChatEvent*)event givenWidth:(CGFloat)width;

/**
 * Get the appearance value for a given selector, returning the default if not set.
 * @param sel the appearance selector to be used
 * @param defaultVal the default value returned if the appearance has not been set
 * @return the apperance value if set, else the default value
 */
- (id) appearance:(SEL)sel def:(id)defaultVal;

/**
 * Set the appearance properties with either specified values or defaults.
 */
- (void) setupAppearance;


@end

