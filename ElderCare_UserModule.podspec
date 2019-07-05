#
# Be sure to run `pod lib lint ElderCare_UserModule.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'ElderCare_UserModule'
  s.version          = '0.1.0'
  s.summary          = 'ElderCare_UserModule in ElderCare project'
  s.swift_version    = '5.0'

  s.description      = <<-DESC
  This is UserModule of ElderCare project. Here is ther users of ElderCare system who will be managers.
                       DESC

  s.homepage         = 'https://github.com/gear-station/EalderCare_iOS_UserModule'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'skykywind' => 'jiafujia123@gmail.com' }
  s.source           = { :git => 'https://github.com/gear-station/EalderCare_iOS_UserModule.git', :tag => s.version.to_s }

  s.ios.deployment_target = '9.3'

  s.source_files = 'ElderCare_UserModule/Classes/**/*'
  
  # s.resource_bundles = {
  #   'ElderCare_UserModule' => ['ElderCare_UserModule/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  s.dependency 'JFJExtension'
  s.dependency 'SegMenu'
end
