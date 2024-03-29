//
//  RestorePaymentViewController.swift
//  iosApp
//
//  Created by a.khrameev on 16.06.2022.
//

import UIKit
import MsdkCore
import SwiftSpinner
import Toaster

class RestorePaymentViewController: PayBaseViewController {
    
    var coordinator: RestorePaymentCoordinator!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        AppDelegate.msdkSession?.getPayInteractor().execute(request: PaymentRestoreRequest(), callback: self)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        SwiftSpinner.useContainerView(view)
        SwiftSpinner.show("Payment processing...")
        
    }
    
    override func onClarificationFields(clarificationFields: [ClarificationField], payment: Payment) {
        super.onClarificationFields(clarificationFields: clarificationFields, payment: payment)
        coordinator.showClarificationFields(clarificationFields: clarificationFields)
    }
    
    override func onThreeDSecure(threeDSecurePage: ThreeDSecurePage, isCascading: Bool, payment: Payment) {
        super.onThreeDSecure(threeDSecurePage: threeDSecurePage, isCascading: isCascading, payment: payment)        
        coordinator.showThreeDSecurePage(threeDSecurePage: threeDSecurePage)
    }
}
