//
//  Extension+ToDoViewController.swift
//  UIKitToDoListCombine
//
//  Created by engin gülek on 24.03.2023.
//

import Foundation
import UIKit

import Foundation
import UIKit

extension ToDoViewController : UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return toDoListViewModel.toDoList.value.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "toDoCell", for: indexPath) as! ToDoListTableViewCell
        cell.contentView.isUserInteractionEnabled = false
        let toDo = toDoListViewModel.toDoList.value[indexPath.row]
        cell.configureCell(toDo: toDo)
        cell.toDo = toDo
        cell.cellProtocol = self
        
        return cell
    }
}

extension ToDoViewController : ToDoListTableViewCellProtocol {
    func selectedCompleted(toDo:ToDo) {
        toDoListViewModel.changeisCompleted(uuid: toDo.id)
    }
}
