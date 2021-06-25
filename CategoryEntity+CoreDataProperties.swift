//
//  CategoryEntity+CoreDataProperties.swift
//  Borrowlaend
//
//  Created by Emile Pedarros on 11/04/2021.
//
//

import Foundation
import CoreData


extension CategoryEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CategoryEntity> {
        return NSFetchRequest<CategoryEntity>(entityName: "CategoryEntity")
    }

    @NSManaged public var image: String?
    @NSManaged public var name: String?
    @NSManaged public var categryObject: NSSet?

}

// MARK: Generated accessors for categryObject
extension CategoryEntity {

    @objc(addCategryObjectObject:)
    @NSManaged public func addToCategryObject(_ value: ObjectEntity)

    @objc(removeCategryObjectObject:)
    @NSManaged public func removeFromCategryObject(_ value: ObjectEntity)

    @objc(addCategryObject:)
    @NSManaged public func addToCategryObject(_ values: NSSet)

    @objc(removeCategryObject:)
    @NSManaged public func removeFromCategryObject(_ values: NSSet)

}
