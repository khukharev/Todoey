//
//  ViewController.swift
//  Todoey
//
//  Created by Stepan Khukharev on 06.07.2018.
//  Copyright © 2018 Stepan Khukharev. All rights reserved.
//

import UIKit

class TodoListViewController: UITableViewController {

    var itemArray = ["Test1", "Test2", "test3"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoItemCell", for: indexPath)
        
        cell.textLabel?.text = itemArray[indexPath.row]
        
        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        print(itemArray[indexPath.row])
        
        if tableView.cellForRow(at: indexPath)?.accessoryType == .checkmark {
            tableView.cellForRow(at: indexPath)?.accessoryType = .none
        } else {
            tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
        }
        
        tableView.deselectRow(at: indexPath, animated: true)
    
    }
    

    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
    
        var textFiled = UITextField()
        
        let alert = UIAlertController(title: "Add New Todoey Item", message: "", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Add Item", style: .default) { (action) in
            
            print("Success")
            
            self.itemArray.append(textFiled.text!)
            
            self.tableView.reloadData()
            
        }
        
        alert.addTextField{ (alertTextField) in
            alertTextField.placeholder = "Create new item"
            print(alertTextField)
            textFiled = alertTextField
        }
        
        alert.addAction(action)
        
        present(alert, animated: true, completion: nil)
        
    }
    
}

