//
//  CoreDataStack.swift
//  Borrowlaend
//
//  Created by Emile on 31/03/2021.
//

import CoreData

final class CoreDataStack : NSManagedObject {
    
    static func getAllLoans() -> [Loan] {
        let request: NSFetchRequest<BorrowlaendEntity> = BorrowlaendEntity.fetchRequest()
        guard let borrowlaendEntity = try? AppDelegate.viewContext.fetch(request) else {
            return []
        }
        var loans = [Loan]()
        
        for borrow in borrowlaendEntity {
                let name = borrow.name
                let date = borrow.date
                let object = borrow.object
                let loan = Loan(name: name, date: date, object: object)
                loans.append(loan)
           }
       
        return loans
    }
    
    
    
    /// Save recipe in Core Data
    static func addLoan(_ loan: Loan, catory: Int64) {
        let borrowlaendEntity = BorrowlaendEntity(context: AppDelegate.viewContext)
        borrowlaendEntity.name = loan.name
        borrowlaendEntity.date = loan.date
        borrowlaendEntity.object = loan.object
        borrowlaendEntity.category = catory
        saveContext()
    }
    
    /// Check if data already exists in Core Data comparing url
    static func getLoanById(_ id: Int64) -> Loan {
        let request: NSFetchRequest<BorrowlaendEntity> = BorrowlaendEntity.fetchRequest()
        request.predicate = NSPredicate(format: "id == %@", id)
        let borrowlaendEntity = try? AppDelegate.viewContext.fetch(request)
        
        let loan = Loan(name: borrowlaendEntity?.first?.name, date: borrowlaendEntity?.first?.date, object: borrowlaendEntity?.first?.object)
        
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
    
    
    
    static func saveContext() {
        try? AppDelegate.viewContext.save()
    }
}
