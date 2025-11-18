Pod::Spec.new do |spec|
    spec.name          = 'QuestionProCXFramework'
    spec.version       = '2.2.3'
    spec.summary       = 'Core Library'
    spec.description   = 'This is QuestionPro`s CX Survey library.'
    spec.homepage      = 'https://www.questionpro.com'
    spec.author        = { 'Prasad Bhide' => 'mobile@questionpro.com' }
    spec.license       = { :type => 'MIT', :file => 'LICENSE' }
    spec.source        = { :git => 'https://github.com/prasad-bhide-qp/cxsdk.git', :tag => spec.version }
    spec.swift_version = '5.0'
    spec.ios.deployment_target = '14.0'
    spec.vendored_frameworks = [
      "QuestionProCXFramework.xcframework"
    ]
  end
