Pod::Spec.new do |s|
    s.name         = "ZDCChat"
    s.version      = "1.4.7"
    s.summary      = "Zendesk Chat SDK 1.4.7"
    s.homepage     = "https://github.com/zendesk/zendesk_sdk_chat_ios"
    s.license      = {
    :type => 'Copyright',
    :text => <<-LICENSE
        ZDCChat

        Created by Zendesk on 25/03/2015.

        Copyright (c) 2017 Zendesk. All rights reserved.

        By downloading or using the Zendesk Mobile SDK, You agree to the Zendesk Master
        Subscription Agreement https://www.zendesk.com/company/customers-partners/#master-subscription-agreement and Application Developer and API License
        Agreement https://www.zendesk.com/company/customers-partners/#application-developer-api-license-agreement and
        acknowledge that such terms govern Your use of and access to the Mobile SDK.
        LICENSE
    }
    s.author       = 'Zendesk'
    s.source       = { :git => "https://github.com/zendesk/zendesk_sdk_chat_ios.git", :tag => s.version.to_s }
    s.platform     = :ios, '9.3'
    s.requires_arc = true

    s.default_subspecs = 'UI', 'API', 'Localization'

    s.subspec 'UI' do |ss|
        ss.ios.vendored_frameworks = 'ZDCChat.framework'
        ss.preserve_paths = 'ZDCChat.framework'
        ss.frameworks = 'MobileCoreServices', 'SystemConfiguration', 'AVFoundation', 'AssetsLibrary'
        ss.xcconfig = { 'FRAMEWORK_SEARCH_PATHS' => '$(inherited)', 'CLANG_ALLOW_NON_MODULAR_INCLUDES_IN_FRAMEWORK_MODULES' => 'YES' }
        ss.resources = ["ZDCChat.bundle"]
        ss.dependency 'ZDCChat/API'
    end

    s.subspec 'Localization' do |ss|
        ss.resources = ["ZDCChatStrings.bundle"]
    end

    s.subspec 'API' do |ss|
        ss.frameworks = 'SystemConfiguration'
        ss.ios.vendored_frameworks = 'ZDCChatAPI.framework'
        ss.preserve_paths = 'ZDCChatAPI.framework'
        ss.xcconfig = { 'FRAMEWORK_SEARCH_PATHS' => '$(inherited)', 'CLANG_ALLOW_NON_MODULAR_INCLUDES_IN_FRAMEWORK_MODULES' => 'YES' }
    end
end
