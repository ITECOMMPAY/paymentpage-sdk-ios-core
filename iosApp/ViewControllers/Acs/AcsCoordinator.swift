//
//  AcsCoordinator.swift
//  iosApp
//
//  Created by a.khrameev on 15.06.2022.
//

import Foundation
import UIKit
import MsdkCore

class AcsCoordinator: BaseCoordinator {
    
    var acsPage: AcsPage!
    
    override func start() {
        let viewController = R.storyboard.acs.acsViewController()!
        viewController.coordinator = self
        viewController.acsPage = acsPage
        self.navigationController.viewControllers.append(viewController)
    }

}
