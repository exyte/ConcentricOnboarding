#
# Be sure to run `pod lib lint Macaw.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = "ConcentricOnboarding"
  s.version          = "0.0.6"
  s.summary          = "SwiftUI library for a walkthrough or onboarding flow with tap actions"

  s.homepage         = 'https://github.com/exyte/ConcentricOnboarding.git'
  s.license          = 'MIT'
  s.author           = { 'Exyte' => 'info@exyte.com' }
  s.source           = { :git => 'https://github.com/exyte/ConcentricOnboarding.git', :tag => s.version.to_s }
  s.social_media_url = 'http://exyte.com'

  s.ios.deployment_target = '13.0'
  s.requires_arc = true
  s.swift_version = "5.0"

  s.source_files = [
     'Sources/**/*.swift'
  ]

end
