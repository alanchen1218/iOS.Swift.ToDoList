//
//  AddViewControllerDelegate.swift
//  ToDo
//
//  Created by Alan Chen on 5/15/18.
//  Copyright © 2018 Alphie. All rights reserved.
//

import Foundation

protocol AddViewControllerDelegate: class {
    func addItem(by controller: AddViewController, with title: String, with desc: String, with date: Date)
}
