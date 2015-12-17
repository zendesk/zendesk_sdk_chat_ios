Pod::Spec.new do |s|
    s.name         = "ZDCChat"
    s.version      = "1.1.3"
    s.summary      = "Zopim SDK 1.1.3"
    s.homepage     = "https://github.com/zendesk/zendesk_sdk_chat_ios"
    s.license      = { 
    :type => 'Copyright', 
    :text => <<-LICENSE 
        ZDCChat

        Created by Zendesk on 25/03/2015.  

        Copyright (c) 2015 Zendesk. All rights reserved.

        By downloading or using the Zopim Mobile SDK, You agree to the Zendesk Terms
        of Service https://www.zendesk.com/company/terms and Application Developer and API License
        Agreement https://www.zendesk.com/company/application-developer-and-api-license-agreement and
        acknowledge that such terms govern Your use of and access to the Mobile SDK.
        LICENSE
    }
    s.author       = 'Zendesk'
    s.source       = { :git => "https://github.com/zendesk/zendesk_sdk_chat_ios.git", :tag => s.version.to_s }
    s.platform     = :ios, '6.0'
    s.requires_arc = true

    # Using subspecs to support installation without Localization part
    s.default_subspecs = 'Core', 'Localization'

    s.subspec 'Core' do |ss|
        ss.public_header_files = 'ZDCChat.framework/**/*.h'
        ss.ios.vendored_frameworks = 'ZDCChat.framework'
        ss.preserve_paths = 'ZDCChat.framework'
        ss.xcconfig = { 'FRAMEWORK_SEARCH_PATHS' => '$(inherited)', 'CLANG_ALLOW_NON_MODULAR_INCLUDES_IN_FRAMEWORK_MODULES' => 'YES' }
        ss.resources = ["ZDCChat.bundle"]
    end

    s.subspec 'Localization' do |ss|
        ss.resources = ["ZDCChatStrings.bundle"]
        ss.dependency 'ZDCChat/Core'
    end

end
