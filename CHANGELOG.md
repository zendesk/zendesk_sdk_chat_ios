# Version 1.4.4
- Fixed some bugs that were causing keyboard layout issues on iOS 13.
- Fixed an issue where the department would not be correctly set on chats after a previous timeout.
- Fixed an issue that could stop users from leaving an offline message.

# Version 1.4.3
- Bug fixes.
- You can now control the way the chat window gets displayed by setting `chatModalPresentationStyle`.

# Version 1.4.2
- Fixed some iOS 13 issues.

# Version 1.4.1
- Improved support for agent availability monitoring in the chat window. You can now enable a feature that will provide a more accurate real time reflection of agent availability. You can enable this feature by calling `enableAgentAvailabilityObserving` on `ZDCChat` and passing `true`/`YES`. We suggest disabling the overlay as this can improve the reliability of this feature (see [here](https://developer.zendesk.com/embeddables/docs/ios-chat-sdk/customization#hiding-the-chat-overlay)).
- Provided a workaround for some triggers not firing when setting the department. If this issue is being experienced, you can call `updateDepartment` once the chat session is connected and pass the department.
- Safer handling of notifications to reduce crashes experienced by some users.
- Added a way to disable or set a timeout for the connection status banner messages if they aren't needed or are causing a problem. This can be achieved by setting `showsConnectionBar` or `connectionBarAutoCloseDuration` on `ZDCChat`.

# Version 1.4.0
- Added Push Notification support.

# Version 1.3.7.1
- Fixing iPhone X issues.

# Version 1.3.6.1
- An update to improve the security of the client's connection to Chat. We recommend that all customers upgrade to this version.

# Version 1.3.5.1
- Fixing bug that would not show departments and not start the chat if agent's status is ‘Away’.

# Version 1.3.4.1
- Fixing bug that would allow the chat to start when the departments are offline.

# Version 1.3.3.1
- Fixing bug to allow special characters to be sent.

# Version 1.3.2.1
- Fixing a lag issue that happens when writing the chat message on some devices.
- Adding `addNote` method to `ZDCVisitorInfo`.
- Adding `setNote` and `appendNote` to `ZDCChatAPI`.

# Version 1.3.1.1
- Fixing issues occurring on iOS 10.
- Fixing an issue that causes the chat view controller to pop the active controller twice.

# Version 1.3.0.2
- Fixing an issue with library not containing bitcode support for some slices.

# Version 1.3.0.1

## ZDCChat

### Removed:
- ZDUActivityView.h
- ZDCAgentOptionsCell.h
- ZDKBundleUtils.h
- ZDCChatConstants.h
- ZDCChatDataNode.h
- ZDCChatDataSource.h
- ZDChatIO.h
- ZDCChatSession.h
- ZDCDeviceInfo.h
- ZDCEmailTranscriptAction.h
- ZDCEvents.h
- ZDCHttpRequest.h
- ZDCHttpUploadRequest.h
- ZDCImageViewer.h
- ZDCJSONEncoder.h
- ZDCJSWidgetIO.h
- KeychainItemWrapper.h
- ZDCMessageMonitor.h
- ZDCMobileProvisionAnalyzer.h
- ZDCRatingCommentEditor.h
- ZDCReachability.h
- ZDCSessionConfig.h
- ZDCSessionStateManager.h
- ZDCChatUIController.h
- ZDCWebViewer.h
- ZDUActivityViewDelegate.h
- ZDUImageLoader.h
- ZDUTextView.h
- ZDUToastStyle.h
- ZDUToastView.h
- ZDUUtil.h

### Items Moved from ZDCChat to ZDCChatAPI:
- ZDCChatAgent.h
- ZDCChatAttachment.h
- ZDCChatEvent.h
- ZDCChatFile.h
- ZDCChatProfile.h
- ZDCFileUpload.h
- ZDCLog.h
- ZDCVisitorInfo.h

### Updated:
##### ZDCChat.h
Added:
```
@property (nonatomic, strong) ZDCChatAPI *api;

@property (nonatomic, assign, readonly) NSInteger unreadMessagesCount;
```

Removed:
```objc
@property (nonatomic, strong) id<ZDCChatSession> session;

+ (void) configure:(ZDCChatConfigBlock)config;
```

Moved to `ZDCConfig.h`:
```objc
@property (nonatomic, assign) NSTimeInterval reconnectionTimeout;

@property (nonatomic, assign) NSTimeInterval connectionTimeout;

+ (void)initializeWithAccountKey:(NSString*)accountKey;
```

##### ZDChatCell.h

Removed:
```objc
@property (nonatomic, strong) ZDUImageLoader *imageLoader;
```

##### ZDCConfig.h

Added:

```objc
@property (nonatomic, assign) BOOL uploadAttachmentsEnabled;

@property (nonatomic, assign) NSTimeInterval connectionTimeout;

@property (nonatomic, assign) NSTimeInterval reconnectionTimeout;
```

Removed:
```objc
@property (nonatomic, strong) NSString *accountKey;
```

##### ZDCOfflineMessageHandler.h

Removed:
```objc
@property (nonatomic, copy) ZDCOfflineMessageAction action;
```

##### ZDCRatingCell.h

Added:
```objc
@property (nonatomic, strong) UIColor *leaveCommentTitleColor UI_APPEARANCE_SELECTOR;
```

##### ZDUViewController.h

Removed:
```objc
@property (nonatomic, strong) ZDUToastView *toastView;

- (void) presentPersistentToast:(NSString*)message
                           type:(ZDUToastUIType)type
                        animate:(BOOL)animate
```

## ZDCChatAPI

### Added
- ZDUImageRequestDelegate.h
- ZDCAPIConfig.h
- ZDCChatAPI.h
- ZDCChatAPIEnums.h
- ZDCProgressMonitor.h


## ZDCChat.podspec
Added UI/API split
