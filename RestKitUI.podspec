#
# Be sure to run `pod lib lint RestKitUI.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'RestKitUI'
  s.version          = '0.1.3'
  s.summary          = 'An alpha stage REST Framework for iOS'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
A very early stage Framework thought to create your own REST Services Class to be easy to implement and maintain.
                       DESC

  s.homepage         = 'https://github.com/GiumaSoft/RestKitUI'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Giuseppe Mazzilli' => 'giuseppe.mazzilli@icloud.com' }
  s.source           = { :git => 'https://github.com/GiumaSoft/RestKitUI.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '8.0'
  s.swift_version = ['5.0', '5.1']
  
  s.source_files = 'RestKitUI/Classes/**/*'
  
  # s.resource_bundles = {
  #   'RestKitUI' => ['RestKitUI/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
