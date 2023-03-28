//
//  ToDoListTableViewCell.swift
//  UIKitToDoListCombine
//
//  Created by engin gülek on 24.03.2023.
//

import UIKit
import Combine

protocol ToDoListTableViewCellProtocol {
   func selectedCompleted(toDo:ToDo)
    
}

class ToDoListTableViewCell: UITableViewCell {
   static let cellIdentifier = "toDoCell"
    
     lazy var toDoTitleLabel : UILabel = {
       let label = UILabel()
       return label
    }()
    
     lazy var toDoSubtitleLabel : UILabel = {
        let label = UILabel()
        label.font = label.font.withSize(12)
        return label
    }()
    
     lazy var isCompletedButton : UIButton = {
        let button = UIButton()
        button.backgroundColor = .blue
        button.titleLabel?.textAlignment = .center
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 15
        button.titleLabel?.font = .systemFont(ofSize: 15.0, weight: .bold)
        return button
    }()
    
    var toDo : ToDo?
    var cellProtocol : ToDoListTableViewCellProtocol?
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func configureCell(toDo:ToDo) {
        toDoTitleLabel.text = toDo.title
        toDoTitleLabel.textColor = toDo.isCompleted ? .lightGray : .black
        toDoSubtitleLabel.text = toDo.subtitle
        toDoSubtitleLabel.textColor = toDo.isCompleted ? .lightGray : .black
        isCompletedButton.setTitle(toDo.isCompleted ? "Again" : "Completed", for: .normal)
    }
    
    @objc func completedButtonSelected() {
        cellProtocol!.selectedCompleted(toDo: toDo!)
    }
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        isCompletedButton.addTarget(self, action: #selector(completedButtonSelected), for: .touchUpInside)
        addSubview(toDoTitleLabel)
        addSubview(isCompletedButton)
        addSubview(toDoSubtitleLabel)
        toDoTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        isCompletedButton.translatesAutoresizingMaskIntoConstraints = false
        toDoSubtitleLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            toDoTitleLabel.topAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.topAnchor,constant: 10),
            toDoTitleLabel.leadingAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.leadingAnchor,constant: 20),
            toDoTitleLabel.trailingAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.trailingAnchor),
    
            
            toDoSubtitleLabel.topAnchor.constraint(equalTo: toDoTitleLabel.safeAreaLayoutGuide.topAnchor,constant: 25),
            toDoSubtitleLabel.leadingAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.leadingAnchor,constant: 20),
            toDoSubtitleLabel.trailingAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.trailingAnchor),
            toDoSubtitleLabel.bottomAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.bottomAnchor,constant: -5),
            
            isCompletedButton.topAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.topAnchor,constant: 10),
            isCompletedButton.trailingAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.trailingAnchor,constant: -20),
            isCompletedButton.centerYAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.centerYAnchor),
            isCompletedButton.bottomAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.bottomAnchor,constant: -10),
            isCompletedButton.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width / 4),
           
            
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

