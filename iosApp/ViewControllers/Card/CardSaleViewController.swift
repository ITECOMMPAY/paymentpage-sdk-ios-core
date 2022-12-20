//
//  NewCardSaleViewController.swift
//  iosApp
//
//  Created by a.khrameev on 05.05.2022.
//

import UIKit
import MsdkCore
import SwiftSpinner
import Toaster

class CardSaleViewController: PayBaseViewController {
    
    var coordinator: CardCoordinator!

    override func viewDidLoad() {
        super.viewDidLoad()
       
        
        //CardTokenizeRequest - tokenize card
        //CardVerifyRequest - verify card
        //NewCardSaleRequest - sale with card
        //CardSaleTokenizeRequest - sale with previously(CardTokenizeRequest) card token
        //CardAuthRequest - auth with card
        //CardAuthTokenizeRequest - auth with previously(CardTokenizeRequest) card token
        AppDelegate.msdkSession?.getPayInteractor().execute(request: NewCardSaleRequest(
            cvv: "123",
            pan: "4242424242424242",
            expiryDate: CardDate(month: 1, year: 2025),
            cardHolder: "MSDK CORE",
            saveCard: false
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
