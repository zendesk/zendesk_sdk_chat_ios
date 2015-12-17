/*
 *
 *  ViewController.m
 *  ZDCChat
 *
 *  Created by Zendesk on 27/10/2014.
 *
 *  Copyright (c) 2015 Zendesk. All rights reserved.
 *
 *  By downloading or using the Zopim Chat SDK, You agree to the Zendesk Terms
 *  of Service https://www.zendesk.com/company/terms and Application Developer and API License
 *  Agreement https://www.zendesk.com/company/application-developer-and-api-license-agreement and
 *  acknowledge that such terms govern Your use of and access to the Chat SDK.
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


@implementation ViewController


- (void) viewDidLoad
{
    [super viewDidLoad];

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
    button = [self buildButtonWithFrame:buttonFrame andTitle:@"Chat (no pre-chat form)"];
    button.accessibilityIdentifier = @"PushedChatNoPreChatForm";
    [button addTarget:self action:@selector(noPreChatForm) forControlEvents:(UIControlEventTouchUpInside)];
    [_scrollView addSubview:button];
    
    buttonFrame = CGRectMake(ZDC_BUTTON_MARGIN, floorf(buttonFrame.origin.y + ZDC_BUTTON_SPACING),
                             floorf(self.view.frame.size.width - 2 * ZDC_BUTTON_MARGIN), ZDC_BUTTON_HEIGHT);
    button = [self buildButtonWithFrame:buttonFrame andTitle:@"Chat (pre-set data)"];
    button.accessibilityIdentifier = @"PushedChatPreSetData";
    [button addTarget:self action:@selector(presetData) forControlEvents:(UIControlEventTouchUpInside)];
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
}


- (void) viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];
    _scrollView.contentSize = CGSizeMake(self.contentView.frame.size.width, ZDC_CONTENT_HEIGHT);
    _scrollView.contentInset = UIEdgeInsetsMake([self topViewOffset], 0.0f, [self bottomViewOffset], 0.0f);
}


- (void) allPreChatFieldsOptional
{
    // track the event
    [[ZDCChat instance].session trackEvent:@"Chat button pressed: (all fields optional)"];

    // start a chat in a new modal
    [ZDCChat startChat:nil];
}


- (void) allPreChatFieldsRequired
{
    // track the event
    [[ZDCChat instance].session trackEvent:@"Chat button pressed: (all fields required)"];

    // Start a chat pushed on to the current navigation controller
    // with session config making all pre-chat fields required
    [ZDCChat startChatIn:self.navigationController withConfig:^(ZDCSessionConfig *config) {
        

        config.preChatDataRequirements.name = ZDCPreChatDataRequiredEditable;
        config.preChatDataRequirements.email = ZDCPreChatDataRequiredEditable;
        config.preChatDataRequirements.phone = ZDCPreChatDataRequiredEditable;
        config.preChatDataRequirements.department = ZDCPreChatDataRequiredEditable;
        config.preChatDataRequirements.message = ZDCPreChatDataRequired;
    }];
}


- (void) noPreChatForm
{
    // track the event
    [[ZDCChat instance].session trackEvent:@"Chat button pressed: (no pre-chat form)"];

    // start a chat pushed on to the current navigation controller
    // with session config setting all pre-chat fields as not required
    [ZDCChat startChatIn:self.navigationController withConfig:^(ZDCSessionConfig *config) {

        config.preChatDataRequirements.name = ZDCPreChatDataNotRequired;
        config.preChatDataRequirements.email = ZDCPreChatDataNotRequired;
        config.preChatDataRequirements.phone = ZDCPreChatDataNotRequired;
        config.preChatDataRequirements.department = ZDCPreChatDataNotRequired;
        config.preChatDataRequirements.message = ZDCPreChatDataNotRequired;
        config.emailTranscriptAction = ZDCEmailTranscriptActionNeverSend;
    }];
}


- (void) presetData
{
    // track the event
    [[ZDCChat instance].session trackEvent:@"Chat button pressed: (pre-set data)"];

    // before starting the chat set the visitor data
    [ZDCChat updateVisitor:^(ZDCVisitorInfo *visitor) {

        visitor.phone = [NSString stringWithFormat:@"%lu", (long)[[NSDate date] timeIntervalSince1970]];
        visitor.name = [NSString stringWithFormat:@"Preconfig %lu", (long)[[NSDate date] timeIntervalSince1970]];
        visitor.email = [NSString stringWithFormat:@"chattest+%lu@test.com", (long)[[NSDate date] timeIntervalSince1970]];
    }];

    // start a chat pushed on to the current navigation controller
    // with a session config requiring all pre-chat fields and setting tags and department
    [ZDCChat startChatIn:self.navigationController withConfig:^(ZDCSessionConfig *config) {
        
        config.preChatDataRequirements.name = ZDCPreChatDataRequired;
        config.preChatDataRequirements.email = ZDCPreChatDataRequired;
        config.preChatDataRequirements.phone = ZDCPreChatDataRequired;
        config.preChatDataRequirements.department = ZDCPreChatDataRequired;
        config.preChatDataRequirements.message = ZDCPreChatDataRequired;
        config.department = @"The date";
        config.tags = @[@"tag1", @"tag2"];
    }];
}


- (void) openModalViewController
{
    // track the event
    [[ZDCChat instance].session trackEvent:@"Modal View Controller opened"];

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
    [[ZDCChat instance].session trackEvent:@"View Controller pushed"];

    // simple app navigation simulation
    ViewController *vc = [[ViewController alloc] initWithNibName:nil bundle:nil];
    vc.nested = YES;
    [self.navigationController pushViewController:vc animated:YES];
}


- (void) dismiss
{
    [self dismissViewControllerAnimated:YES completion:^{ }];
}


- (UIButton*) buildButtonWithFrame:(CGRect)frame andTitle:(NSString*)title
{
    // button helper
    UIButton *button = [[UIButton alloc] initWithFrame:frame];
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


#pragma mark account key


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

                [ZDCChat configure:^(ZDCConfig *defaults) {

                    defaults.accountKey = textField.text;
                }];
            }
            break;
        }
    }
}


@end

