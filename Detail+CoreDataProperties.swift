//
//  Detail+CoreDataProperties.swift
//  WeTravel
//
//  Created by GHTK on 2/8/24.
//
//

import Foundation
import CoreData


extension Detail {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Detail> {
        return NSFetchRequest<Detail>(entityName: "Detail")
    }

    @NSManaged public var name: String?
    @NSManaged public var image: String?
    @NSManaged public var detail: String?

}

extension Detail : Identifiable {

}
