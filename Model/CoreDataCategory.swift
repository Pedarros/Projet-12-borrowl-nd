//
//  CoreDataCategory.swift
//  Borrowlaend
//
//  Created by Emile Pedarros on 18/04/2021.
//

import Foundation


import CoreData

final class CoreDataCategory : NSManagedObject {
    
    
    static func getAllLoans() -> [Category] {
        let request: NSFetchRequest<CategoryEntity> = CategoryEntity.fetchRequest()
        guard let CategoryEntity = try? AppDelegate.viewContext.fetch(request) else {
            return []
        }
        var categories = [Category]()
        
        for borrow in CategoryEntity {
                let name = borrow.name
            let image = borrow.image
                let category = Category(name: name, image: image)
            categories.append(category)
           }
       
        return categories
    }
    
    
}
    
