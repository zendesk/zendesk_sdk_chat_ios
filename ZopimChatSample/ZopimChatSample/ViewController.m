/*
 *
 *  ViewController.m
 *  ZDCChat
 *
 *  Created by Zendesk on 27/10/2014.
 *
 *  Copyright (c) 2016 Zendesk. All rights reserved.
 *
 *  By downloading or using the Zendesk Mobile SDK, You agree to the Zendesk Master
 *  Subscription Agreement https://www.zendesk.com/company/customers-partners/#master-subscription-agreement and Application Developer and API License
 *  Agreement https://www.zendesk.com/company/customers-partners/#application-developer-api-license-agreement and
 *  acknowledge that such terms govern Your use of and access to the Mobile SDK.
 *
 */


#import "ViewController.h"


static const float ZDC_BUTTON_MARGIN = 30.0f;
static const float ZDC_BUTTON_HEIGHT = 44.0f;
static const float ZDC_BUTTON_SPACING = 54.0f;
static const float ZDC_BUTTON_CORNER_RADIUS = 4.0f;
static const float ZDC_BUTTON_BORDER_WIDTH = 1.0f;
static const float ZDC_CONTENT_HEIGHT = 410.0f;


#define ZDC_VC_BTN_BACKGROUND [UIColor colorWithWhite:0.95f alpha:1.0f]
#define ZDC_BTN_TITLE_NORMAL [UIColor colorWithWhite:0.2627f alpha:1.0f]
#define ZDC_BTN_TITLE_HIGHLIGHT [UIColor colorWithWhite:0.2627f alpha:0.3f]
#define ZDC_BTN_BORDER [UIColor colorWithWhite:0.8470f alpha:1.0f]

// If set to YES, all chats will be started in a modal, set to NO and they'll all be pushed on to the UINavigationController.
static const BOOL useModal = NO;
static UIModalPresentationStyle chatModalPresentationStyle = UIModalPresentationFullScreen;
static ZDCEmailTranscriptAction emailTranscriptAction = ZDCEmailTranscriptActionPrompt;

@interface ViewController ()

@property (nonatomic, strong) UISwitch *enableAgentAvailabilityObservingSwitch;
@property (nonatomic, strong) NSString *department;

@end

@implementation ViewController

- (void) viewDidLoad
{
    [super viewDidLoad];
    
    // Set the name of the department.
    self.department = @"";
    
    //////////////////////////////////////////////
    // sample app boilerplate
    //////////////////////////////////////////////
    
    self.title = @"Chat SDK Sample";
    self.view.backgroundColor = [UIColor colorWithWhite:0.94f alpha:1.0f];
    
    _scrollView = [[UIScrollView alloc] initWithFrame:self.view.frame];
    _scrollView.autoresizingMask = (UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight);
    [self.contentView addSubview:_scrollView];
    
    CGRect buttonFrame = CGRectMake(ZDC_BUTTON_MARGIN, ZDC_BUTTON_MARGIN,
                                    floorf(self.view.frame.size.width - 2 * ZDC_BUTTON_MARGIN), ZDC_BUTTON_HEIGHT);
    UIButton *button = [self buildButtonWithFrame:buttonFrame andTitle:@"Chat (all fields optional)"];
    button.accessibilityIdentifier = @"ModalChatAllFieldsOptional";
    [button addTarget:self action:@selector(allPreChatFieldsOptional) forControlEvents:(UIControlEventTouchUpInside)];
    [_scrollView addSubview:button];
    
    buttonFrame = CGRectMake(ZDC_BUTTON_MARGIN, floorf(buttonFrame.origin.y + ZDC_BUTTON_SPACING),
                             floorf(self.view.frame.size.width - 2 * ZDC_BUTTON_MARGIN), ZDC_BUTTON_HEIGHT);
    button = [self buildButtonWithFrame:buttonFrame andTitle:@"Chat (all fields required)"];
    button.accessibilityIdentifier = @"PushedChatAllFieldsRequired";
    [button addTarget:self action:@selector(allPreChatFieldsRequired) forControlEvents:(UIControlEventTouchUpInside)];
    [_scrollView addSubview:button];
    
    buttonFrame = CGRectMake(ZDC_BUTTON_MARGIN, floorf(buttonFrame.origin.y + ZDC_BUTTON_SPACING),
                             floorf(self.view.frame.size.width - 2 * ZDC_BUTTON_MARGIN), ZDC_BUTTON_HEIGHT);
    button = [self buildButtonWithFrame:buttonFrame andTitle:@"Chat (no pre-chat form) no connection bar"];
    button.accessibilityIdentifier = @"PushedChatNoPreChatForm";
    [button addTarget:self action:@selector(noPreChatForm) forControlEvents:(UIControlEventTouchUpInside)];
    [_scrollView addSubview:button];
    
    buttonFrame = CGRectMake(ZDC_BUTTON_MARGIN, floorf(buttonFrame.origin.y + ZDC_BUTTON_SPACING),
                             floorf(self.view.frame.size.width - 2 * ZDC_BUTTON_MARGIN), ZDC_BUTTON_HEIGHT);
    button = [self buildButtonWithFrame:buttonFrame andTitle:@"Chat (pre-set data) connection bar(1 second)"];
    button.accessibilityIdentifier = @"PushedChatPreSetData";
    [button addTarget:self action:@selector(presetData) forControlEvents:(UIControlEventTouchUpInside)];
    [_scrollView addSubview:button];
    
    buttonFrame = CGRectMake(ZDC_BUTTON_MARGIN, floorf(buttonFrame.origin.y + ZDC_BUTTON_SPACING),
                             floorf(self.view.frame.size.width - 2 * ZDC_BUTTON_MARGIN), ZDC_BUTTON_HEIGHT);
    button = [self buildButtonWithFrame:buttonFrame andTitle:@"Chat (pre-set data) connection bar + user"];
    button.accessibilityIdentifier = @"PushedChatPreSetDataTwo";
    [button addTarget:self action:@selector(presetDataTwo) forControlEvents:(UIControlEventTouchUpInside)];
    [_scrollView addSubview:button];

    
    // End chat
    buttonFrame = CGRectMake(ZDC_BUTTON_MARGIN, floorf(buttonFrame.origin.y + ZDC_BUTTON_SPACING),
                             floorf(self.view.frame.size.width - 2 * ZDC_BUTTON_MARGIN), ZDC_BUTTON_HEIGHT);
    button = [self buildButtonWithFrame:buttonFrame andTitle:@"End current chat"];
    button.accessibilityIdentifier = @"End current chat";
    [button addTarget:self action:@selector(endChat) forControlEvents:(UIControlEventTouchUpInside)];
    [_scrollView addSubview:button];
    
    buttonFrame = CGRectMake(ZDC_BUTTON_MARGIN, floorf(buttonFrame.origin.y + ZDC_BUTTON_SPACING),
                             floorf(self.view.frame.size.width - 2 * ZDC_BUTTON_MARGIN), ZDC_BUTTON_HEIGHT);
    button = [self buildButtonWithFrame:buttonFrame andTitle:@"Open modal view controller"];
    button.accessibilityIdentifier = @"PushModalViewController";
    button.backgroundColor = ZDC_VC_BTN_BACKGROUND;
    [button addTarget:self action:@selector(openModalViewController) forControlEvents:(UIControlEventTouchUpInside)];
    [_scrollView addSubview:button];
    
    buttonFrame = CGRectMake(ZDC_BUTTON_MARGIN, floorf(buttonFrame.origin.y + ZDC_BUTTON_SPACING),
                             floorf(self.view.frame.size.width - 2 * ZDC_BUTTON_MARGIN), ZDC_BUTTON_HEIGHT);
    button = [self buildButtonWithFrame:buttonFrame andTitle:@"Push view controller"];
    button.accessibilityIdentifier = @"PushViewController";
    button.backgroundColor = ZDC_VC_BTN_BACKGROUND;
    [button addTarget:self action:@selector(pushViewController) forControlEvents:(UIControlEventTouchUpInside)];
    [_scrollView addSubview:button];
    
    buttonFrame = CGRectMake(ZDC_BUTTON_MARGIN, floorf(buttonFrame.origin.y + ZDC_BUTTON_SPACING),
                             floorf(self.view.frame.size.width - 2 * ZDC_BUTTON_MARGIN), ZDC_BUTTON_HEIGHT);
    button = [self buildButtonWithFrame:buttonFrame andTitle:@"Override account key"];
    button.accessibilityIdentifier = @"UpdateAccountKey";
    button.backgroundColor = ZDC_VC_BTN_BACKGROUND;
    [button addTarget:self action:@selector(updateAccountKey) forControlEvents:(UIControlEventTouchUpInside)];
    [_scrollView addSubview:button];
    
    CGRect switchFrame = CGRectMake(ZDC_BUTTON_MARGIN, floorf(buttonFrame.origin.y + ZDC_BUTTON_SPACING),
                                    floorf(self.view.frame.size.width - 2 * ZDC_BUTTON_MARGIN), ZDC_BUTTON_HEIGHT);
    _enableAgentAvailabilityObservingSwitch = [[UISwitch alloc] initWithFrame:switchFrame];
    _enableAgentAvailabilityObservingSwitch.on = YES;
    [_scrollView addSubview:_enableAgentAvailabilityObservingSwitch];
    CGRect switchLabelFrame = CGRectMake(_enableAgentAvailabilityObservingSwitch.frame.origin.x + _enableAgentAvailabilityObservingSwitch.frame.size.width + 15,
                                         _enableAgentAvailabilityObservingSwitch.frame.origin.y + 7,
                                         250,
                                         15);
    UILabel *switchLabel = [self buildLabelWithFrame:switchLabelFrame andText:@"enableAgentAvailabilityObserving"];
    [_scrollView addSubview:switchLabel];
    
    UILabel *label;
    CGRect labelFrame;
    
    labelFrame = CGRectMake(ZDC_BUTTON_MARGIN, floorf(switchFrame.origin.y + ZDC_BUTTON_SPACING),
                            floorf(self.view.frame.size.width - 2 * ZDC_BUTTON_MARGIN), ZDC_BUTTON_HEIGHT);
    label = [self buildLabelWithFrame:labelFrame andText:[NSString stringWithFormat:@"ZDCChat %@", ZDC_CHAT_SDK_VERSION]];
    [_scrollView addSubview:label];
    
    labelFrame = CGRectMake(ZDC_BUTTON_MARGIN, floorf(labelFrame.origin.y + 25),
                            floorf(self.view.frame.size.width - 2 * ZDC_BUTTON_MARGIN), ZDC_BUTTON_HEIGHT);
    label = [self buildLabelWithFrame:labelFrame andText:[NSString stringWithFormat:@"ZDCChatAPI %@", ZDC_CHAT_API_SDK_VERSION]];
    [_scrollView addSubview:label];
}

- (void) viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    _scrollView.contentSize = CGSizeMake(self.contentView.frame.size.width, ZDC_CONTENT_HEIGHT);
    _scrollView.contentInset = UIEdgeInsetsMake([self topViewOffset], 0.0f, [self bottomViewOffset], 0.0f);
}

- (BOOL) agentAvailabilityObservingEnabled {
    return [[self enableAgentAvailabilityObservingSwitch] isOn];
}

// This is required to fix MSDK-4046
- (void)connectionEvent {
    if ([[ZDCChatAPI instance] connectionStatus] == ZDCConnectionStatusConnected) {
        if (self.department != nil) {
            [[ZDCChatAPI instance] updateDepartment:self.department];
        }
        [[ZDCChatAPI instance] removeObserverForConnectionEvents:self];
    }
}

- (void) endChat {
    [ZDCChat endChat];
}

- (void)observeConnectionEvents
{
    [[ZDCChatAPI instance] addObserver:self forConnectionEvents:@selector(connectionEvent)];
}

- (void)startChat:(ZDCConfigBlock)config {
    [[ZDCChat instance] setChatModalPresentationStyle: chatModalPresentationStyle];
    
    if (useModal) {
        [ZDCChat startChat:config];
    } else {
        [ZDCChat startChatIn:self.navigationController withConfig:config];
    }
}

- (void) allPreChatFieldsOptional
{
    [[ZDCChat instance] enableAgentAvailabilityObserving: [self agentAvailabilityObservingEnabled]];
    
    [[ZDCChat instance].api trackEvent:@"Chat button pressed: (all fields optional)"];

    [self startChat:^(ZDCConfig *config) {
        config.preChatDataRequirements.name = ZDCPreChatDataOptionalEditable;
        config.preChatDataRequirements.email = ZDCPreChatDataOptionalEditable;
        config.preChatDataRequirements.phone = ZDCPreChatDataOptionalEditable;
        config.preChatDataRequirements.department = ZDCPreChatDataOptionalEditable;
        config.preChatDataRequirements.message = ZDCPreChatDataOptionalEditable;
        config.emailTranscriptAction = emailTranscriptAction;
        // This is required to fix MSDK-4046
        [self observeConnectionEvents];
    }];
}

- (void) allPreChatFieldsRequired
{
    [[ZDCChat instance] enableAgentAvailabilityObserving: [self agentAvailabilityObservingEnabled]];
    
    [[ZDCChat instance].api trackEvent:@"Chat button pressed: (all fields required)"];

    [self startChat:^(ZDCConfig *config) {
        config.preChatDataRequirements.name = ZDCPreChatDataRequiredEditable;
        config.preChatDataRequirements.email = ZDCPreChatDataRequiredEditable;
        config.preChatDataRequirements.phone = ZDCPreChatDataRequiredEditable;
        config.preChatDataRequirements.department = ZDCPreChatDataRequiredEditable;
        config.preChatDataRequirements.message = ZDCPreChatDataRequired;
        config.emailTranscriptAction = emailTranscriptAction;
        // This is required to fix MSDK-4046
        [self observeConnectionEvents];
    }];
}

- (void) noPreChatForm
{
    [[ZDCChat instance] enableAgentAvailabilityObserving: [self agentAvailabilityObservingEnabled]];
    
    [[ZDCChat instance].api trackEvent:@"Chat button pressed: (no pre-chat form) - doesnt show connection bar"];
  
    [self startChat:^(ZDCConfig *config) {
        config.showsConnectionBar = NO;
        config.emailTranscriptAction = emailTranscriptAction;
        // This is required to fix MSDK-4046
        [self observeConnectionEvents];
    }];
}

- (void) presetData
{
    [[ZDCChat instance] enableAgentAvailabilityObserving: [self agentAvailabilityObservingEnabled]];
    
    [[ZDCChat instance].api trackEvent:@"Chat button pressed: (pre-set data) - shows connection bar for 1 second"];

    // Before starting the chat set the visitor data
    [ZDCChat updateVisitor:^(ZDCVisitorInfo *visitor) {
        visitor.phone = [NSString stringWithFormat:@"%lu", (long)[[NSDate date] timeIntervalSince1970]];
        visitor.name = [NSString stringWithFormat:@"Preconfig %lu", (long)[[NSDate date] timeIntervalSince1970]];
        visitor.email = [NSString stringWithFormat:@"chattest+%lu@test.com", (long)[[NSDate date] timeIntervalSince1970]];
        [visitor addNote:@"This is another note"];
    }];
    
    [self startChat:^(ZDCConfig *config) {
        config.preChatDataRequirements.name = ZDCPreChatDataRequired;
        config.preChatDataRequirements.email = ZDCPreChatDataRequired;
        config.preChatDataRequirements.phone = ZDCPreChatDataRequired;
        config.preChatDataRequirements.department = ZDCPreChatDataRequired;
        config.preChatDataRequirements.message = ZDCPreChatDataRequired;
        config.showsConnectionBar = YES;
        config.connectionBarAutoCloseDuration = 1.0f;
        config.emailTranscriptAction = emailTranscriptAction;
        // This is required to fix MSDK-4046
        [self observeConnectionEvents];
    }];
}

- (void) presetDataTwo
{
    [[ZDCChat instance].api trackEvent:@"Chat button pressed: (pre-set data) - shows connection bar - user touch required"];

    // Before starting the chat set the visitor data
    [ZDCChat updateVisitor:^(ZDCVisitorInfo *visitor) {
        visitor.phone = [NSString stringWithFormat:@"%lu", (long)[[NSDate date] timeIntervalSince1970]];
        visitor.name = [NSString stringWithFormat:@"Preconfig %lu", (long)[[NSDate date] timeIntervalSince1970]];
        visitor.email = [NSString stringWithFormat:@"chattest+%lu@test.com", (long)[[NSDate date] timeIntervalSince1970]];
        [visitor addNote:@"This is another note"];
    }];

    [self startChat:^(ZDCConfig *config) {
        config.preChatDataRequirements.name = ZDCPreChatDataRequired;
        config.preChatDataRequirements.email = ZDCPreChatDataRequired;
        config.preChatDataRequirements.phone = ZDCPreChatDataRequired;
        config.preChatDataRequirements.department = ZDCPreChatDataRequired;
        config.preChatDataRequirements.message = ZDCPreChatDataRequired;
        config.showsConnectionBar = YES;
        config.connectionBarAutoCloseDuration = 0.0f;
        config.emailTranscriptAction = emailTranscriptAction;
        // This is required to fix MSDK-4046
        [self observeConnectionEvents];
    }];
}

- (void) openModalViewController
{
    // track the event
    [[ZDCChat instance].api trackEvent:@"Modal View Controller opened"];
    
    // simple app navigation simulation
    ViewController *vc = [[ViewController alloc] initWithNibName:nil bundle:nil];
    vc.modal = YES;
    
    UINavigationController* navController = [[UINavigationController alloc] initWithRootViewController:vc];
    navController.modalPresentationStyle = UIModalPresentationFormSheet;
    
    UIBarButtonItem *bbi = [[UIBarButtonItem alloc] initWithTitle:@"Back"
                                                            style:(UIBarButtonItemStylePlain)
                                                           target:self
                                                           action:@selector(dismiss)];
    vc.navigationItem.rightBarButtonItem = bbi;
    
    [self presentViewController:navController animated:YES completion:^{ }];
}

- (void) pushViewController
{
    // track the event
    [[ZDCChat instance].api trackEvent:@"View Controller pushed"];
    
    // simple app navigation simulation
    ViewController *vc = [[ViewController alloc] initWithNibName:nil bundle:nil];
    vc.nested = YES;
    [self.navigationController pushViewController:vc animated:YES];
}

- (void) dismiss
{
    [self dismissViewControllerAnimated:YES completion:^{ }];
}

- (UILabel*) buildLabelWithFrame:(CGRect)frame andText:(NSString*)text
{
    // label helper
    UILabel *label = [[UILabel alloc] initWithFrame:frame];
    //    label.backgroundColor = [UIColor whiteColor];
    label.font = [UIFont systemFontOfSize:14];
    label.text = text;
    label.textColor = [UIColor blackColor];
    label.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin;
    return label;
}

- (UIButton*) buildButtonWithFrame:(CGRect)frame andTitle:(NSString*)title
{
    // button helper
    UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
    button.frame = frame;
    button.backgroundColor = [UIColor whiteColor];
    button.layer.borderColor = ZDC_BTN_BORDER.CGColor;
    button.layer.borderWidth = ZDC_BUTTON_BORDER_WIDTH;
    button.layer.cornerRadius = ZDC_BUTTON_CORNER_RADIUS;
    button.titleLabel.font = [UIFont systemFontOfSize:14];
    [button setTitleColor:ZDC_BTN_TITLE_NORMAL forState:UIControlStateNormal];
    [button setTitleColor:ZDC_BTN_TITLE_HIGHLIGHT forState:UIControlStateHighlighted];
    [button setTitleColor:ZDC_BTN_TITLE_HIGHLIGHT forState:UIControlStateDisabled];
    [button setTitle:title forState:UIControlStateNormal];
    [button setTitle:title forState:UIControlStateHighlighted];
    button.titleLabel.textAlignment = NSTextAlignmentCenter;
    button.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin;
    return button;
}

- (void) updateAccountKey
{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Update account key"
                                                    message:nil
                                                   delegate:self
                                          cancelButtonTitle:@"Cancel"
                                          otherButtonTitles:@"Update", nil];
    
    alert.alertViewStyle = UIAlertViewStylePlainTextInput;
    UITextField *textField = [alert textFieldAtIndex:0];
    textField.placeholder = @"Account key";
    textField.accessibilityIdentifier = @"SampleViewController.accounttDialog.textField";
    [alert show];
}

- (void) alertView:(UIAlertView*)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    switch (buttonIndex) {
            
        case 0: {
            
            // cancelled
            break;
        }
        default: {
            
            UITextField *textField = [alertView textFieldAtIndex:0];
            
            if (textField.text.length > 0) {
                
                [ZDCChat initializeWithAccountKey:textField.text];
            }
            break;
        }
    }
}

@end

