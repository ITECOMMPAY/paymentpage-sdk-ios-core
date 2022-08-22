//
//  ApsViewController.swift
//  iosApp
//
//  Created by a.khrameev on 01.08.2022.
//

import UIKit
import MsdkCore
import SwiftSpinner
import Toaster
import WebKit

class ApsViewController: PayBaseViewController {
    

    var coordinator: ApsCoordinator!
    fileprivate var currentUrl: String?
    fileprivate var paymentUrl: String?
    fileprivate var apsMethod: PaymentMethod?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let preferences = WKPreferences()
        let configuration = WKWebViewConfiguration()
        configuration.preferences = preferences
        let webView = WKWebView(frame: view.bounds, configuration: configuration)
        webView.navigationDelegate = self
        view.addSubview(webView)
        
        apsMethod = AppDelegate.msdkSession?.getPaymentMethods()?.first(where: { method in
            method.code == "qiwi"
        })
        
        if let apsMethod = self.apsMethod {
            paymentUrl = apsMethod.paymentUrl
            if let url = paymentUrl {
                webView.load(URLRequest(url: URL(string: url)!))
            }
        }
       
    }
    

}

extension ApsViewController: WKNavigationDelegate {
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        SwiftSpinner.hide()
        
        if (currentUrl != paymentUrl) {
            if let apsMethod = self.apsMethod {
                AppDelegate.msdkSession?.getPayInteractor().execute(request: ApsSaleRequest(methodCode: apsMethod.code), callback: self)
            }
        }
        
    }
    
    func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHandler: @escaping (WKNavigationActionPolicy) -> Void){
        let request = navigationAction.request
        currentUrl = request.url?.absoluteString
        
        decisionHandler(WKNavigationActionPolicy.allow)
    }
    
}

