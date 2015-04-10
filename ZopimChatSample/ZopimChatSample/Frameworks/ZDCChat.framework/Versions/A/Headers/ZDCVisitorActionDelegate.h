/*
 *
 *  ZDCChatUIController.h
 *  ZDCChat
 *
 *  Created by Zendesk on 29/10/2014.
 *
 *  Copyright (c) 2015 Zendesk. All rights reserved.
 *
 *  By downloading or using the Zopim Chat SDK, You agree to the Zendesk Terms
 *  of Service https://www.zendesk.com/company/terms and Application Developer and API License
 *  Agreement https://www.zendesk.com/company/application-developer-and-api-license-agreement and
 *  acknowledge that such terms govern Your use of and access to the Chat SDK.
 *
 */


#import <Foundation/Foundation.h>


/**
 * Protocol for handling visitor actions on the individual chat UI sections.
 */
@protocol ZDCVisitorActionDelegate <NSObject>


/**
 * Visitor has triggered submission of the pre-chat form.
 */
- (void) submitForm;

/**
 * Visitor has triggered sending of the current typed message.
 */
- (void) sendMessage;


@end

