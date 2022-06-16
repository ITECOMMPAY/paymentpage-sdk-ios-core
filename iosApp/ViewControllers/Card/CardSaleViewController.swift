//
//  NewCardSaleViewController.swift
//  iosApp
//
//  Created by a.khrameev on 05.05.2022.
//

import UIKit
import EcmpMsdkCore
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
            pan: "5555555555554444",
            year: 2025,
            month: 1,
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
    
    override func onThreeDSecure(acsPage: AcsPage, isCascading: Bool, payment: Payment) {
        super.onThreeDSecure(acsPage: acsPage, isCascading: isCascading, payment: payment)
        
        coordinator.showAcs(acsPage: acsPage)
    }
    
}
