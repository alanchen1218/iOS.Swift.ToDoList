//
//  TableViewCell.swift
//  ToDo
//
//  Created by Alan Chen on 5/15/18.
//  Copyright © 2018 Alphie. All rights reserved.
//

import Foundation
import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
