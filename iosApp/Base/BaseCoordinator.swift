//
//  BaseCoordinator.swift
//  iosApp
//
//  Created by a.khrameev on 14.06.2022.
//

import Foundation
import UIKit

protocol Coordinator: AnyObject {
    var navigationController: BaseNavigationController { get set }
    var parentCoordinator: Coordinator? { get set }
    
    func start()
    func start(coordinator: Coordinator)
    func didFinish(coordinator: Coordinator)
    func removeChildCoordinators()
    func onRemoved()
}

class BaseCoordinator: Coordinator {
    func onRemoved() {
    }
    
    var navigationController = BaseNavigationController()
    var childCoordinators = [Coordinator]()
    var parentCoordinator: Coordinator?
    
    func start() {
        fatalError("Start method should be implemented.")
    }
    
    func start(coordinator: Coordinator) {
        self.childCoordinators += [coordinator]
        coordinator.parentCoordinator = self
        coordinator.start()
    }
    
    func removeChildCoordinators() {
        self.childCoordinators.forEach {
            $0.onRemoved()
            $0.removeChildCoordinators()
            
        }
        self.childCoordinators.removeAll()
    }
    
    func didFinish(coordinator: Coordinator) {
        if let index = self.childCoordinators.firstIndex(where: { $0 === coordinator }) {
            self.onRemoved()
            self.childCoordinators.remove(at: index)
        }
    }
}
