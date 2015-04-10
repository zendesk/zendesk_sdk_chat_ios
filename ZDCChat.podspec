Pod::Spec.new do |s|
s.name         = "ZDCChat"
s.version      = "0.9.0"
s.summary      = "Zopim SDK 0.9.0"
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
s.source_files = 'ZDCChat.framework/Headers/*.h'
s.requires_arc = true
s.ios.vendored_frameworks = 'ZDCChat.framework'
s.xcconfig = { 'FRAMEWORK_SEARCH_PATHS' => '$(inherited)' }
s.preserve_paths = 'ZDCChat.framework'
s.resources = ["ZDCChat.bundle", "ZDCChatStrings.bundle"]
end
