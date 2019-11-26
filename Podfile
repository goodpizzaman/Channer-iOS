# Uncomment the next line to define a global platform for your project
# platform :ios, '9.0'



target 'Channer' do
  # Comment the next line if you're not using Swift and don't want to use dynamic frameworks
  use_frameworks!
  source 'https://github.com/CocoaPods/Specs.git'
  # This line is needed until OGVKit is fully published to CocoaPods
  # Remove once packages published:
  source 'https://github.com/brion/OGVKit-Specs.git'
  
  
  # Pods for Channer

  pod 'SwiftyJSON'
  pod 'Alamofire'
  pod 'HanekeSwift', :git => 'https://github.com/Haneke/HanekeSwift.git', :tag => 'v0.11.1'
  pod 'OGVKit/WebM'
  pod 'ImageScrollView'
  pod 'SwiftGifOrigin', '~> 1.7.0'
  pod 'PMAlertController'
  pod 'DeviceKit'
  pod "AsyncSwift"

  target 'ChannerTests' do
    inherit! :search_paths
    # Pods for testing
  end

  target 'ChannerUITests' do
    inherit! :search_paths
    # Pods for testing
  end

end
