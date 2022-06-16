//
//  MainCoordinator.swift
//  iosApp
//
//  Created by a.khrameev on 14.06.2022.
//


import Foundation
import UIKit
import EcmpMsdkCore

class MainCoordinator: BaseCoordinator {
    
    override func start() {
        let viewController = R.storyboard.main.mainViewController()!
        viewController.coordinator = self
        self.navigationController.viewControllers = [viewController]
    }
    
    func showCardViewController() {
        let coordinator = CardCoordinator()
        coordinator.navigationController = navigationController
        self.start(coordinator: coordinator)
    }
    
    func showSavedCardViewController(savedAccount: SavedAccount) {
        let coordinator = CardCoordinator()
        coordinator.savedAccount = savedAccount
        coordinator.navigationController = navigationController
        self.start(coordinator: coordinator)
    }
    
    func showApplePay() {
        let coordinator = ApplePayCoordinator()
        coordinator.navigationController = navigationController
        self.start(coordinator: coordinator)
    }
    
    func showCardRemoveViewController() {
        let coordinator = RemoveSavedCardCoordinator()
        coordinator.navigationController = navigationController
        self.start(coordinator: coordinator)
    }
    
    func showRestorePaymentController() {
        let coordinator = RestorePaymentCoordinator()
        coordinator.navigationController = navigationController
        self.start(coordinator: coordinator)
    }

}

