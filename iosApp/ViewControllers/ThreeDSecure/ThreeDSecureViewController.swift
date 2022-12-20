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

class ThreeDSecureViewController: UIViewController {
    
    var threeDSecurePage: ThreeDSecurePage!
    var coordinator: ThreeDSecureCoordinator!
    
    fileprivate var currentUrl: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let preferences = WKPreferences()
        let configuration = WKWebViewConfiguration()
        configuration.preferences = preferences
        let webView = WKWebView(frame: view.bounds, configuration: configuration)
        webView.navigationDelegate = self
        view.addSubview(webView)
        
        if let html = threeDSecurePage.content, let loadUrl = threeDSecurePage.loadUrl{
            SwiftSpinner.useContainerView(view)
            SwiftSpinner.show("Payment processing...")
            webView.loadHTMLString(html, baseURL: URL(string: loadUrl))
        }
    }
    

}

extension ThreeDSecureViewController: WKNavigationDelegate {
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        SwiftSpinner.hide()
        guard currentUrl != nil else {return}
        AppDelegate.msdkSession?.getPayInteractor().threeDSecureRedirectHandle(url: currentUrl!)
    
    }
    
    func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHandler: @escaping (WKNavigationActionPolicy) -> Void){
        let request = navigationAction.request
        currentUrl = request.url?.absoluteString
        
        decisionHandler(WKNavigationActionPolicy.allow)
    }
    
}
