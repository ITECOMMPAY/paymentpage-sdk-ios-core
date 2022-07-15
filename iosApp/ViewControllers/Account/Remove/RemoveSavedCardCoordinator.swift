//
//  RemoveSavedCardCoordinator.swift
//  iosApp
//
//  Created by a.khrameev on 15.06.2022.
//

import Foundation
import UIKit
import MsdkCore

class RemoveSavedCardCoordinator: BaseCoordinator {
    
   
    override func start() {
        let viewController = R.storyboard.removeSavedCardViewController.removeSavedCardViewController()!
        self.navigationController.viewControllers = [viewController]
    }

}

