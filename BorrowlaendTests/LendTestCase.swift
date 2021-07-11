
//
//  CoreDataTestCase.swift
//  BorrowlaendUITests
//
//  Created by Emile Pedarros on 02/06/2021.
//

import XCTest
@testable import Borrowlaend
import CoreData


class LendTestCase: XCTestCase {
    
    
    var id : Int64?
    var nameObject : String?
    var date : String?
    var type : Int16?
    var myObject: ObjectModel?
    var category: CategoryObject?
    var fakeLend: Loan?
     
            
    
    // XCTestCase has two methods, setUp() and tearDown(), for setting up your test case before each run and cleaning up any test data afterwards. Since each test gets to start with a clean slate, these methods help make your tests isolated and repeatable.
    
    override func setUp() {
        category  = CategoryObject(name: "category1", image: "image")
        myObject = ObjectModel(name: "macbook", category: category!)
       fakeLend = Loan(id : 1, name : "coat", date : "12/11/2020", type : 1, myObject : myObject, status : true)
        
     
    }
    
    override func tearDown() {
        CoreDataStack.deleteBy(id: (fakeLend?.id)!)
    }
 
    
    // Test Functions
    
    
    func testGivenAddingLend_WhenAddButtonIsTapped_ThenLendMustBeCreated() {
        CoreDataStack.addLoan(fakeLend!)
       
        //
    }
    
    func testGivenBorrowsCreatedAndRemoved_WhenAddBorrowedTestAndDeleteIt_ThenBorrowedTestShouldNotExist() {
        CoreDataStack.addLoan(fakeLend!)
         XCTAssertEqual(CoreDataStack.getLoanById((fakeLend?.id)!), fakeLend)
        CoreDataStack.deleteBy(id: (fakeLend?.id)!)
        XCTAssertNil(CoreDataStack.getLoanById((fakeLend?.id)!))
    }
    
    func testGivenBorrows_WhenDeleteAllAndAddThreeBorrows_ThenBorrowsListReturnThreeWhenCount() {
        CoreDataStack.deleteAll()
        CoreDataStack.addLoan(fakeLend!)
        CoreDataStack.addLoan(fakeLend!)
        CoreDataStack.addLoan(fakeLend!)
        XCTAssertEqual(CoreDataStack.getAllLoans(type: 1).count, 3)
    }
    
    func testGivenBorrows_WhenDeleteAll_ThenBorrowsListReturnedIsEmpty() {
        CoreDataStack.addLoan(fakeLend!)
        CoreDataStack.deleteAll()
        XCTAssertEqual(CoreDataStack.getAllLoans(type: 1).count, 0)
    }
}
