//
//  AppleCoordinator.swift
//  iosApp
//
//  Created by a.khrameev on 15.06.2022.
//

import Foundation
import UIKit
import MsdkCore

class ApplePayCoordinator: BaseCoordinator {
    
   
    override func start() {
        let viewController = R.storyboard.applePay.applePaySaleViewController()!
        viewController.coordinator = self
        self.navigationController.viewControllers = [viewController]
    }
    
    
    func showCustomerFiewlds(customerFields: [CustomerField]) {
        let coordinator = CustomerFieldsCoordinator()
        coordinator.customerFields = customerFields
        coordinator.navigationController = navigationController
        self.start(coordinator: coordinator)
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
    
    func showFinalPage(payment: Payment ) {
        let coordinator = FinalCoordinator()
        coordinator.payment = payment
        coordinator.navigationController = navigationController
        self.start(coordinator: coordinator)
    }

}

