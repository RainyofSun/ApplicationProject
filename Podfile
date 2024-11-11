platform :ios, '13.0'

source 'https://github.com/CocoaPods/Specs.git'

use_frameworks!

# 定义公共库
def CommonPods
  pod 'HandyJSON', '5.0.2'
  pod 'Moya', '15.0.0'
  pod 'SwiftyJSON', '4.3.0'
  pod 'CocoaLumberjack/Swift'
  pod 'Toast-Swift', '5.0.1'
  pod 'Kingfisher', '7.9.1'
  pod 'MJRefresh', '3.7.5'
  pod 'EmptyDataSet-Swift', '5.0.0'
  pod 'FDFullscreenPopGesture', '1.1'
  pod 'Reachability', '3.2'
  pod 'SnapKit', '5.6.0'
end

target 'ApplicationProject' do
  CommonPods()
end

post_install do |installer|
  
  installer.pods_project.targets.each do |t|
    t.build_configurations.each do |config|
      config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = '13.0'
    end
  end
  
  installer.pods_project.build_configurations.each do |config|
    config.build_settings["EXCLUDED_ARCHS[sdk=iphonesimulator*]"] = "arm64"
    config.build_settings['CODE_SIGN_IDENTITY'] = ''
  end
end
