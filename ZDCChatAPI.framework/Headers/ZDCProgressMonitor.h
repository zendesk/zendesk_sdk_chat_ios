/*
 *
 *  ZDCProgressMonitor.h
 *  ZDCChat
 *
 *  Created by Zendesk on 2/06/2016.
 *
 *  Copyright (c) 2016 Zendesk. All rights reserved.
 *
 *  By downloading or using the Zopim Chat SDK, You agree to the Zendesk Terms
 *  of Service https://www.zendesk.com/company/terms and Application Developer and API License
 *  Agreement https://www.zendesk.com/company/application-developer-and-api-license-agreement and
 *  acknowledge that such terms govern Your use of and access to the Chat SDK.
 *
 */

/**
 * Progress monitoring protocol for downloda/uploads.
 */
@protocol ZDCProgressMonitor <NSObject>


@optional
/**
 * Sets the current progress of a download/upload.
 * @param progress the current progress
 */
- (void) setProgress:(float)progress;


@end
