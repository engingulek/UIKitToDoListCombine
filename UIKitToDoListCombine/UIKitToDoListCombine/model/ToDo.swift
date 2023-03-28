//
//  ToDo.swift
//  UIKitToDoListCombine
//
//  Created by engin gülek on 25.03.2023.
//

import Foundation

struct ToDo {
    var id = UUID().uuidString
    var title: String
    var subtitle : String
    var isCompleted : Bool = false
}
