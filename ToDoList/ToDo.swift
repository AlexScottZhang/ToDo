//
//  ToDo.swift
//  ToDoList
//
//  Created by HhhotDog on 2018/5/8.
//  Copyright © 2018年 Alexscott. All rights reserved.
//

import Foundation

struct ToDo: Codable {
    var title: String
    var isComplete: Bool
    var dueDate: Date
    var notes: String?
    
    static let dueDateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        formatter.timeStyle = .short
        return formatter
    }()
    
    
    static var ArchiveUrl: URL {
        let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        return documentsDirectory.appendingPathComponent("todos").appendingPathExtension("plist")
    }
    
    static func loadToDos() -> [ToDo]? {
        guard let codedTodos = try? Data(contentsOf: ArchiveUrl) else {
            return nil
        }
        return try? PropertyListDecoder().decode(Array<ToDo>.self, from: codedTodos)
    }
    
    static func saveToDos(_ todos: [ToDo]) {
        let codedTodos = try? PropertyListEncoder().encode(todos)
        try? codedTodos?.write(to: ArchiveUrl, options: .noFileProtection)
    }
    
    static func loadSampleToDos() -> [ToDo] {
        let todo1 = ToDo(title: "ToDo One", isComplete: false,
                         dueDate: Date(), notes: "Notes 1")
        let todo2 = ToDo(title: "ToDo Two", isComplete: false,
                         dueDate: Date(), notes: "Notes 2")
        let todo3 = ToDo(title: "ToDo Three", isComplete: false,
                         dueDate: Date(), notes: "Notes 3")
        return [todo1, todo2, todo3]
    }
}
