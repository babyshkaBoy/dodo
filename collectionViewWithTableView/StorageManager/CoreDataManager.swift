//
//  CoreDataManager.swift
//  collectionViewWithTableView
//
//  Created by Азамат Баев on 27.11.2023.
//

import UIKit
import CoreData

//MARK: - CRUD

public final class CoreDataManager: NSObject {
    
    public static let shared = CoreDataManager()
    private override init() {}
    
    private var appDelegate: AppDelegate {
        UIApplication.shared.delegate as! AppDelegate
    }
    
    private var context: NSManagedObjectContext {
        appDelegate.persistantContainer.viewContext
    }
    public func createUser(_ address: String, fullname: String, phone: String) {
        guard let userEntityDescription = NSEntityDescription.entity(forEntityName: "User", in: context) else {
            return
        } // описание
        
        let user = User(entity: userEntityDescription, insertInto: context) // создали объект
        user.address = address //url
        user.fullname = fullname
        user.phone = phone // id
        
        appDelegate.saveContext() // сохраняем
    }
    public func fetchUsers() -> [User] {
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "User") //запрос к базе данных который получит все объекты с типом User
        do {
            return (try? context.fetch(fetchRequest) as? [User]) ?? []
        }
    }
    
    public func fetchUser(with phone: String) -> User? {
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "User")
        do {
            guard let users = try? context.fetch(fetchRequest) as? [User] else { return nil }
            return users.first(where: {$0.phone == phone})
        }
    }
    public func updateUser(with phone: String, newAddress: String, fullName: String) {
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "User") // запрос
        do {
            guard let users = try? context.fetch(fetchRequest) as? [User],
                  let user = users.first(where: { $0.phone == phone }) else { return } // поиск конкретного пользователя
            user.address = newAddress // новые данные
            user.fullname = fullName
        }
        appDelegate.saveContext() // сохранили
    }
    
    public func deleteUser() {
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "User")
        do {
            let users = try? context.fetch(fetchRequest) as? [User]
            users?.forEach { context.delete($0) }
        }
        appDelegate.saveContext()
    }
    
    public func deleteUser(with phone: String) {
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "User")
        do {
            guard let users = try? context.fetch(fetchRequest) as? [User],
                  let user = users.first(where: {$0.phone == phone }) else { return }
            context.delete(user)
        }
        appDelegate.saveContext()
    }
    
}


