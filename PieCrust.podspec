Pod::Spec.new do |s|
    s.name = "PieCrust"
    s.version = "0.6"
    s.summary = "PieCrust is a protocol oriented abstraction layer we use to create iOS apps quickly and efficiently."
    s.description = <<-DESC
    PieCrust is a protocol oriented abstraction layer built on top of UIKit with handy classes, protocols, extensions, syntactic sugar and more, to create iOS apps quickly and efficiently.
    DESC

    s.homepage = "https://github.com/MobilionOSS/PieCrust"
    s.license = { :type => "MIT", :file => "LICENSE" }
    s.social_media_url = "http://twitter.com/omaralbeik"
    s.screenshot = "https://cdn.rawgit.com/MobilionOSS/PieCrust/master/Assets/logo.svg"

    s.authors = {
        "Mobilion" => "https://github.com/MobilionOSS",
        "Omar Albeik" => "https://twitter.com/omaralbeik"
    }

    s.module_name  = 'PieCrust'
    s.source = { :git => "https://github.com/MobilionOSS/PieCrust.git", :tag => s.version }
    s.source_files = "Sources/**/*.swift"
    s.documentation_url = "https://mobilionoss.github.io/PieCrustDocs/"
    s.swift_version = "4.0"
    s.requires_arc = true

    s.ios.resource_bundle = { "PieCrustAssets" => "Assets/PieCrustAssets.bundle/Images" }
    s.ios.deployment_target = "9.0"
    s.ios.framework  = "UIKit"

    s.dependency "SnapKit", "~> 4.0"
    s.dependency "SwifterSwift/SwiftStdlib", "~> 4.2"
    s.dependency "SwifterSwift/Foundation", "~> 4.2"
end
