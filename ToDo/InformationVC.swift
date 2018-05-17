//
//  InformationVC.swift
//  ToDo
//
//  Created by Alan Chen on 5/15/18.
//  Copyright © 2018 Alphie. All rights reserved.
//

import UIKit

class InformationVC: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
    var item: ToDoList!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        titleLabel.text = item.title
        descriptionLabel.text = item.desc
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMM d, h:mm a"
        
        let dateString = item.date
        let formatDate = dateFormatter.string(from: dateString!)
        
        dateLabel.text = formatDate
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}
