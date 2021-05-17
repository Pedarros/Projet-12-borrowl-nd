//
//  ObjectEntity+CoreDataProperties.swift
//  Borrowlaend
//
//  Created by Ahmed Dami on 08/05/2021.
//
//

import Foundation
import CoreData


extension ObjectEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<ObjectEntity> {
        return NSFetchRequest<ObjectEntity>(entityName: "ObjectEntity")
    }

    @NSManaged public var name: String?
    @NSManaged public var objectBrrow: NSSet?
    @NSManaged public var objectCategory: CategoryEntity?

}

// MARK: Generated accessors for objectBrrow
extension ObjectEntity {

    @objc(addObjectBrrowObject:)
    @NSManaged public func addToObjectBrrow(_ value: BorrowlaendEntity)

    @objc(removeObjectBrrowObject:)
    @NSManaged public func removeFromObjectBrrow(_ value: BorrowlaendEntity)

    @objc(addObjectBrrow:)
    @NSManaged public func addToObjectBrrow(_ values: NSSet)

    @objc(removeObjectBrrow:)
    @NSManaged public func removeFromObjectBrrow(_ values: NSSet)

}
