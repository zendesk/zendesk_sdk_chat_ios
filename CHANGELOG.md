# Version 1.3.3.1
- Fixing bug to allow special characters to be sent.

# Version 1.3.2.1
- Fixing a lag issue that happens when writing the chat message on some devices
- Adding `addNote` method to `ZDCVisitorInfo` 
- Adding `setNote` and `appendNote` to `ZDCChatAPI` 

# Version 1.3.1.1
- Fixing issues occurring on iOS 10 
- Fixing an issue that causes the chat view controller to pop the active controller twice

# Version 1.3.0.2
Fixing an issue with library not containing bitcode support for some slices.

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
