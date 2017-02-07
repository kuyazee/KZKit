Pod::Spec.new do |s|

s.name         = "KZKit"
s.version      = "0.0.3"
s.summary      = "debug logger replacement for swift instead of using print(items:Any...)"
s.license      = { :type => "MIT", :file => "LICENSE" }
s.homepage     = "https://github.com/kuyazee/KZKit"
s.author             = { "Zonily Jame Pesquera" => "zonilyjame@gmail.com" }
s.social_media_url   = "http://twitter.com/kuyazee"

s.platform     = :ios, "8.0"
s.requires_arc = true
s.source       = { :git => "https://github.com/kuyazee/KZKit.git", :tag => "#{s.version}" }
s.source_files  = "KZKit", "KZKit/**/*.{h,swift}"


end
