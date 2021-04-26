//
//  AddViewModel.swift
//  Borrowlaend
//
//  Created by Emile Pedarros on 24/04/2021.
//

import Foundation
import RxSwift
import RxCocoa

final class AddViewModel : NSObject {
    
    private let disposeBag = DisposeBag()
    
    var objectModel = BehaviorRelay<[ObjectModel]>(value: [])
    var category = BehaviorRelay<[Category]>(value: [])
    
 override init() {
    
        
        
    }
}
