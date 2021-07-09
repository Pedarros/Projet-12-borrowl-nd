//
//  Loan.swift
//  Borrowlaend
//
//  Created by Emile Pedarros on 31/03/2021.
//

struct Loan: Codable, Equatable {
    static func == (lhs: Loan, rhs: Loan) -> Bool {
        return true
    }
    
    
    var id : Int64?
    var name : String?
    var date : String?
    var type : Int16?
    var myObject: ObjectModel?
    var status : Bool
    
}
