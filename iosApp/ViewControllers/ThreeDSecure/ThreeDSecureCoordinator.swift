//
//  AcsCoordinator.swift
//  iosApp
//
//  Created by a.khrameev on 15.06.2022.
//

import Foundation
import UIKit
import MsdkCore

class ThreeDSecureCoordinator: BaseCoordinator {
    
    var threeDSecurePage: ThreeDSecurePage!
    
    override func start() {
        let viewController = R.storyboard.threeDSecure.threeDSecureViewController()!
        viewController.coordinator = self
        viewController.threeDSecurePage = threeDSecurePage
        self.navigationController.viewControllers.append(viewController)
    }

}
