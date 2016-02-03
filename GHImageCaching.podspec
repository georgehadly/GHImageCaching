#
# Be sure to run `pod lib lint GHImageCaching.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = "GHImageCaching"
  s.version          = "0.1.0"
  s.summary          = "This is an extension for UIImageView to cache image with NSUrl or NSData"

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!  
  s.description      = <<-DESC
  
  This library was written as an extension to UIImageView so that it can request Image with URL or Data then Cache Image as a physically file based on the defined folder.
  
                       DESC

  s.homepage         = "https://github.com/georgehadly/GHImageCaching"
  # s.screenshots     = "www.example.com/screenshots_1", "www.example.com/screenshots_2"
  s.license          = 'MIT'
  s.author           = { "George Hanna Adly" => "george.hanna.adly@hotmail.com" }
  s.source           = { :git => "https://github.com/georgehadly/GHImageCaching.git", :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.platform     = :ios, '8.0'
  s.requires_arc = true

  s.source_files = 'Pod/Classes/**/*'
  s.resource_bundles = {
    'GHImageCaching' => ['Pod/Assets/*.png']
  }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
