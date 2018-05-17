//
//  ViewController.swift
//  ToDo
//
//  Created by Alan Chen on 5/15/18.
//  Copyright © 2018 Alphie. All rights reserved.
//

import UIKit
import CoreData

class TableViewController: UITableViewController, AddViewControllerDelegate {
    
    var items = [ToDoList]()
    let managedObjectContext = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.rowHeight = 65
        fetchAllItems()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyCell", for: indexPath) as! TableViewCell
        
        cell.titleLabel.text = items[indexPath.row].title!
        cell.descriptionLabel.text = items[indexPath.row].desc!
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM/dd/yyyy"
        
        let dateString = items[indexPath.row].date
        let formatDate = dateFormatter.string(from: dateString!)
        
        cell.dateLabel.text = formatDate

        return cell
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        let item = items[indexPath.row]
        managedObjectContext.delete(item)
        do{
            try managedObjectContext.save()
        } catch {
            print("\(error)")
        }
        items.remove(at: indexPath.row)
        tableView.reloadData()
    }
    
    override func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let updateAction = UIContextualAction(style: .normal, title: "Edit"){
            (ac: UIContextualAction, view: UIView, success: (Bool) -> Void) in
            self.performSegue(withIdentifier: "addItemSegue", sender: indexPath)
        }
        updateAction.backgroundColor = .blue
        return UISwipeActionsConfiguration(actions: [updateAction])
    }

    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "addItemSegue" {
            let addViewController = segue.destination as! AddViewController
            addViewController.delegate = self
            
            if let indexPath = sender as? IndexPath {
                let note = items[indexPath.row]
                addViewController.note = note
            }
            
        }
        else if segue.identifier == "ItemInfoSegue" {
            let dest = segue.destination as! InformationVC
            let indexPath = sender as! IndexPath
            dest.item = items[indexPath.row]
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "ItemInfoSegue", sender: indexPath)
    }
    
    func fetchAllItems(){
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "ToDoList")
        do {
            let result = try managedObjectContext.fetch(request)
            items = result as! [ToDoList]
        } catch {
            print("\(error)")
        }
    }
    
    func addItem(by controller: AddViewController, with title: String, with desc: String, with date: Date) {
        
        print("\(desc)")
        let item = NSEntityDescription.insertNewObject(forEntityName: "ToDoList", into: managedObjectContext) as! ToDoList
        item.title = title
        item.desc = desc
        item.date = date
        items.append(item)
        
        do {
            try managedObjectContext.save()
        } catch {
            print ("\(error)")
        }
        tableView.reloadData()
        dismiss(animated: true, completion: nil)
    }

}

