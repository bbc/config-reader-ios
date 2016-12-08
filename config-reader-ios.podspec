#
# Be sure to run `pod lib lint config-reader-ios.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'config-reader-ios'
  s.version          = '0.1.0'
  s.summary          = 'A config file reader library'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
                        A framework to read configuration key-value pairs from a config file and make them
                        globally available. The ConfigReader class provides the functionality to read
                        values from a specified config file and convert them to the appropriate type.
                       DESC

  s.homepage         = 'https://github.com/bbc/config-reader-ios'
  s.license          = { :type => 'Apache License, Version 2.0', :file => 'LICENSE' }
  s.author           = { 'Rajiv Ramdhany' => 'rajiv.ramdhany@bbc.co.uk' }
  s.source           = { :git => 'https://github.com/bbc/config-reader-ios.git', :tag => s.version.to_s }

  s.ios.deployment_target = '8.0'

  s.source_files = 'config-reader-ios/Classes/**/*'
  
  # s.resource_bundles = {
  #   'config-reader-ios' => ['config-reader-ios/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
