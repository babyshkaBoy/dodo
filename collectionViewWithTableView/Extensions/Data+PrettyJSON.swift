//
//  Data+PrettyJSON.swift
//  vk-nazar
//
//  Created by Artur Igberdin on 16.06.2022.
//

import Foundation


// Data -> бинарные данные -> двоичные данные -> 101010110011

extension Data {
    var prettyPrintedJSONString: NSString? { /// NSString gives us a nice sanitized debugDescription
        guard let object = try? JSONSerialization.jsonObject(with: self, options: []),
              let data = try? JSONSerialization.data(withJSONObject: object, options: [.prettyPrinted]),
              let prettyPrintedString = NSString(data: data, encoding: String.Encoding.utf8.rawValue) else { return nil }

        return prettyPrintedString
    }
}

