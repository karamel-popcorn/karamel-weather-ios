//
//  WeatherListDataManager.swift
//  Weather
//
//  Created by Baek on 4/25/24.
//

import Foundation
import CoreData

public struct WeatherSaveModel {
    let entityName: String
    let sampleData: [String: Any]
    
    public init(entityName: String, sampleData: [String: Any]) {
        self.entityName = entityName
        self.sampleData = sampleData
    }
}

class WeatherListDataManager {
    static let shared = WeatherListDataManager()
    
    private init() {}
    
    lazy var persistentContainer: NSPersistentContainer = {
            let container = NSPersistentContainer(name: "WeatherListModel")
            container.loadPersistentStores { storeDescription, error in
                if let error = error as NSError? {
                    print("Unresolved error: \(error)")
                }
            }
            return container
    }()
        
    var context: NSManagedObjectContext { return self.persistentContainer.viewContext }
    
    func saveContext() {
        if context.hasChanges {
            do {
                try context.save()
            } catch let error {
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
    
    func saveWeatherList(item: WeatherListItem) {
        let fetchRequest: NSFetchRequest<NSFetchRequestResult> = NSFetchRequest(entityName: "WeatherListEntity")
        fetchRequest.predicate = NSPredicate(format: "id = %@", item.id as CVarArg)
        
        let sampleModel = WeatherSaveModel(entityName: "WeatherListEntity",
                                    sampleData: [ "cityName": item.cityName,"cityNumber":       item.cityNumber,  "createdAt": item.createdAt,"id": item.id,
                                                  "latitude": item.latitude, "longitude": item.longitude] )
        save(model: sampleModel, request: fetchRequest)
    }
    
    func save(model: WeatherSaveModel, request: NSFetchRequest<NSFetchRequestResult>) {
        let context = persistentContainer.viewContext
        
        do {
            guard let object = try context.fetch(request).last as? NSManagedObject else {
                let entity = NSEntityDescription.insertNewObject(forEntityName: model.entityName, into: context)
                entity.setValuesForKeys(model.sampleData)
                saveContext()
                return
            }
            
            object.setValuesForKeys(model.sampleData)
        } catch {
            print(error.localizedDescription)
        }

        saveContext()
    }
    
    func deleteWeatherList(id: UUID) {
        let fetchRequest: NSFetchRequest<NSFetchRequestResult> = NSFetchRequest(entityName: "WeatherListEntity")
        fetchRequest.predicate = NSPredicate(format: "id = %@", id as CVarArg)
        delete(fetchRequest)
    }
    
    func delete(_ request: NSFetchRequest<NSFetchRequestResult>) {
        let context = persistentContainer.viewContext
        
        do {
            guard let objects = try context.fetch(request) as? [NSManagedObject] else { return }
            
            objects.forEach {
                context.delete($0)
                saveContext()
            }
            
        } catch {
            print(error.localizedDescription)
        }
        saveContext()
    }
    
    func fetchWeatherList() -> [WeatherListItem]? {
        guard let data = fetch(WeatherListEntity.fetchRequest()) else { return nil }
        
        var weatherItems = data.compactMap{
            WeatherListItem(id: $0.id ?? UUID(), cityNumber: Int($0.cityNumber), cityName: $0.cityName ?? "무명도시", createdAt: $0.createdAt, latitude: $0.latitude,
                            longitude: $0.longitude)
        }
        
        weatherItems.sort(by: { $0.createdAt < $1.createdAt})
        return weatherItems
    }
    
    public func fetch<T>(_ request: NSFetchRequest<T>) -> [T]? {
        do {
            let result = try persistentContainer.viewContext.fetch(request)
            return result
        } catch {
            print(error.localizedDescription)
        }
        return nil
    }
    
}
