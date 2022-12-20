//
//  CardPayoutViewController.swift
//  iosApp
//
//  Created by a.khrameev on 10.10.2022.
//

import UIKit
import MsdkCore
import SwiftSpinner
import Toaster

class CardPayoutViewController: PayBaseViewController {
    
    var coordinator: CardPayoutCoordinator!

    override func viewDidLoad() {
        super.viewDidLoad()
       
        AppDelegate.msdkSession?.getPayInteractor().execute(request: CardPayoutRequest(
            cvv: nil,
            pan: "5555555555554444",
            expiryDate: nil,
            cardHolder: nil,
            saveCard: false,
            senderFields: [SenderFieldValue(name: "pan", value: "5555555555554444"), SenderFieldValue(name: "first_name", value: "senderFirst")],
            paymentFields: [PaymentFieldValue(name: "purpose", value: "purpose")],
            customerFields: [CustomerFieldValue(name: "first_name", value: "first_name")],
            recipientInfo: RecipientInfo(
                walletOwner: nil,
                walletId: nil,
                country: nil,
                pan: nil,
                cardHolder: nil,
                address: nil,
                city: nil,
                stateCode: nil,
                firstName: "recipientFirst",
                lastName: nil)
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
    
}

