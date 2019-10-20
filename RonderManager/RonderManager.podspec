Pod::Spec.new do |spec|

  spec.name         = "RonderManager"
  spec.version      = "0.0.1"
  spec.summary      = "组件化"

  spec.description  = "组件化开发实践"

  spec.homepage     = "http://EXAMPLE/RonderManager"


  spec.license      = "MIT"

  spec.author             = { "huangpeng" => "1468924117@qq.com" }
  spec.platform     = :ios
  spec.platform     = :ios, "9.0"

  spec.source       = { :git => "http://EXAMPLE/RonderManager.git", :tag => "#{spec.version}" }

  spec.source_files  = "RonderManager/Classes/**/*.{h,m}"
  spec.public_header_files = "RonderManager/Classes/**/*.h"


  # spec.resources = "Resources/*.png"

  spec.frameworks = "UIKit", "Foundation"
  # spec.dependency "JSONKit", "~> 1.4"

end
