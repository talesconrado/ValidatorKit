Pod::Spec.new do |spec|

    spec.name = "ValidatorKit"
    spec.version = "1.1.1"
    spec.summary = "A short description of ValidatorKit."
    spec.description = "A complete description of ValidatorKit and very good."
    spec.homepage = "https://github.com/talesconrado/FTValidatorKit"
    spec.license = { :type => "MIT", :file => "LICENSE" }
    spec.author = "Tales Conrado"
    spec.ios.deployment_target = "14.5"
    spec.source = { :git => "https://github.com/talesconrado/ValidatorKit.git", :tag => spec.version }
    spec.source_files = "ValidatorKit/*.{h,m}"
    spec.swift_version = "5.3"

end
