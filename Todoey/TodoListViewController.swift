//
//  ViewController.swift
//  Todoey
//
//  Created by Kim Yeon Jeong on 2018/6/18.
//  Copyright © 2018 Kim Yeon Jeong. All rights reserved.
//

import UIKit

class TodoListViewController: UITableViewController {

    var itemArray = ["Find milk", "Buy Egg","Destory Demogorgon"]
    
    let defaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let item = UserDefaults.standard.array(forKey: "itemArray?") as? [String {
            
            itemArray = items
    
        }
        
       
    }

   //MARK - TableView Datasource Methods
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "TodoItemCell", for: indexPath)
        
        cell.text?.text = itemArray[intexPath.row]
        
        return cell
    }
    
    //MARK - TableView Delegate Methods
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //print(itemAttay[indexPath.row])
        
        if tableView.cellForRow(at: indexPath)?.accessoryType ==.checkmark {
            tableView.cellForRow(at: indexPath)?.accessoryType =.none
        } else {
            tableView.cellForRow(at: indexPath)?.accessoryType =.checkmark
        }
        
        
        tableView.deselectRow(at: IndexPath, animated: true)
    }
 //MARK - Add New Items
    
    @IBAction func AddButtonPressed(_ sender: UIBarButtonItem) {
        
        var textFiled = UITextField()
        
        let alert = UIAlertController(title: "Add New Todoey Item.", message: "", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Add Item", style: .default) { (action) in
            //What will happen once the user clicks tne Add ITem button on our UIAlert
           
            self.itemArray.append(textFiled.text!)
            
            defaults.set(self.itemArray, forKey: "TodoListArray")
            
            self.tableView.reloadData()
            
        }
        
        alert.addTextField { (alertTextFild) in
            alertTextFild.placeholder = "Create new item"
            
        }
        
        alert.addAction(action)
        
        present(alert, animated: true, completion: nil)
        

        
    }
    
    
}

