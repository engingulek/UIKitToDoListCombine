//
//  ToDoView.swift
//  UIKitToDoListCombine
//
//  Created by engin gülek on 28.03.2023.
//

import Foundation
import UIKit
final class ToDoView : UIView {
     lazy var toDoListTableView : UITableView = {
        let tableView = UITableView()
        tableView.register(ToDoListTableViewCell.self, forCellReuseIdentifier: ToDoListTableViewCell.cellIdentifier)
        tableView.rowHeight = UIScreen.main.bounds.height / 12
        return tableView
    }()
    
     lazy var newToDoTitleTextField : UITextField = {
        let textField = UITextField()
        textField.textAlignment = .center
        textField.borderStyle = .roundedRect
        textField.placeholder = "Add New Todo Title"
        return textField
        
    }()
    
     lazy var newToDoSubtitleTextField : UITextField = {
        let textField = UITextField()
        textField.textAlignment = .center
        textField.borderStyle = .roundedRect
        textField.placeholder = "Add New Todo Subtitle"
        return textField
        
    }()
    
     lazy var addButton : UIButton = {
        let button = UIButton()
        button.backgroundColor = .red
        button.setTitleColor(.lightGray, for: .disabled)
        button.titleLabel?.textAlignment = .center
        button.setTitle("Add", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 15
        return button
    }()
    
    override init(frame: CGRect) {
            super.init(frame: frame)
        configureView()
            
        }
    
    private func configureView(){
        addSubview()
        viewConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension ToDoView {
    private func addSubview(){
        addSubview(toDoListTableView)
        addSubview(newToDoTitleTextField)
        addSubview(newToDoSubtitleTextField)
        addSubview(addButton)
        self.toDoListTableView.translatesAutoresizingMaskIntoConstraints = false
        self.newToDoTitleTextField.translatesAutoresizingMaskIntoConstraints = false
        self.newToDoSubtitleTextField.translatesAutoresizingMaskIntoConstraints = false
        self.addButton.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func viewConstraints() {
        NSLayoutConstraint.activate([
           
            newToDoTitleTextField.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor,constant: 30),
            newToDoTitleTextField.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor,constant: 15),
            newToDoTitleTextField.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor,constant: -15),
            newToDoTitleTextField.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor),
            
            newToDoSubtitleTextField.topAnchor.constraint(equalTo: newToDoTitleTextField.safeAreaLayoutGuide.bottomAnchor,constant: 10),
            newToDoSubtitleTextField.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor,constant: 15),
            newToDoSubtitleTextField.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor,constant: -15),
            newToDoSubtitleTextField.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor),
            
            addButton.topAnchor.constraint(equalTo: newToDoSubtitleTextField.safeAreaLayoutGuide.bottomAnchor,constant: 30),
            addButton.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor,constant: 15),
            addButton.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor,constant: -15),
            addButton.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor),
            
            toDoListTableView.topAnchor.constraint(equalTo: addButton.safeAreaLayoutGuide.bottomAnchor,constant: 20),
            toDoListTableView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            toDoListTableView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
            toDoListTableView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
            
        ])
    }
}
