# Uncomment the next line to define a global platform for your project
platform :ios, '16.1'

target 'xcuitest-example' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!

  # Pods for xcuitest-example
  pod 'SBTUITestTunnelServer'

  target 'xcuitest-exampleTests' do
    inherit! :search_paths
    # Pods for testing
  end

  target 'xcuitest-exampleUITests' do
    # Pods for testing
    pod 'SBTUITestTunnelClient'
  end
  
  post_install do |installer|
      installer.generated_projects.each do |project|
            project.targets.each do |target|
                target.build_configurations.each do |config|
                    config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = '13.0'
                 end
            end
     end
  end

end
