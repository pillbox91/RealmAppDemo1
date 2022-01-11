//
//  AlertController.swift
//  RealmAppDemo
//
//  Created by Андрей Аверьянов on 11.01.2022.
//

import UIKit

class AlertController: UIAlertController {
        
    func actionWithTaskList(completion: @escaping (String) -> Void) {
                
        let saveAction = UIAlertAction(title: "Save", style: .default) { _ in
            guard let newValue = self.textFields?.first?.text else { return }
            guard !newValue.isEmpty else { return }
            completion(newValue)
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .destructive)
        
        addAction(saveAction)
        addAction(cancelAction)
        addTextField { textField in
            textField.placeholder = "List Name"
        }
    }
    
    func actionWithTask(completion: @escaping (String, String) -> Void) {
                  
        let saveAction = UIAlertAction(title: "Save", style: .default) { _ in
            guard let newTask = self.textFields?.first?.text else { return }
            guard !newTask.isEmpty else { return }
            
            if let note = self.textFields?.last?.text, !note.isEmpty {
                completion(newTask, note)
            } else {
                completion(newTask, "")
            }
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .destructive)
        
        addAction(saveAction)
        addAction(cancelAction)
        
        addTextField { textField in
            textField.placeholder = "New task"
        }
        
        addTextField { textField in
            textField.placeholder = "Note"
        }
    }
}
