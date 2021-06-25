//
//  CoreDataStack.swift
//  Borrowlaend
//
//  Created by Emile on 31/03/2021.
//

import CoreData

final class CoreDataStack : NSManagedObject {
    
    static func getAllLoans(type: Int16) -> [Loan] {
        let request: NSFetchRequest<BorrowlaendEntity> = BorrowlaendEntity.fetchRequest()
       // request.predicate = NSPredicate(format: "type == @", type)
        guard let borrowlaendEntity = try? AppDelegate.viewContext.fetch(request) else {
            return []
        }
        var loans = [Loan]()

        for borrow in borrowlaendEntity {
            
        let name = borrow.name
        let date = borrow.date
        let id = borrow.id
        let type = borrow.type
        let status = borrow.status
            
        
            
        let objectName = borrow.borrowCategory?.name
            
                let categoryName = borrow.borrowCategory?.objectCategory?.name
                let image = borrow.borrowCategory?.objectCategory?.image
            
            let categoryObject = Category(name: categoryName, image: image)
            
            let objectModel = ObjectModel(name: objectName, category: categoryObject)
            
            let loan = Loan(id: id, name: name, date: date, type: type, myObject: objectModel, status: status)
            
                loans.append(loan)
           }
       
        return loans
    }
    
    /// Save recipe in Core Data
    static func addLoan(_ loan: Loan) {
        
        let categoryEntity = CategoryEntity(context: AppDelegate.viewContext)
        categoryEntity.name = loan.myObject?.category.name
        categoryEntity.name = loan.myObject?.category.image
        saveContext()
        
        let objectEntity = ObjectEntity(context: AppDelegate.viewContext)
        objectEntity.name = loan.myObject?.name
        objectEntity.objectCategory = categoryEntity
        saveContext()
        
        let borrowlaendEntity = BorrowlaendEntity(context: AppDelegate.viewContext)
        borrowlaendEntity.name = loan.name
        borrowlaendEntity.date = loan.date
        borrowlaendEntity.id = loan.id!
        borrowlaendEntity.type = loan.type!
        borrowlaendEntity.status = loan.status
        
        borrowlaendEntity.borrowCategory = objectEntity
        
        saveContext()
    }
    
    /// Check if data already exists in Core Data comparing url
    static func getLoanById(_ id: Int64) -> Loan {
        let request: NSFetchRequest<BorrowlaendEntity> = BorrowlaendEntity.fetchRequest()
        request.predicate = NSPredicate(format: "id == %@", id)
        let borrowlaendEntity = try? AppDelegate.viewContext.fetch(request)
        
        let objectName = borrowlaendEntity?.first?.borrowCategory?.name
        let categoryName =  borrowlaendEntity?.first?.borrowCategory?.objectCategory?.name
        let image = borrowlaendEntity?.first?.borrowCategory?.objectCategory?.image
        
        let categoryObject = Category(name: categoryName, image: image)
        let objectModel = ObjectModel(name: objectName, category: categoryObject)
        
        let loan = Loan(id: borrowlaendEntity?.first?.id, name: borrowlaendEntity?.first?.name, date: borrowlaendEntity?.first?.date, type: borrowlaendEntity?.first?.type, myObject: objectModel, status: (borrowlaendEntity?.first!.status)!)
        
        return loan
    }
    
    /// Delete RecipeEntity in Core Data. Use url in parameters to call the right data
    static func deleteBy(_ id: Int64) {
        let request: NSFetchRequest<BorrowlaendEntity> = BorrowlaendEntity.fetchRequest()
        request.predicate = NSPredicate(format: "id == %@", id)
        if let borrowlaendEntity = try? AppDelegate.viewContext.fetch(request) {
            for borrow in borrowlaendEntity {
                AppDelegate.viewContext.delete(borrow)
            }
        }
        saveContext()
    }
    
    static func deleteAll() {
        let request: NSFetchRequest<BorrowlaendEntity> = BorrowlaendEntity.fetchRequest()
        request.predicate = NSPredicate(value: true)
        if let borrowlaendEntity = try? AppDelegate.viewContext.fetch(request) {
            for borrow in borrowlaendEntity {
                AppDelegate.viewContext.delete(borrow)
            }
        }
        saveContext()
    }
    
    
    static func saveContext() {
        try? AppDelegate.viewContext.save()
    }
}
