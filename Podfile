# Uncomment the next line to define a global platform for your project
# platform :ios, '9.0'

target 'patmeapp' do
  source 'https://github.com/CocoaPods/Specs.git'
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!
  # Pods for patmeapp
  pod 'MDFInternationalization'
  pod 'Firebase/Auth'
  pod 'Auth0', '~> 1.0'
  pod 'SMPageControl'
  pod 'POEditorAPI'
  pod 'Alamofire'
  pod 'MaterialComponents'
  pod 'TagCellLayout', :git => 'https://github.com/riteshhgupta/TagCellLayout.git'

  post_install do |installer|
  installer.pods_project.targets.each do |target|
  target.build_configurations.each do |config|
  config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = '11.0'
  end
  end
  end
end
