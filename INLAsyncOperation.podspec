#
# Be sure to run `pod lib lint INLAsyncOperation.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'INLAsyncOperation'
  s.version          = '0.1.0'
  s.summary          = 'Asynchronous operation wrapper.'

  s.description      = <<-DESC
  Wrapper for your asynchronous operation.
                       DESC

  s.homepage         = 'https://github.com/inloop/INLAsyncOperation'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'radimhalfar' => 'radim.halfar@inloop.eu' }
  s.source           = { :git => 'https://github.com/inloop/INLAsyncOperation.git', :tag => s.version.to_s }

  s.ios.deployment_target = '9.0'

  s.source_files = 'INLAsyncOperation/Classes/**/*'
end
