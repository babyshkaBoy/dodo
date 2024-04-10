//
//  AddressArchiver.swift
//  collectionViewWithTableView
//
//  Created by Азамат Баев on 20.12.2023.
//

import Foundation

protocol AddressArchiverProtocol {
    
    ///добавляем в хранилище адрес
    func append(_ address: SuggestAddress)
    /// сохраняем
    func save(_ addresses: [SuggestAddress])
    /// получаем массив
    func retrieve() -> [SuggestAddress]
}

final class AddressArchiver: AddressArchiverProtocol {
    private let encoder = JSONEncoder()
    private let decoder = JSONDecoder()
    private let userDefaults = UserDefaults.standard
    
    private let key = "SuggestAddress"
    
    func append(_ address: SuggestAddress) {

        var result: [SuggestAddress] = retrieve()
        

        result.insert(address, at: 0)
        
        save(result)
    }
    
    func save(_ address: [SuggestAddress]) {
        do {
            let data = try encoder.encode(address)
            userDefaults.set(data, forKey: key)
        } catch {
           print(error)
        }
    }
    
    func retrieve() -> [SuggestAddress] {
        guard let data = userDefaults.data(forKey: key) else { return [] }
        do {
            let array = try decoder.decode(Array<SuggestAddress>.self, from: data)
            return array
        } catch {
            print(error)
        }
        return []
    }
    
}
