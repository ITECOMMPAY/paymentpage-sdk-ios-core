//
//  AcsViewController.swift
//  iosApp
//
//  Created by a.khrameev on 15.06.2022.
//

import UIKit
import MsdkCore
import SwiftSpinner
import Toaster
import WebKit

class AcsViewController: UIViewController {
    
    var acsPage: AcsPage!
    var coordinator: AcsCoordinator!
    
    fileprivate var currentUrl: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let preferences = WKPreferences()
        let configuration = WKWebViewConfiguration()
        configuration.preferences = preferences
        let webView = WKWebView(frame: view.bounds, configuration: configuration)
        webView.navigationDelegate = self
        view.addSubview(webView)
        
        if let html = acsPage.content, let acsUrl = acsPage.acs?.acsUrl {
            SwiftSpinner.useContainerView(view)
            SwiftSpinner.show("Payment processing...")
            webView.loadHTMLString(html, baseURL: URL(string: acsUrl))
        }
    }
    

}

extension AcsViewController: WKNavigationDelegate {
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        SwiftSpinner.hide()
        if  let termUrl = acsPage.acs?.termUrl {
            if (currentUrl == termUrl) {
                AppDelegate.msdkSession?.getPayInteractor().threeDSecureHandled()
                DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) { //need to wait until web page complete loading
                    self.navigationController?.popViewController(animated: true)
                }
            }
        }
    
    }
    
    func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHandler: @escaping (WKNavigationActionPolicy) -> Void){
        let request = navigationAction.request
        currentUrl = request.url?.absoluteString
        
        decisionHandler(WKNavigationActionPolicy.allow)
    }
    
}
