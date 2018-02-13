Pod::Spec.new do |s|
    s.name = 'PieCrust'
    s.version = '0.2'
    s.summary = '[WIP] PieCrust is the foundation layer we use here at Mobilion to write iOS apps with ease.'
    s.description = <<-DESC
    PieCrust is the foundation layer we use here at Mobilion to write iOS apps with ease.
    DESC

    s.homepage = 'https://github.com/MobilionOSS/PieCrust'
    s.license = { :type => 'MIT', :file => 'LICENSE' }
    s.social_media_url = 'http://twitter.com/omaralbeik'
    
    s.authors = {
        'Mobilion' => 'https://github.com/MobilionOSS',
        'Omar Albeik' => 'https://twitter.com/omaralbeik'
    }

    s.ios.deployment_target = '9.0'
    s.source = { :git => "https://github.com/MobilionOSS/PieCrust.git", :tag => s.version }
    s.source_files = 'Sources/**/*.swift'
    s.ios.resource_bundle = { 'PieCrustAssets' => 'Assets/PieCrustAssets.bundle/Images' }
    s.requires_arc = true
    s.swift_version = '4.0'

    s.ios.framework  = 'UIKit'
    s.dependency 'SnapKit', '~> 4.0'
end
