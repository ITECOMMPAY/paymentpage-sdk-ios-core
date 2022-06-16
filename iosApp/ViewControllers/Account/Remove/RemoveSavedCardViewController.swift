//
//  RemoveSavedCardViewController.swift
//  iosApp
//
//  Created by a.khrameev on 05.05.2022.
//

import UIKit
import EcmpMsdkCore
import SwiftSpinner
import Toaster

class RemoveSavedCardViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        SwiftSpinner.useContainerView(view)
        SwiftSpinner.show("Removing card...")
        AppDelegate.msdkSession?.getCardRemoveInteractor().execute(request: CardRemoveRequest(id: 1), callback: self)
    }


}

extension RemoveSavedCardViewController: CardRemoveDelegate {
    
    func onError(code: ErrorCode, message: String) {
        SwiftSpinner.hide()
        Toast(text: "Error").show()
    }
    
    func onSuccess(result: Bool) {
        SwiftSpinner.hide()
        Toast(text: (result ? "Card removed" : "Card does not removed")).show()
    }
    
}

