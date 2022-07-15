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

class RestorePaymentViewController: UIViewController {
    
    var coordinator: RestorePaymentCoordinator!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        AppDelegate.msdkSession?.getPaymentRestoreInteractor().execute(
            request: RestorePaymentRequest(),
            callback: self
        )
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        SwiftSpinner.useContainerView(view)
        SwiftSpinner.show("Payment processing...")
        
    }
}

extension RestorePaymentViewController: PaymentRestoreDelegate {
   
    //received clarification fields, which need to fill and send
    func onClarificationFields(clarificationFields: [ClarificationField], payment: Payment) {
        SwiftSpinner.hide()
        coordinator.showClarificationFields(clarificationFields: clarificationFields)
    }
    
    func onCompleteWithDecline(payment: Payment) {
        SwiftSpinner.hide()
        Toast(text: "Payment was declined").show()
    }
    
    func onCompleteWithFail(status: String?, payment: Payment) {
        SwiftSpinner.hide()
        Toast(text: "Payment completed with error").show()
    }
    
    func onCompleteWithSuccess(payment: Payment) {
        SwiftSpinner.hide()
        Toast(text: "Payment completed with success").show()
    }
    
    func onError(code: ErrorCode, message: String){
        SwiftSpinner.hide()
        Toast(text: "Error").show()
    }
    
    func onStatusChanged(status: PaymentStatus, payment: Payment) {
        Toast(text: "Payment status is \(status.name)").show()
    }
    
    //received 3ds page and need open it in WebView
    func onThreeDSecure(acsPage: AcsPage, isCascading: Bool, payment: Payment) {
        SwiftSpinner.hide()
        coordinator.showAcs(acsPage: acsPage)
    }
    
}

