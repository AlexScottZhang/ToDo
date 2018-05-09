//
//  ToDoTableViewCell.swift
//  ToDoList
//
//  Created by HhhotDog on 2018/5/9.
//  Copyright © 2018年 Alexscott. All rights reserved.
//

import UIKit

protocol ToDoCellDelegate {
    func checkmarkTapped(sender: ToDoTableViewCell)
}

class ToDoTableViewCell: UITableViewCell {
    @IBOutlet weak var isCompleteButton: UIButton!
    @IBOutlet weak var titleLabel: UILabel!
    
    var delegate: ToDoCellDelegate?
    
    @IBAction func completeButtonTapped(_ sender: UIButton) {
        delegate?.checkmarkTapped(sender: self)
    }
    
    func updateWith(_ toDo: ToDo) {
        isCompleteButton.isSelected = toDo.isComplete
        titleLabel.text = toDo.title
    }

}
