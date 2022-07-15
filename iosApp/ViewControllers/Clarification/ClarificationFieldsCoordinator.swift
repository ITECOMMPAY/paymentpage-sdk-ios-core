//
//  ClarificationFieldsCoordinator.swift
//  iosApp
//
//  Created by a.khrameev on 14.06.2022.
//

import Foundation
import UIKit
import MsdkCore

class ClarificationFieldsCoordinator: BaseCoordinator {
    
    var clarificationFields: [ClarificationField] = []
    
    override func start() {
        let viewController = R.storyboard.clarificationFields.clarificationFieldsTableViewController()!
        viewController.clarificationFields = clarificationFields
        viewController.coordinator = self
        self.navigationController.viewControllers.append(viewController)
    }

}

