//
//  MainTableViewController.swift
//  task_2
//
//  Created by Artem Sulzhenko on 12.12.2022.
//

import UIKit

class MainTableViewController: UIViewController {
    
    private var list = List.createList()
    
    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.separatorInset = .zero
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    private let tapBarView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let editButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .white
        button.setTitle("Edit", for: .normal)
        button.setTitleColor(.darkGray, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private var portraitConstraints: [NSLayoutConstraint] = []
    private var landscapeConstraints: [NSLayoutConstraint] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(tapBarView)
        view.addSubview(editButton)
        view.addSubview(tableView)
        
        tableView.register(HeaderCell.self, forCellReuseIdentifier: "cell")
        tableView.delegate = self
        tableView.dataSource = self
        
        editButton.addTarget(
            self, action: #selector(buttonTapped), for: .touchUpInside)
        
        portraitConstraints = [
            tapBarView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0),
            tapBarView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            tapBarView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            tapBarView.heightAnchor.constraint(equalToConstant: 80),
            
            editButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 40),
            editButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            editButton.heightAnchor.constraint(equalToConstant: 40),
            editButton.widthAnchor.constraint(equalToConstant: 50),
            
            tableView.topAnchor.constraint(equalTo: view.topAnchor, constant: 80),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0)
        ]
        
        landscapeConstraints = [
            tapBarView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0),
            tapBarView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            tapBarView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            tapBarView.heightAnchor.constraint(equalToConstant: 40),
            
            editButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 0),
            editButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            editButton.heightAnchor.constraint(equalToConstant: 40),
            editButton.widthAnchor.constraint(equalToConstant: 50),
            
            tableView.topAnchor.constraint(equalTo: view.topAnchor, constant: 40),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0)
        ]
        
        if UIScreen.main.bounds.width < UIScreen.main.bounds.height{
            NSLayoutConstraint.activate(portraitConstraints)
        } else {
            NSLayoutConstraint.activate(landscapeConstraints)
        }
    }
    
    override func willTransition(to newCollection: UITraitCollection, with coordinator: UIViewControllerTransitionCoordinator) {
        super.willTransition(to: newCollection, with: coordinator)
        
        coordinator.animate(alongsideTransition: { [unowned self] _ in
            let isPortrait = UIDevice.current.orientation.isPortrait
            if isPortrait {
                NSLayoutConstraint.deactivate(landscapeConstraints)
                NSLayoutConstraint.activate(portraitConstraints)
            } else {
                NSLayoutConstraint.deactivate(portraitConstraints)
                NSLayoutConstraint.activate(landscapeConstraints)
            }
        })
    }
    
    @objc func buttonTapped(){
        tableView.setEditing(!tableView.isEditing, animated: true)
        if tableView.isEditing{
            editButton.setTitle("Done", for: .normal)
        } else {
            editButton.setTitle("Edit", for: .normal)
        }
    }
    
}

extension MainTableViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? HeaderCell {
            
            let element = list[indexPath.row]
            cell.iconImageView.image = UIImage(named: element.icon)
            cell.titleLabel.text  =  element.title
            cell.descriptionLabel.text  =  element.description
            return cell
        }
        fatalError("Could not dequeueReusableCell")
    }
    
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let currentList = list.remove(at: sourceIndexPath.row)
        list.insert(currentList, at: destinationIndexPath.row)
        tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            list.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
}
