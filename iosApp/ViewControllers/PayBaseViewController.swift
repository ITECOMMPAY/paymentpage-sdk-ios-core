//
//  PayBaseViewController.swift
//  iosApp
//
//  Created by a.khrameev on 14.06.2022.
//

import UIKit
import MsdkCore
import SwiftSpinner
import Toaster

class PayBaseViewController: UIViewController {
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        SwiftSpinner.useContainerView(view)
        SwiftSpinner.show("Payment processing...")
    }
}

extension PayBaseViewController: PayDelegate {
    
    //need handle and send customer fields
    func onCustomerFields(customerFields: [CustomerField]) {
        SwiftSpinner.hide()
    }
   
    //received clarification fields, which need to fill and send
    func onClarificationFields(clarificationFields: [ClarificationField], payment: Payment) {
        SwiftSpinner.hide()
    }
    
    func onCompleteWithDecline(isTryAgain: Bool, paymentMessage: String?, payment: Payment) {
        SwiftSpinner.hide()
        Toast(text: "Payment was declined").show()
    }
    
    func onCompleteWithSuccess(payment: Payment) {
        SwiftSpinner.hide()
        Toast(text: "Payment completed with success").show()
    }
    
    func onError(code: ErrorCode, message: String){
        SwiftSpinner.hide()
        Toast(text: "Error").show()
    }
    
    func onPaymentCreated() {
        Toast(text: "Payment created").show()
    }
    
    func onStatusChanged(status: PaymentStatus, payment: Payment) {
        Toast(text: "Payment status is \(status.name)").show()
    }
    
    func onThreeDSecure(threeDSecurePage: ThreeDSecurePage, isCascading: Bool, payment: Payment) {
        SwiftSpinner.hide()
    }
    
}
