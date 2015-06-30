/*
 *
 *  ZDCChatConstants.h
 *  ZDCChat
 *
 *  Created by Zendesk on 26/11/2014.
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
#import "ZDCLog.h"


#define ZDC_SDK_VERSION @"1.0"


extern CGFloat const ZDC_TOAST_DURATION;
extern CGFloat const ZDC_TOAST_ANIMATION_TIME;

#pragma mark notifications


/// Notification that the chat UI was loaded, the sending object of the notification is the ZDCChatUI instance.
extern NSString * const ZDC_CHAT_UI_DID_LOAD;

/// Notification that the chat UI performed layout, the sending object of the notification is the ZDCChatUI instance.
extern NSString * const ZDC_CHAT_UI_DID_LAYOUT;

/// Notification of a status change for a file upload.
extern NSString * const ZDC_NOTIFICATION_FILE_UPLOAD;


#pragma mark mime types


extern NSString * const ZDC_MIME_TYPE_JPEG;

extern NSString * const ZDC_MIME_TYPE_PNG;

extern NSString * const ZDC_MIME_TYPE_PDF;

extern NSString * const ZDC_MIME_TYPE_TXT;


#pragma mark -


@interface ZDCChatConstants : NSObject @end

