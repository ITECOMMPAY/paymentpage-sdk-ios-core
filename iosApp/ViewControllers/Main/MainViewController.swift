//
//  ViewController.swift
//  iosApp
//
//  Created by a.khrameev on 05.05.2022.
//

import UIKit
import MsdkCore
import SwiftSpinner
import Toaster

class MainViewController: UIViewController {
    
    @IBOutlet weak var paymentReceivedButton: UIButton!
    @IBOutlet weak var removeSavedCardButton: UIButton!
    @IBOutlet weak var newCardButton: UIButton!
    @IBOutlet weak var savedCardButton: UIButton!
    @IBOutlet weak var applePayButton: UIButton!
    
    var coordinator: MainCoordinator!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let secretKey = Bundle.main.object(forInfoDictionaryKey: "PROJECT_SECRET_KEY") as! String
        let projectId = Bundle.main.object(forInfoDictionaryKey: "PROJECT_ID") as! Int32
        
        let paymentInfo = PaymentInfo.companion.create(projectId: projectId, paymentId: Utils.getRandomPaymentNumber(), paymentAmount: 1031, paymentCurrency: "USD")
        //set customer id if needed
        paymentInfo.customerId = "12"
        //set token if need create sale with token
        //paymentInfo.token = "TOKEN"
        
        //calculate signature
        paymentInfo.signature = Utils.signature(paramsToSign: paymentInfo.getParamsForSignature(), secret: secretKey)
   

        SwiftSpinner.useContainerView(view)
        SwiftSpinner.show("Loading...")
        
        
        AppDelegate.msdkSession?.getInitInteractor().execute(
            request: InitRequest(
                paymentInfo: paymentInfo,
                recurrentInfo: nil,
                threeDSecureInfo: nil
            ),
            callback: self
        )
        
        //if need cancel interactor
        //AppDelegate.msdkSession?.getInitInteractor().cancel()
    }
    
    @IBAction func onCardRemoveClick(_ sender: Any) {
        coordinator.showCardRemoveViewController()
    }
    
    @IBAction func onCardSaleClick(_ sender: Any) {
        coordinator.showCardViewController()
    }
    
    @IBAction func onSavedCardSaleClick(_ sender: Any) {
        coordinator.showSavedCardViewController(savedAccount: AppDelegate.msdkSession!.getSavedAccounts()!.first!)
    }
    
    @IBAction func onApplePayClick(_ sender: Any) {
        coordinator.showApplePay()
    }
    
    @IBAction func onPaymentRestoreClick(_ sender: Any) {
        coordinator.showRestorePaymentController()
    }
    
}

extension MainViewController: InitDelegate {
    
    func onError(code: ErrorCode, message: String) {
        SwiftSpinner.hide()
        Toast(text: "Error").show()        
    }
    
    //received init data
    func onInitReceived(paymentMethods: [PaymentMethod], savedAccounts: [SavedAccount]) {
        SwiftSpinner.hide()
        Toast(text: "Init Success").show()
        
        //get string resource manager for server side strings
        let stringResourceManager = AppDelegate.msdkSession?.getStringResourceManager()
        //for example get methods list title string override
        let title = stringResourceManager?.getStringByKey(key: "title_payment_methods")
        print(title ?? "not found")
        
        //get icons resource manager
        let secureLogoResourceManager = AppDelegate.msdkSession?.getSecureLogoResourceManager()
        //get all logo keys
        let keys = secureLogoResourceManager?.allKeys
        print(keys ?? "not found")
        //get specific logo
        let visaIconUrl = secureLogoResourceManager?.getLogoUrl(key: "visa")
        print(visaIconUrl ?? "not found")
        
        removeSavedCardButton.isEnabled = true
        newCardButton.isEnabled = true
        savedCardButton.isEnabled = true
        applePayButton.isEnabled = true
    }
    
    //received already created payment from init
    func onPaymentRestored(payment: Payment) {
        SwiftSpinner.hide()
        Toast(text: "Payment received").show()
        
        paymentReceivedButton.isEnabled = true
        removeSavedCardButton.isEnabled = false
        newCardButton.isEnabled = false
        savedCardButton.isEnabled = false
        applePayButton.isEnabled = false
    }    
    
}

