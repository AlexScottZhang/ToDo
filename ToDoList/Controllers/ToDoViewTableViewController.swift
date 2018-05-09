//
//  ToDoViewTableViewController.swift
//  ToDoList
//
//  Created by HhhotDog on 2018/5/9.
//  Copyright © 2018年 Alexscott. All rights reserved.
//

import UIKit

class ToDoViewTableViewController: UITableViewController {
    // MARK: - Outlets
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var isCompleteButton: UIButton!
    @IBOutlet weak var dueDateLabel: UILabel!
    @IBOutlet weak var dueDatePikcer: UIDatePicker!
    @IBOutlet weak var notesTextView: UITextView!
    
    @IBOutlet weak var saveButton: UIBarButtonItem!
    
    // MARK: - Properties
    var isDatePickerHidden = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 截止日期预设为1天之后
        dueDatePikcer.date = Date().addingTimeInterval(86400)
        
        updateDueDateLabel(date: dueDatePikcer.date)
        updateSaveButtonState()
    }
    
    // MARK: - Actions
    @IBAction func textEditingChanged(_ sender: UITextField) {
        updateSaveButtonState()
    }
    
    @IBAction func returnPressed(_ sender: UITextField) {
        titleTextField.resignFirstResponder()
    }
    
    @IBAction func isCompleteButtonTapped(_ sender: UIButton) {
        isCompleteButton.isSelected = !isCompleteButton.isSelected
    }
    
    @IBAction func datePickerChanged(_ sender: UIDatePicker) {
        updateDueDateLabel(date: dueDatePikcer.date)
    }
    
    // MARK: - Utilities
    func updateSaveButtonState() {
        let text = titleTextField.text ?? ""
        saveButton.isEnabled = !text.isEmpty
    }
    
    func updateDueDateLabel(date: Date) {
        dueDateLabel.text = ToDo.dueDateFormatter.string(from: date)
    }
    
    // MARK: - Table View Delegate
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let normalCellHeight = CGFloat(44)
        let largeCellHeight = CGFloat(200)
        
        switch indexPath {
        case [1,0]: // Due date cell
            return isDatePickerHidden ? normalCellHeight : largeCellHeight
        case [2,0]: // Notes cell
            return largeCellHeight
        default:
            return normalCellHeight
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        switch indexPath {
        case [1,0]: // Due date cell
            isDatePickerHidden = !isDatePickerHidden
            
            dueDateLabel.textColor = isDatePickerHidden ? .black : tableView.tintColor
            
            tableView.beginUpdates()
            tableView.endUpdates()
        default:
            break
        }
    }
}


















