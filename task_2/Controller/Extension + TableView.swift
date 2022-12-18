//
//  Extension + TableView.swift
//  task_2
//
//  Created by Artem Sulzhenko on 18.12.2022.
//

import UIKit

extension MainTableViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(
        _ tableView: UITableView,
        numberOfRowsInSection section: Int) -> Int {
            return list.count
        }
    
    func tableView(
        _ tableView: UITableView, cellForRowAt indexPath: IndexPath
    ) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(
            withIdentifier: "mainTableCell",
            for: indexPath
        ) as? MainTableCell {
            let element = list[indexPath.row]
            cell.iconImageView.image = UIImage(named: element.icon)
            cell.titleLabel.text = element.title
            cell.descriptionLabel.text = element.description
            return cell
        }
        fatalError("Could not dequeueReusableCell")
    }
    
    func tableView(_ tableView: UITableView,
                   moveRowAt sourceIndexPath: IndexPath,
                   to destinationIndexPath: IndexPath) {
        let currentList = list.remove(at: sourceIndexPath.row)
        list.insert(currentList, at: destinationIndexPath.row)
        tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView,
                   commit editingStyle: UITableViewCell.EditingStyle,
                   forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            list.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailsViewController = DetailsViewController()
        detailsViewController.detailElement = list[indexPath.row]
        
        let detailsNavigationController = UINavigationController(
            rootViewController: detailsViewController)
        detailsNavigationController.modalPresentationStyle = .fullScreen
        detailsNavigationController.navigationBar.backgroundColor = .white
        
        present(detailsNavigationController, animated: true)
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
}
