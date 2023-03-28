//
//  ViewController.swift
//  UIKitToDoListCombine
//
//  Created by engin gülek on 24.03.2023.
//
import Foundation
import UIKit
import Combine
class ToDoViewController: UIViewController {

    private let toDoView = ToDoView()
    private var cancellables = Set<AnyCancellable>()
    var toDoListViewModel = ToDoListViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()
        toDoView.toDoListTableView.delegate = self
        toDoView.toDoListTableView.dataSource = self
        
        toDoView.addButton.addTarget(self, action: #selector(addAlert), for: .touchUpInside)
        
        toDoListViewModel.toDoList.sink { _ in
            self.toDoView.toDoListTableView.reloadData()
        }.store(in: &cancellables)
        
        configure()
    }
    private func configure(){
        view = toDoView
    }
}

extension ToDoViewController {
    func alertMessage(title:String,message:String){
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default)
        alert.addAction(action)
        self.present(alert, animated: true, completion: nil)
    }
}

extension ToDoViewController {
    @objc func addAlert(){
        if !toDoView.newToDoTitleTextField.text!.isEmpty && !toDoView.newToDoSubtitleTextField.text!.isEmpty {
            toDoListViewModel.addToDo(toDo: ToDo(title: toDoView.newToDoTitleTextField.text!,
                                                 subtitle: toDoView.newToDoSubtitleTextField.text!))
        }else {
            alertMessage(title: "Error", message: "Emtp")
        }
    }
}


