//
//  WeatherListEntity+CoreDataProperties.swift
//  
//
//  Created by Baek on 6/3/24.
//
//

import Foundation
import CoreData


extension WeatherListEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<WeatherListEntity> {
        return NSFetchRequest<WeatherListEntity>(entityName: "WeatherListEntity")
    }

    @NSManaged public var id: UUID?
    @NSManaged public var createdAt: Double
    @NSManaged public var cityNumber: Int64
    @NSManaged public var cityName: String?
    @NSManaged public var latitude: Double
    @NSManaged public var longitude: Double

}

extension WeatherListEntity: Identifiable {

}
