Pod::Spec.new do |s|
  s.name             = 'AttributedLib'
  s.version          = '2.2.0'
  s.summary          = 'Modern Swift µframework for attributed strings.'
 
  s.description      = <<-DESC
A Modern interface for attributed strings.

Make working with attributed strings simple and safe. 
This is a light-weight third party alternative to the 
existing inconvinient and error prone programming interface
to `NSAttributedString`.  

                       DESC
 
  s.homepage         = 'https://github.com/Nirma/Attributed'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Nicholas Maccharoli' => 'nmaccharoli@gmail.com' }
  s.source           = { :git => 'https://github.com/Nirma/Attributed.git', :tag => s.version.to_s }
 
  s.swift_version = "4.2"
  s.ios.deployment_target = '9.0'
  s.source_files = 'Attributed/*.swift'
 
end

