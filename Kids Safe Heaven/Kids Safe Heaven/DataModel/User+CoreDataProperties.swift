//
//  User+CoreDataProperties.swift
//  Kids Safe Heaven
//
//  Created by Farhad Ullah Rezwan on 28/10/20.
//  Copyright © 2020 Farhad Ullah Rezwan. All rights reserved.
//
//

import Foundation
import CoreData


extension User {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<User> {
        return NSFetchRequest<User>(entityName: "User")
    }

    @NSManaged public var avatarName: String?
    @NSManaged public var name: String?
    @NSManaged public var generalDone: Bool
    @NSManaged public var thingsDone: Bool
    @NSManaged public var roadSafetyDone: Bool
    @NSManaged public var scores: NSSet?

}

// MARK: Generated accessors for scores
extension User {

    @objc(addScoresObject:)
    @NSManaged public func addToScores(_ value: Score)

    @objc(removeScoresObject:)
    @NSManaged public func removeFromScores(_ value: Score)

    @objc(addScores:)
    @NSManaged public func addToScores(_ values: NSSet)

    @objc(removeScores:)
    @NSManaged public func removeFromScores(_ values: NSSet)

}

extension User : Identifiable {

}
