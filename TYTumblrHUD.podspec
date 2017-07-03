#
# Be sure to run `pod lib lint TYTumblrHUD.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'TYTumblrHUD'
  s.version          = '0.2.3'
  s.summary          = 'Progress HUD like Tumblr.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

#   s.description      = <<-DESC
# Progress HUD like Tumblr.
#                        DESC

  s.homepage         = 'https://github.com/luckytianyiyan/TYTumblrHUD'
  s.screenshots     = 'https://raw.githubusercontent.com/luckytianyiyan/TYTumblrHUD/master/README_IMAGES/Example.gif'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'luckytianyiyan' => 'luckytianyiyan@gmail.com' }
  s.source           = { :git => 'https://github.com/luckytianyiyan/TYTumblrHUD.git', :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/luckytianyiyan'

  s.ios.deployment_target = '7.0'

  s.source_files = 'TYTumblrHUD/Classes/**/*'

  # s.resource_bundles = {
  #   'TYTumblrHUD' => ['TYTumblrHUD/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
