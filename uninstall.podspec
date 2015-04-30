Pod::Spec.new do |s|
  s.name         = "Uninstall"
  s.version      = "1.0.1"
  s.summary      = "World’s First Solution on Uninstall Mystery"

  s.description  = <<-DESC
                   Measure Uninstall across various parameters from last event, crashes, too many notifications, external events like a sale, location, device and various others to understand the Reasons and Patterns of why your users are Uninstalling the app.
                   DESC

  s.homepage     = "http://www.uninstall.io/"
  s.license      = { :type => "BSD", :file => "LICENSE" }
  s.author       = { "Aravind G S" => "aravindgs@github.com" }


  s.platform     = :ios, "7.0"
  s.source         = { :git => "https://github.com/uninstallio/ios-sdk.git", :tag => s.version.to_s }

  s.source_files   = "Classes", "Builds/All-Targets-armv6-armv7-simulator/include/**/*.{h,m}","Builds/All-Targets-armv6-armv7-simulator/libNotifyManager.a"
  s.frameworks     = 'CoreLocation','CoreBluetooth','CoreTelephony','QuartzCore','Security','SystemConfiguration','AdSupport'
  s.requires_arc = true
end