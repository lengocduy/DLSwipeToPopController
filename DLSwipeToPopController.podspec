Pod::Spec.new do |s|
  s.name             = 'DLSwipeToPopController'
  s.version          = '1.1.1'
  s.summary          = 'Framework supports Swipe To Pop ViewController'
  s.description      = <<-DESC
  Reusable iOS's behavior to pop ViewController base on [SwipeRightToPopController](https://github.com/rishi420/SwipeRightToPopController)
                       DESC

  s.homepage         = 'https://github.com/lengocduy/DLSwipeToPopController'
  s.license          = { :type => 'MIT', :file => 'LICENSE.md' }
  s.author           = { "Le Ngoc Duy" => "askbills@gmail.com" }
  s.source           = { :git => 'https://github.com/lengocduy/DLSwipeToPopController.git', :tag => "v#{s.version}" }

  s.ios.deployment_target = '11.0'

  s.source_files = 'DLSwipeToPopController/**/*.{swift}'
  s.exclude_files = "DLSwipeToPopController/Exclude"
  
  # s.resource_bundles = {
  #   'DLSwipeToPopController' => ['DLSwipeToPopController/Assets/*.png']
  # }

  # s.public_header_files = "DLSwipeToPopController/*.h"
  s.frameworks = 'UIKit'
  # s.dependency 'AFNetworking', '~> 2.3'
  s.swift_versions = '5.0'
end
