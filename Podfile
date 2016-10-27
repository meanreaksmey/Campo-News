source 'https://github.com/CocoaPods/Specs.git'
platform :ios, '10.0'
use_frameworks!

target “test” do
    pod 'FlowingMenu'
    pod "FontAwesomeKit/FontAwesome", :git => 'https://github.com/PrideChung/FontAwesomeKit.git'
    pod 'Alamofire', '~> 4.0'
    pod 'SwiftyJSON', :git => 'https://github.com/acegreen/SwiftyJSON.git', :branch => 'swift3'
    pod 'Kingfisher', '~> 3.0'
    pod 'PageMenu', :git => 'https://github.com/orazz/PageMenu.git'
    pod 'MBProgressHUD', '~> 1.0.0'
    pod 'Cosmos'
    pod 'youtube-ios-player-helper'
    
end
post_install do |installer|
    installer.pods_project.targets.each do |target|
        target.build_configurations.each do |config|
            config.build_settings['SWIFT_VERSION'] = '3.0'
        end
    end
end
