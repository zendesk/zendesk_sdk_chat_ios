/*
 *
 *  ZDCChatSession.h
 *  ZDCChat
 *
 *  Created by Zendesk on 20/09/2014.
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
#import "ZDCChatDataNode.h"
#import "ZDCChatProfile.h"
#import "ZDCChatIO.h"
#import "ZDCPreChatData.h"
#import "ZDCReachability.h"
#import "ZDCSessionStateManager.h"
#import "ZDCConfig.h"
#import "ZDCSessionConfig.h"
#import "ZDCVisitorInfo.h"


@protocol ZDCChatSession <ZDCWebIODelegate>


/**
 * Session default config;
 */
- (ZDCConfig*) config;

/**
 * Visitor info;
 */
- (ZDCVisitorInfo*) visitorInfo;

/**
 * Stores the chat data.
 */
- (id<ZDCChatDataSource>) dataSource;

/**
 * Reachbility instance used by chat.
 */
- (ZDCReachability*) reachable;

/**
 * Get the current session status.
 * @param status the current session status
 */
- (ZDCChatSessionStatus) status;

/**
 * Set the session timeout which is the amount of time after the last visitor message before the 
 * session is ended due to inactivity.
 * @param timeout the timeout in seconds
 */
- (void) setTimeout:(NSTimeInterval)timeout;

/**
 * The difference between the device clock and the server clock for the active chat session.
 * Add this to any event timestamp to obtain a time that can be compared to device time.
 */
- (NSTimeInterval) clockSkew;

/**
 * Get a new config to be used when starting a chat with session specific config.
 * @return a new initialised config for use when starting a chat.
 */
- (ZDCSessionConfig*) newSessionConfig;


#pragma mark connection


/**
 * Connect the chat session.
 */
- (void) connect;

/**
 * Connect the chat session.
 * @param config the session specific config to be used, leave nil to use defaults
 */
- (void) connectWithConfig:(ZDCSessionConfig*)config;

/**
 * Get the current connection status.
 * @return current connection status
 */
- (ZDCConnectionStatus) connectionStatus;

/**
 * Resume the persisted chat if one exists.
 * @return YES if a chat was resumed
 */
- (BOOL) resumeChat;

/**
 * Send the end chat message to the server and then disconnect this session.
 */
- (void) endChat;


#pragma mark pre-chat form


/**
 * Get the active session config.
 */
- (ZDCSessionConfig*) activeSessionConfig;

/**
 * Use the global (or session if set) pre-chat form settings and the visitor data
 * to decide whether the pre-chat form should be shown.
 * @return YES if the pre-chat form is required
 */
- (BOOL) shouldShowPreChatForm;


#pragma mark messages


/**
 * Send a chat message from this visitor to the server
 * @param msg the chat message
 */
- (void) sendChatMessage:(NSString*)msg;


/**
 * Resent the provided chat message.
 * @param the chat event to be resent
 */
- (void) resendChatMessage:(ZDCChatEvent*)event;

/**
 * Request an email of the transcript.
 * @param email
 */
- (void) emailTranscript:(NSString*)email;

/**
 * Send an offline message.
 * @param the message to be sent.
 */
- (void) sendOfflineMessage:(NSString*)msg;


#pragma mark event observers


/**
 * Listen for timeout
 * @param target the listener to add
 * @param selector the selector to be invoked on the target
 */
- (void) addObserver:(id)target forTimeoutEvents:(SEL)selector;

/**
 * Remove timeout observers for the target.
 * @param target the listener to remove
 */
- (void) removeObserverForTimeoutEvents:(id)target;

/**
 * Listen for connection events.
 * @param target the listener to add
 * @param selector the selector to be invoked on the target
 */
- (void) addObserver:(id)target forConnectionEvents:(SEL)selector;

/**
 * Remove connection observers for the target.
 * @param target the listener to remove
 */
- (void) removeObserverForConnectionEvents:(id)target;


@end


#pragma mark -


@interface ZDCStandardChatSession : NSObject <ZDCChatSession>


@end

