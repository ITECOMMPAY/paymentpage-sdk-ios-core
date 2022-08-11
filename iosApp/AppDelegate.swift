//
//  AppDelegate.swift
//  iosApp
//
//  Created by a.khrameev on 05.05.2022.
//

import UIKit
import MsdkCore

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    public static var msdkSession: MSDKCoreSession? = nil
    public let appCoordinator = AppCoordinator()

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
       
        let msdkConfig = MSDKCoreSessionConfig.companion.release(apiHost: "sdk.ecommpay.com", wsApiHost: "paymentpage.ecommpay.com")
        //for mocking requests
        //let msdkConfig = MSDKCoreSessionConfig.companion.mockFullSuccessFlow()
        AppDelegate.msdkSession = MSDKCoreSession(config: msdkConfig)
        appCoordinator.start()
        
        return true
    }

}

