//
//  AddViewModel.swift
//  Borrowlaend
//
//  Created by Emile Pedarros on 24/04/2021.
//

import Foundation

final class AddViewModel : NSObject {
 func addloan(loan: Loan){
    
    CoreDataStack.addLoan(loan)
 }
}
