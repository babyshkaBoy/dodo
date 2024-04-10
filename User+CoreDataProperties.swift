//
//  User+CoreDataProperties.swift
//  collectionViewWithTableView
//
//  Created by Азамат Баев on 27.11.2023.
//
//

import Foundation
import CoreData



extension User {
//    @nonobjc public class func fetchRequest() -> NSFetchRequest<User> {
//        return NSFetchRequest<User>(entityName: "User")
//    }

    @NSManaged public var fullname: String?
    @NSManaged public var address: String?
    @NSManaged public var phone: String?

}

extension User : Identifiable {}
