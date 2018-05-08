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
    }
    var todos = [ToDo]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }


    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

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

}
















