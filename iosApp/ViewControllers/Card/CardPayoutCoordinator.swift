//
//  CardPayoutCoordinator.swift
//  iosApp
//
//  Created by a.khrameev on 10.10.2022.
//

import Foundation
import UIKit
import MsdkCore

class CardPayoutCoordinator: BaseCoordinator {
    
   
    override func start() {
        let viewController = R.storyboard.cardSale.cardPayoutViewController()!
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
    
    func showAcs(acsPage: AcsPage ) {
        let coordinator = AcsCoordinator()
        coordinator.acsPage = acsPage
        coordinator.navigationController = navigationController
        self.start(coordinator: coordinator)
    }

}


