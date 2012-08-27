Pod::Spec.new do |s|
  s.name         = "CDPlistManager"
  s.version      = "0.0.1"
  s.summary      = "Objective-c class for working with plist."
  s.homepage     = "https://github.com/Nuclominus/FileManager"

  s.license      = { :type => 'MIT', :file => 'LICENSE' }
  s.author       = { "Roman Luxor" => "9DGRoman@gmail.com" }
 s.source       = { :git => "https://github.com/Nuclominus/FileManager.git",  :commit => "e23e92f1ce6a088eba70db0c0901974ad750393d" }
  
  s.platform     = :ios, '3.2'
  s.source_files = '*.{h,m}'
  s.requires_arc = true

end
