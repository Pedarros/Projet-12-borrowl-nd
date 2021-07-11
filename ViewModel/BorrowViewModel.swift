//
//  BorrowViewModel.swift
//  Borrowlaend
//
//  Created by Emile Pedarros on 27/03/2021.
//
import Foundation
import RxSwift
import RxCocoa

final class BorrowViewModel : NSObject {
    
    private let disposeBag = DisposeBag()
    
    var loan = BehaviorRelay<[Loan]>(value: [])
 
    var loadData: Observable<[Loan]> {
       return Observable.deferred { [unowned self] in
          return Observable.just(CoreDataStack.getAllLoans(type: 0))
       }.do(onNext: { [unowned self] data in
          self.loan.accept(data)
       })
    }
    
 override init() {
    
  }
    
    func deleteLoan(id: Int){
        CoreDataStack.deleteBy(id: Int64(id))
    }
    
   
}
