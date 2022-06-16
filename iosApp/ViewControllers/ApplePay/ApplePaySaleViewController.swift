//
//  ApplePaySaleViewController.swift
//  iosApp
//
//  Created by a.khrameev on 26.05.2022.
//

import UIKit
import EcmpMsdkCore
import SwiftSpinner
import Toaster
import PassKit

class ApplePaySaleViewController: PayBaseViewController {
    
    var coordinator: ApplePayCoordinator!
    var completion: ((PKPaymentAuthorizationResult) -> Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let supportedPaymentNetworks = [PKPaymentNetwork.visa, PKPaymentNetwork.masterCard, PKPaymentNetwork.amex, PKPaymentNetwork.maestro]
        let paymentItem = PKPaymentSummaryItem(label: "MSDK Pay", amount: NSDecimalNumber(value:  Double(AppDelegate.msdkSession!.getPaymentInfo()!.paymentAmount) / 100.0))
        
        if PKPaymentAuthorizationViewController.canMakePayments(usingNetworks: supportedPaymentNetworks) {
            let request = PKPaymentRequest()
            request.currencyCode = AppDelegate.msdkSession!.getPaymentInfo()!.paymentCurrency
            request.countryCode = "RU"
            request.merchantIdentifier = "merchant.ecommpayDemo.sdk"
            request.merchantCapabilities = PKMerchantCapability.capability3DS
            request.supportedNetworks = supportedPaymentNetworks
            request.paymentSummaryItems = [paymentItem]
            
            guard let paymentVC = PKPaymentAuthorizationViewController(paymentRequest: request) else {
                return
            }
            paymentVC.delegate = self
            self.present(paymentVC, animated: true, completion: nil)
        }
    }
    
    override func onCustomerFields(customerFields: [CustomerField]) {
        super.onCustomerFields(customerFields: customerFields)
        
        self.completion?(PKPaymentAuthorizationResult(status: PKPaymentAuthorizationStatus.success, errors: nil))
        dismiss(animated: true)
        
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
    
    override func onPaymentCreated() {
        super.onPaymentCreated()
        self.completion?(PKPaymentAuthorizationResult(status: PKPaymentAuthorizationStatus.success, errors: nil))
        dismiss(animated: true)
    }
    
    override func onError(code: ErrorCode, message: String) {
        super.onError(code: code, message: message)
        self.completion?(PKPaymentAuthorizationResult(status: PKPaymentAuthorizationStatus.failure, errors: nil))
        dismiss(animated: true)
    }
    
}

extension ApplePaySaleViewController: PKPaymentAuthorizationViewControllerDelegate {
    func paymentAuthorizationViewControllerDidFinish(_ controller: PKPaymentAuthorizationViewController) {
        
    }
    
    func paymentAuthorizationViewController(_ controller: PKPaymentAuthorizationViewController, didAuthorizePayment payment: PKPayment, handler completion: @escaping (PKPaymentAuthorizationResult) -> Void) {
        self.completion = completion
        
        
        let token = String(decoding: payment.token.paymentData, as: UTF8.self)
        AppDelegate.msdkSession?.getPayInteractor().execute(request: ApplePaySaleRequest.init(token: token), callback: self)
    }
    
}
