Pod::Spec.new do |s|
    s.name = 'iOSAppSkeleton'
    s.version = '0.1'
    s.summary = 'Congrats on creating your new Xcode project, install this first things first!'
    s.homepage = 'https://github.com/MobilionOSS/iOSAppSkeleton'
    s.license = { :type => 'MIT', :file => 'LICENSE' }
    
    s.authors = {
        'Mobilion' => 'https://github.com/MobilionOSS',
        'Omar Albeik' => 'https://twitter.com/omaralbeik'
    }

    s.ios.deployment_target = '9.0'
    s.source = { :git => "https://github.com/MobilionOSS/iOSAppSkeleton.git", :tag => s.version }
    s.source_files = 'Sources/**/*.swift'
    s.ios.resource_bundle = { 'iOSAppSkeletonAssets' => 'Assets/iOSAppSkeletonAssets.bundle/Images' }
    s.requires_arc = true
    s.pod_target_xcconfig = {
        'SWIFT_VERSION' => '4.0'
    }

    s.ios.framework  = 'UIKit'
    s.dependency 'SnapKit', '~> 4.0'
end