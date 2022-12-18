//
//  MainTableViewController.swift
//  task_2
//
//  Created by Artem Sulzhenko on 12.12.2022.
//

import UIKit

final class MainTableViewController: UIViewController {
    
    var list = List.createList()
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.separatorInset = .zero
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    private lazy var tapBarView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    private lazy var editButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .white
        button.setTitle("Edit", for: .normal)
        button.setTitleColor(.darkGray, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        return button
    }()
    
    private var portraitConstraints: [NSLayoutConstraint] = []
    private var landscapeConstraints: [NSLayoutConstraint] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(tapBarView)
        view.addSubview(editButton)
        view.addSubview(tableView)
        
        tableView.register(MainTableCell.self,
                           forCellReuseIdentifier: "mainTableCell")
        tableView.delegate = self
        tableView.dataSource = self
        
        setConstraint()
        
        portraitConstraints = [
            tapBarView.heightAnchor.constraint(equalToConstant: 80),
            editButton.topAnchor.constraint(
                equalTo: tapBarView.topAnchor, constant: 40),
            editButton.trailingAnchor.constraint(
                equalTo: tapBarView.trailingAnchor, constant: -10),
        ]
        
        landscapeConstraints = [
            tapBarView.heightAnchor.constraint(equalToConstant: 40),
            editButton.topAnchor.constraint(
                equalTo: tapBarView.topAnchor, constant: 0),
            editButton.trailingAnchor.constraint(
                equalTo: tapBarView.trailingAnchor, constant: -30),
        ]
        
        if UIScreen.main.bounds.width < UIScreen.main.bounds.height{
            NSLayoutConstraint.activate(portraitConstraints)
        } else {
            NSLayoutConstraint.activate(landscapeConstraints)
        }
    }
    
    override func willTransition(
        to newCollection: UITraitCollection,
        with coordinator: UIViewControllerTransitionCoordinator) {
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
    
    private func setConstraint(){
        NSLayoutConstraint.activate([
            tapBarView.topAnchor.constraint(
                equalTo: view.topAnchor, constant: 0),
            tapBarView.leadingAnchor.constraint(
                equalTo: view.leadingAnchor, constant: 0),
            tapBarView.trailingAnchor.constraint(
                equalTo: view.trailingAnchor, constant: 0),
            
            editButton.heightAnchor.constraint(equalToConstant: 40),
            editButton.widthAnchor.constraint(equalToConstant: 50),
            
            tableView.topAnchor.constraint(
                equalTo: tapBarView.bottomAnchor, constant: 0),
            tableView.leadingAnchor.constraint(
                equalTo: view.leadingAnchor, constant: 0),
            tableView.trailingAnchor.constraint(
                equalTo: view.trailingAnchor, constant: 0),
            tableView.bottomAnchor.constraint(
                equalTo: view.bottomAnchor, constant: 0)
        ])
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
