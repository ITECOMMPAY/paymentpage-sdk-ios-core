//
//  FinalCoordinator.swift
//  iosApp
//
//  Created by a.khrameev on 08.12.2022.
//

import Foundation
import UIKit
import MsdkCore

class FinalCoordinator: BaseCoordinator {
    
    var payment: Payment!
    
    override func start() {
        let viewController = R.storyboard.final.finalViewController()!
        viewController.paymetnJson = payment.json
        self.navigationController.viewControllers.append(viewController)
    }

}
