//
//  SuggestAddress.swift
//  collectionViewWithTableView
//
//  Created by Азамат Баев on 17.12.2023.
//

import Foundation

struct SuggestAddress: Codable {
    var value, unrestrictedValue: String
    
    enum CodingKeys: String, CodingKey {
        case value
        case unrestrictedValue = "unrestricted_value"
    }
}

//typealias SuggestAddresResponse = [SuggestAddress]
struct SuggestAddresResponse: Codable {
    let suggestions: [SuggestAddress]
}
