//
//  FinalViewController.swift
//  iosApp
//
//  Created by a.khrameev on 08.12.2022.
//

import UIKit
import MsdkCore
import SwiftSpinner
import Toaster
import WebKit

class FinalViewController: UIViewController {
    
    @IBOutlet weak var payment: UILabel!
    
    public var paymetnJson: String!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()        
        payment.text = paymetnJson
    }
}
