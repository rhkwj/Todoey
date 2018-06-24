//
//  ViewController.swift
//  Todoey
//
//  Created by Kim Yeon Jeong on 2018/6/18.
//  Copyright © 2018 Kim Yeon Jeong. All rights reserved.
//

import UIKit

class TodoListViewController: UITableViewController {

    var itemArray = [Item]()
    
    let defaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let newItem = Item()
        newItem.title = "Find Milk"
        itemArray.append(newItem)
        
        let newItem = Item()
        newItem.title = "Buy Eggos"
        itemArray.append(newItem2)
        
        let newItem = Item()
        newItem.title = "Bestroy Demogotgon"
        itemArray.append(newItem3)
        
        
        
        if let item = UserDefaults.standard.array(forKey: "itemArray?") as? [Item] {

            itemArray = items

        }

       
    }

   //MARK - TableView Datasource Methods
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "TodoItemCell", for: indexPath)
        
        let item = itemArray[indexPath.row]
        
        cell.text?.text = item.title
        
        //Ternary operator ==>
        //value = condition? valueIfTure : valueIfFalse
        
        cell.accessoryType = item.done == true ? . checkmark : .none
        
//        if item.done == true {
//            cell.ac cessoryType = .checkmark
//        } else {
//            cell.accessoryType= .none
//        }
        
        
        return cell
    }
    
    //MARK - TableView Delegate Methods
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //print(itemAttay[indexPath.row])
        
        itemArray[indexPath.row].done = !itemArray[indexPath.row].done
        
       
        
        tableView.reloadData()
        
        tableView.deselectRow(at: IndexPath, animated: true)
    }
 //MARK - Add New Items
    
    @IBAction func AddButtonPressed(_ sender: UIBarButtonItem) {
        
        var textFiled = UITextField()
        
        let alert = UIAlertController(title: "Add New Todoey Item.", message: "", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Add Item", style: .default) { (action) in
            //What will happen once the user clicks tne Add ITem button on our UIAlert
           
            let newItem = Item()
            newItem.title = textFiled.text!
            
            self.itemArray.append(newItem)
            
            self.defaults.set(self.itemArray, forKey: "TodoListArray")
                        
            self.tableView.reloadData()
            
        }
        
        alert.addTextField { (alertTextFild) in
            alertTextFild.placeholder = "Create new item"
            
        }
        
        alert.addAction(action)
        
        present(alert, animated: true, completion: nil)
        

        
    }
    
    
}

