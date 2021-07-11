//
//  LendViewModel.swift
//  Borrowlaend
//
//  Created by Emile Pedarros on 24/04/2021.
//

import Foundation

import RxSwift
import RxCocoa

final class LendViewModel : NSObject {
    
    private let disposeBag = DisposeBag()
    
    var loan = BehaviorRelay<[Loan]>(value: [])
    
    var loadData: Observable<[Loan]> {
          return Observable.deferred { [unowned self] in
             return Observable.just(CoreDataStack.getAllLoans(type: 1))
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
