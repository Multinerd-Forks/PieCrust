Pod::Spec.new do |s|
    s.name = 'PieCrust'
    s.version = '0.1'
    s.summary = '[WIP] PieCrust is the foundation layer we use here at Mobilion to write iOS apps with ease.'
    s.homepage = 'https://github.com/MobilionOSS/PieCrust'
    s.license = { :type => 'MIT', :file => 'LICENSE' }
    
    s.authors = {
        'Mobilion' => 'https://github.com/MobilionOSS',
        'Omar Albeik' => 'https://twitter.com/omaralbeik'
    }

    s.ios.deployment_target = '9.0'
    s.source = { :git => "https://github.com/MobilionOSS/PieCrust.git", :tag => s.version }
    s.source_files = 'Sources/**/*.swift'
    s.ios.resource_bundle = { 'PieCrustAssets' => 'Assets/PieCrustAssets.bundle/Images' }
    s.requires_arc = true
    s.pod_target_xcconfig = {
        'SWIFT_VERSION' => '4.0'
    }

    s.ios.framework  = 'UIKit'
    s.dependency 'SnapKit', '~> 4.0'
end
