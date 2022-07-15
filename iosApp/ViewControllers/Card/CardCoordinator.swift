//
//  CardCoordinator.swift
//  iosApp
//
//  Created by a.khrameev on 14.06.2022.
//

import Foundation
import UIKit
import MsdkCore

class CardCoordinator: BaseCoordinator {
    
    var savedAccount: SavedAccount?
   
    override func start() {
        if (savedAccount == nil) {
            let viewController = R.storyboard.cardSale.cardSaleViewController()!
            viewController.coordinator = self
            self.navigationController.viewControllers = [viewController]
        } else {
            let viewController = R.storyboard.cardSale.savedCardSaleViewController()!
            viewController.coordinator = self
            viewController.savedAccount = savedAccount
            self.navigationController.viewControllers = [viewController]
        }
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

