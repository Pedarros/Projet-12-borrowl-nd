//
//  BorrowlaendEntity+CoreDataProperties.swift
//  Borrowlaend
//
//  Created by Ahmed Dami on 08/05/2021.
//
//

import Foundation
import CoreData


extension BorrowlaendEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<BorrowlaendEntity> {
        return NSFetchRequest<BorrowlaendEntity>(entityName: "BorrowlaendEntity")
    }

    @NSManaged public var date: String?
    @NSManaged public var id: Int64
    @NSManaged public var name: String?
    @NSManaged public var status: Bool
    @NSManaged public var type: Int16
    @NSManaged public var borrowCategory: ObjectEntity?

}
