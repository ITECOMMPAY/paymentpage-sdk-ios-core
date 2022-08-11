//
//  ApsCoordinator.swift
//  iosApp
//
//  Created by a.khrameev on 01.08.2022.
//

import Foundation
import UIKit
import MsdkCore

class ApsCoordinator: BaseCoordinator {
    
    override func start() {
        let viewController = R.storyboard.aps.apsViewController()!
        viewController.coordinator = self
        self.navigationController.viewControllers.append(viewController)
    }

}

