//
//  AddViewController.swift
//  ToDo
//
//  Created by Alan Chen on 5/15/18.
//  Copyright © 2018 Alphie. All rights reserved.
//

import UIKit

class AddViewController: UIViewController {

    weak var delegate: AddViewControllerDelegate?
    weak var note: ToDoList?
    
    @IBOutlet weak var titleText: UITextField!
    @IBOutlet weak var descriptionText: UITextField!
    @IBOutlet weak var dateInfo: UIDatePicker!
    
    @IBAction func addButtonPressed(_ sender: UIButton) {
        let title = titleText.text
        let desc = descriptionText.text
        let date = dateInfo.date
        delegate?.addItem(by: self, with: title!, with: desc!, with: date)
        print("2")
    }
    @IBAction func cancelButtonPressed(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let n = note {
            titleText.text = n.title
            descriptionText.text = n.desc
            dateInfo.date = n.date!
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}
