//
//  CoraDataObject.swift
//  Borrowlaend
//
//  Created by Emile Pedarros on 21/04/2021.
//
import Foundation


import CoreData

final class CoreDataObject : NSManagedObject {
    
    static func getAllObjects() -> [ObjectModel] {
        let request: NSFetchRequest<ObjectEntity> = ObjectEntity.fetchRequest()
        guard let ObjectEntity = try? AppDelegate.viewContext.fetch(request) else {
            return []
        }
        
        var objects = [ObjectModel]()
        
        for borrow in ObjectEntity {
            let name = borrow.name
            let categoryObject = CategoryObject(name: borrow.objectCategory?.name, image: borrow.objectCategory?.image)
            let object = ObjectModel(name: name, category: categoryObject)
            
            objects.append(object)
           }
       
        return objects
    }
    
    static func addObject(_ object: ObjectModel) {
    let objectEntity = ObjectEntity(context: AppDelegate.viewContext)
        objectEntity.name = object.name
        
        saveContext()
    }
 
    
    static func saveContext() {
        try? AppDelegate.viewContext.save()
    }
}


    
