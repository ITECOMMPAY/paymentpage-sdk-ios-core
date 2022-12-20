//
//  RestorePaymentCoordinator.swift
//  iosApp
//
//  Created by a.khrameev on 16.06.2022.
//

import Foundation
import UIKit
import MsdkCore

class RestorePaymentCoordinator: BaseCoordinator {
    
    override func start() {
        let viewController = R.storyboard.restorePayment.restorePaymentViewController()!
        viewController.coordinator = self
        self.navigationController.viewControllers = [viewController]
    }
    
    func showClarificationFields(clarificationFields: [ClarificationField] ) {
        let coordinator = ClarificationFieldsCoordinator()
        coordinator.clarificationFields = clarificationFields
        coordinator.navigationController = navigationController
        self.start(coordinator: coordinator)
    }
    
    func showThreeDSecurePage(threeDSecurePage: ThreeDSecurePage ) {
        let coordinator = ThreeDSecureCoordinator()
        coordinator.threeDSecurePage = threeDSecurePage
        coordinator.navigationController = navigationController
        self.start(coordinator: coordinator)
    }
}

