//
//  CustomerFieldsCoordinator.swift
//  iosApp
//
//  Created by a.khrameev on 14.06.2022.
//

import Foundation
import UIKit
import EcmpMsdkCore

class CustomerFieldsCoordinator: BaseCoordinator {
    
    var customerFields: [CustomerField] = []
    
    override func start() {
        let viewController = R.storyboard.customerFields.customerFieldsTableViewController()!
        viewController.customerFields = customerFields
        viewController.coordinator = self
        self.navigationController.viewControllers.append(viewController)
    }

}

