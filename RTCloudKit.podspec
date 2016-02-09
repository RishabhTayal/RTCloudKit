#
# Be sure to run `pod lib lint RTCloudKit.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = "RTCloudKit"
  s.version          = "0.1.1"
  s.summary          = "Easy to use iOS wrapper library for Apple's CloudKit framework."

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!  
#s.description      = "Easy to use iOS wrapper library for Apples CloudKit framework."

  s.homepage         = "https://github.com/rishabhtayal/RTCloudKit"
  # s.screenshots     = "www.example.com/screenshots_1", "www.example.com/screenshots_2"
  s.license          = 'MIT'
  s.author           = { "Rishabh Tayal" => "rtayal11@gmail.com" }
  s.source           = { :git => "https://github.com/rishabhtayal/RTCloudKit.git", :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/rishabh_tayal'

  s.platform     = :ios, '8.0'
  s.requires_arc = true

  s.source_files = 'Pod/Classes/**/*'
  s.resource_bundles = {
    'RTCloudKit' => ['Pod/Assets/*.png']
  }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
