//
//  CoreDataTestCase.swift
//  BorrowlaendUITests
//
//  Created by Emile Pedarros on 02/06/2021.
//

import XCTest
@testable import Borrowlaend
import CoreData


class CoreDataTestCase: XCTestCase {
    
    
    var id : Int64?
    var nameObject : String?
    var date : String?
    var type : Int16?
    var myObject: ObjectModel?
    var status : Bool
 
    
    private let fakeLend = Loan(id : 1, name : "coat", date : 12/11/2020, type : 1, myObject : ObjectModel, status : true)
    
    // XCTestCase has two methods, setUp() and tearDown(), for setting up your test case before each run and cleaning up any test data afterwards. Since each test gets to start with a clean slate, these methods help make your tests isolated and repeatable.
    
    override func setUp() {
        CoreDataStack.deleteBy(fakeLend)
    }
    
    override func tearDown() {
        CoreDataStack.deleteBy(fakeLend)
    }
 
    
    // Test Functions
    
    
    func testGivenAddingLend_WhenAddButtonIsTapped_ThenLendMustBeCreated() {
        CoreDataStack.addLoan(fakeLend)
        XCTAssertTrue(CoreDataStack.getLoanById(id: 1))
    }
    func testGivenBorrowsCreatedAndRemoved_WhenAddBorrowedTestAndDeleteIt_ThenBorrowedTestShouldNotExist() {
        CoreDataStack.addLoad(fakeLend)
        XCTAssertTrue(CoreDataStack.getLoanById(id: 1))
        CoreDataStack.deleteBy(id : 1)
        XCTAssertFalse(CoreDataStack.getLoanById(id: 1))
    }
    
    func testGivenBorrows_WhenDeleteAllAndAddThreeBorrows_ThenBorrowsListReturnThreeWhenCount() {
        CoreDataStack.deleteAll()
        CoreDataStack.addLoad(fakeLend)
        CoreDataStack.addLoad(fakeLend)
        CoreDataStack.addLoad(fakeLend)
        XCTAssertEqual(CoreDataStack.getAllLoans().count, 3)
    }
    
    func testGivenBorrows_WhenDeleteAll_ThenBorrowsListReturnedIsEmpty() {
        CoreDataStack.addLoad(fakeLend)
        CoreDataStack.deleteAll()
        XCTAssertEqual(CoreDataStack.all().count, 0)
    }
}
