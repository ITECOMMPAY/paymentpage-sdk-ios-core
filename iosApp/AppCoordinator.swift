//
//  AppCoordinator.swift
//  iosApp
//
//  Created by a.khrameev on 14.06.2022.
//

import Foundation
import UIKit

class AppCoordinator: BaseCoordinator {
    
    private var window = UIWindow(frame: UIScreen.main.bounds)
    
    
    override func start() {
        self.window.makeKeyAndVisible()
        showMain()
    }
    
    func showMain(){       
        let mainCoordinator = MainCoordinator()
        self.start(coordinator: mainCoordinator)
        
        ViewControllerUtils.setRootViewController(
            window: self.window,
            viewController: mainCoordinator.navigationController,
            withAnimation: true
        )
    }

}
