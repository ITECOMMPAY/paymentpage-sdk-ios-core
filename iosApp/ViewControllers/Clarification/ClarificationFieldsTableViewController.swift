//
//  ClarificationFieldsTableViewController.swift
//  iosApp
//
//  Created by a.khrameev on 14.06.2022.
//

import UIKit
import MsdkCore

class ClarificationFieldsTableViewController: UITableViewController {
    
    var clarificationFields: [ClarificationField] = []
    var coordinator: ClarificationFieldsCoordinator!
    
    fileprivate var clarificationFieldValues: [String: String] = [:]
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        let applyButtonItem = UIBarButtonItem(title: "Apply", style: .done, target: self, action: #selector(applyFields))
        self.navigationItem.rightBarButtonItem = applyButtonItem

    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return clarificationFields.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "clarificationField", for: indexPath) as! ClarificationFieldTableViewCell
        let field = clarificationFields[indexPath.row]

        cell.title.text = field.defaultLabel ?? "--"
        cell.value.placeholder = field.defaultHint
        cell.value.tag = indexPath.row
        cell.value.delegate = self
        
        return cell
    }

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80.0
    }
    
    @objc func applyFields(){
        let fields = clarificationFieldValues.map({ (key, value) in
            ClarificationFieldValue.companion.fromNameWithValue(name: key, value: value)
        })
        
        AppDelegate.msdkSession?.getPayInteractor().sendClarificationFields(fields: fields)
        self.navigationController?.popViewController(animated: true)
    }
}

extension ClarificationFieldsTableViewController: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        guard let text = textField.text else {
            return true
        }
        
        let field = clarificationFields[textField.tag]
        let isValid = field.validator?.isValid(value: text) ?? true
        
        if (isValid) {
            clarificationFieldValues[field.name] = text
        } else {
            print("\(String(describing: field.defaultLabel)) \(field.defaultErrorMessage ?? "Invalid value")")
        }
            
        return true
           
    }
}

