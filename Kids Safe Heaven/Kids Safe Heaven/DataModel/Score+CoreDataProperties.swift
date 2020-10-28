//
//  Score+CoreDataProperties.swift
//  Kids Safe Heaven
//
//  Created by Farhad Ullah Rezwan on 28/10/20.
//  Copyright © 2020 Farhad Ullah Rezwan. All rights reserved.
//
//

import Foundation
import CoreData


extension Score {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Score> {
        return NSFetchRequest<Score>(entityName: "Score")
    }

    @NSManaged public var quizType: String?
    @NSManaged public var score: Double
    @NSManaged public var user: User?

}

extension Score : Identifiable {

}
