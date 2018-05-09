//
//  ToDoTableViewController.swift
//  ToDoList
//
//  Created by HhhotDog on 2018/5/8.
//  Copyright © 2018年 Alexscott. All rights reserved.
//

import UIKit

class ToDoTableViewController: UITableViewController {
    // MARK: - Properties
    struct PropertyKeys {
        static let ToDoCellIdentifier = "ToDoCell"
        static let SaveToDoSegue = "saveUnwind"
        static let ShowDetailSegue = "showDetails"
    }
    var todos = [ToDo]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let savedTodos = ToDo.loadToDos() {
            todos = savedTodos
        } else {
            todos = ToDo.loadSampleToDos()
        }
        
        navigationItem.leftBarButtonItem = editButtonItem
    }
    
    @IBAction func unwindToToDoList(segue: UIStoryboardSegue) {
        guard segue.identifier == PropertyKeys.SaveToDoSegue,
            let sourceVC = segue.source as? ToDoViewTableViewController,
            let toDo = sourceVC.toDo else {return}
        
        if let indexPath = tableView.indexPathForSelectedRow {
            todos[indexPath.row] = toDo
            tableView.reloadRows(at: [indexPath], with: .automatic)
        } else {
            let newIndexPath = IndexPath(row: todos.count, section: 0)
            todos.append(toDo)
            tableView.insertRows(at: [newIndexPath], with: .automatic)
            
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == PropertyKeys.ShowDetailSegue {
            let destinationVC = segue.destination as! ToDoViewTableViewController
            
            let indexPath = tableView.indexPathForSelectedRow!
            let toDo = todos[indexPath.row]
            destinationVC.toDo = toDo
        }
    }
    
    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return todos.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: PropertyKeys.ToDoCellIdentifier) else {
            fatalError("无法找到cell")
        }
        let todo = todos[indexPath.row]
        cell.textLabel?.text = todo.title
        return cell
    }
    
    // MARK: - Table View delegate
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            todos.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }

}
















