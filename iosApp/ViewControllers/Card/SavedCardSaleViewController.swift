//
//  SavedCardSaleViewController.swift
//  iosApp
//
//  Created by a.khrameev on 05.05.2022.
//

import UIKit
import MsdkCore
import SwiftSpinner
import Toaster

class SavedCardSaleViewController: PayBaseViewController {
    
    var coordinator: CardCoordinator!
    var savedAccount: SavedAccount!

    override func viewDidLoad() {
        super.viewDidLoad()
       
        
        //SavedCardSaleRequest - sale with saved card
        //SavedCardAuthRequest - auth with saved card
        AppDelegate.msdkSession?.getPayInteractor().execute(request: SavedCardSaleRequest(
            cvv: "123",
            accountId: savedAccount.id
        ), callback: self)
    }
    
    override func onCustomerFields(customerFields: [CustomerField]) {
        super.onCustomerFields(customerFields: customerFields)
        coordinator.showCustomerFiewlds(customerFields: customerFields)
    }
    
    override func onClarificationFields(clarificationFields: [ClarificationField], payment: Payment) {
        super.onClarificationFields(clarificationFields: clarificationFields, payment: payment)
        coordinator.showClarificationFields(clarificationFields: clarificationFields)
    }
    
    override func onThreeDSecure(threeDSecurePage: ThreeDSecurePage, isCascading: Bool, payment: Payment) {
        super.onThreeDSecure(threeDSecurePage: threeDSecurePage, isCascading: isCascading, payment: payment)
        coordinator.showThreeDSecurePage(threeDSecurePage: threeDSecurePage)
    }
    
    override func onCompleteWithSuccess(payment: Payment) {
        super.onCompleteWithSuccess(payment: payment)
        coordinator.showFinalPage(payment: payment)
    }
    
    override func onCompleteWithDecline(isTryAgain: Bool, paymentMessage: String?, payment: Payment) {
        super.onCompleteWithDecline(isTryAgain: isTryAgain, paymentMessage: paymentMessage, payment: payment)
        coordinator.showFinalPage(payment: payment)
    }
    
}
