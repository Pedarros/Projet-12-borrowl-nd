//
//  CoreDataStack.swift
//  Borrowlaend
//
//  Created by Emile on 31/03/2021.
//

import CoreData

final class CoreDataStack : NSManagedObject {
    
    static func retrieveData() -> [Loan] {
        
        let request: NSFetchRequest<BorrowlaendEntity> = BorrowlaendEntity.fetchRequest()
        guard let savingLoans = try? AppDelegate.viewContext.fetch(request) else {
            return []
        }
        var loan : [Loan]()
        for loans in savingLoans {
        if let date = date,
            let name = name
            let object = object
            let status = status
            
        }
        
        
        let loan1 = Loan(firstName: "Brown", lastName: "TOTO", date: "20/04/2021")
        let loan2 = Loan(firstName: "Isak", lastName: "TITI", date: "20/04/2021")
        let loan3 = Loan(firstName: "Fernando", lastName: "TETE", date: "20/04/2021")
        return [loan1, loan2, loan3]
    }
    static func addLoan(_ loan : Loan) {
        let saveLoans = BorrowlaendEntity(context : AppDelegate.viewContext)
        addLoan.date = date
        
        
    }
    
    
    static func saveContext() {
        try? AppDelegate.viewContext.save()
    }
}
