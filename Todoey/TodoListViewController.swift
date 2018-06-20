//
//  ViewController.swift
//  Todoey
//
//  Created by Kim Yeon Jeong on 2018/6/18.
//  Copyright © 2018 Kim Yeon Jeong. All rights reserved.
//

import UIKit

class TodoListViewController: UITableViewController {

    let itemArray = ["Find milk", "Buy Egg","Destory Demogorgon"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
       
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

}

