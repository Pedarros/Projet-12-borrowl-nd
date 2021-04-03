//
//  DummyData.swift
//  Borrowlaend
//
//  Created by Brahim on 31/03/2021.
//

final class DummyData {
    
    static func createData() -> [Loan] {
        let loan1 = Loan(firstName: "Brown", lastName: "TOTO", date: "20/04/2021")
        let loan2 = Loan(firstName: "Isak", lastName: "TITI", date: "20/04/2021")
        let loan3 = Loan(firstName: "Fernando", lastName: "TETE", date: "20/04/2021")
        return [loan1, loan2, loan3]
    }
    
}
