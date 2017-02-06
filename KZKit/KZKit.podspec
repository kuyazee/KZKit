Pod::Spec.new do |s|

s.name         = "KZKit"
s.version      = "0.0.1"
s.summary      = "debug logger replacement for swift instead of using print(items:Any...)"
s.license      = { :type => "MIT", :file => "LICENSE" }
s.homepage     = "https://github.com/kuyazee/KZLogger"
s.author             = { "Zonily Jame Pesquera" => "zonilyjame@gmail.com" }
s.social_media_url   = "http://twitter.com/kuyazee"

s.platform     = :ios, "8.0"
s.requires_arc = true
s.source       = { :git => "https://github.com/kuyazee/KZLogger.git", :tag => "#{s.version}" }
s.source_files  = "KZLogger", "KZLogger/**/*.{h,swift}"

end
