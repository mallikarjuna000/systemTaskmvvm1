//
//  TableViewCell.swift
//  systemTask1
//
//  Created by mallikarjuna Bakka on 25/12/19.
//  Copyright © 2019 mallikarjuna Bakka. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    
    //mvvm tableview cell
    
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var `switch`: UISwitch!
    
    @IBOutlet var artistImageView: UIImageView!
    @IBOutlet var dateLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
