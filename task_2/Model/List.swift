//
//  List.swift
//  task_2
//
//  Created by Artem Sulzhenko on 12.12.2022.
//

import UIKit

struct List {
    
    let icon: String
    let title: String
    let description: String
    
    static func createList() -> [List] {
        var list: [List] = []
        let sizeList = 999
        var indexIcon = 0
        
        let icon = DataManager.shared.icons
        let title = DataManager.shared.title
        let description = DataManager.shared.description
        
        for index in 0...sizeList {
            let element = List(icon: icon[indexIcon],
                               title: title + "\(index)",
                               description: description + "\(index)")
            list.append(element)
            
            if indexIcon < 9{
                indexIcon += 1
            } else {
                indexIcon = 0
            }   
        }
        return list
    }
    
}
