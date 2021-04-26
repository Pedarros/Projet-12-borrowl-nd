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
            let id = borrow.id
            let object = ObjectModel(name: name, id : id)
            
            objects.append(object)
           }
       
        return objects
    }
    
    static func addObject(_ object: ObjectModel) {
    let objectEntity = ObjectEntity(context: AppDelegate.viewContext)
        objectEntity.name = object.name
        objectEntity.id = object.id
        
        saveContext()
    }
    
    static func getObjectById(_ id: Int64) -> ObjectModel {
        let request: NSFetchRequest<ObjectEntity> = ObjectEntity.fetchRequest()
        request.predicate = NSPredicate(format: "id == %@", id)
        let ObjectEntity = try? AppDelegate.viewContext.fetch(request)
        
        let objectsModel = ObjectModel(name: ObjectEntity?.first?.name, id: ObjectEntity?.first?.id ?? 0)
        
        return objectsModel
    }
    
    /// Delete RecipeEntity in Core Data. Use url in parameters to call the right data
    static func deleteBy(_ id: Int64) {
        let request: NSFetchRequest<ObjectEntity> = ObjectEntity.fetchRequest()
        request.predicate = NSPredicate(format: "id == %@", id)
        if let objectEntity = try? AppDelegate.viewContext.fetch(request) {
            for borrow in objectEntity {
                AppDelegate.viewContext.delete(borrow)
            }
        }
        saveContext()
    }
    
    
    
    static func saveContext() {
        try? AppDelegate.viewContext.save()
    }
}


    
