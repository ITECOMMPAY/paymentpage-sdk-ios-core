//
//  ClarificationFieldTableViewCell.swift
//  iosApp
//
//  Created by a.khrameev on 14.06.2022.
//

import UIKit

class ClarificationFieldTableViewCell: UITableViewCell {
    
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var value: UITextField!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
