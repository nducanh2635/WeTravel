//
//  PlaceDetail+CoreDataProperties.swift
//  WeTravel
//
//  Created by GHTK on 2/8/24.
//
//

import Foundation
import CoreData


extension PlaceDetail {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<PlaceDetail> {
        return NSFetchRequest<PlaceDetail>(entityName: "PlaceDetail")
    }

    @NSManaged public var name: String?
    @NSManaged public var image: String?
    @NSManaged public var detail: String?

}

extension PlaceDetail : Identifiable {

}
