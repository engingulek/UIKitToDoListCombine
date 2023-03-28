//
//  ToDoListViewModel.swift
//  UIKitToDoListCombine
//
//  Created by engin gülek on 25.03.2023.
//

import Foundation
import Combine
protocol ToDoListViewModelProtocol {
    var toDoList : CurrentValueSubject<[ToDo],Never> {get}
    func addToDo(toDo:ToDo)
    func changeisCompleted(uuid:String)
}

class ToDoListViewModel : ToDoListViewModelProtocol {
    var toDoList = CurrentValueSubject<[ToDo], Never>([])
    
    func addToDo(toDo: ToDo) {
        var tempList = toDoList.value
        tempList.insert(toDo, at: 0)
        toDoList.send(tempList)
    }
    
    func changeisCompleted(uuid:String){
        var tempList = toDoList.value
       let index = tempList.indices.filter({tempList[$0].id == uuid})[0]
        var tempValue = tempList.filter({$0.id == uuid})[0]
        tempList.remove(at: index)
        tempValue.isCompleted.toggle()
        tempList.insert(tempValue, at: tempValue.isCompleted ? tempList.count : 0)
        toDoList.send(tempList)
        
    }
}
