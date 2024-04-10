//
//  API.swift
//  collectionViewWithTableView
//
//  Created by Азамат Баев on 11.12.2023.
//

import Foundation

class DadataService {
    
    func getSuggestions(city: String, completion: @escaping (([SuggestAddress]) -> Void)){
        
//    https://suggestions.dadata.ru/suggestions/api/4_1/rs/suggest/address
        var urlComponents = URLComponents()
        urlComponents.scheme = "https"
        urlComponents.host = "suggestions.dadata.ru"
        urlComponents.path = "/suggestions/api/4_1/rs/suggest/address"
        
        let url = urlComponents.url!
        let token = "d0f61311a2351aef2a20e94b703826426696d945";
        let secret = "dee06aef6482e537851b48668d602d100cbe895a";
        let query = "\(city)";
        
        
        var request = URLRequest.init(url: url)
        request.httpMethod = "POST"
        request.allHTTPHeaderFields = ["Content-type": "application/json",
                                       "Authorization": "Token " + token,
                                       "X-Secret": secret]
        
        do {
            let bodyParams: [String: String] = ["query": query]
            let bodyData = try JSONSerialization.data(withJSONObject: bodyParams, options: .prettyPrinted)
            print(bodyData)
            
            request.httpBody = bodyData
        } catch {
            print(error)
        }
        
        let session = URLSession.init(configuration: .default)
        let decoder = JSONDecoder()
        
        let task = URLSession.shared.dataTask(with: request) { data , response , error in
            let bodyData2 = try? JSONSerialization.jsonObject(with: data!, options: [])

            print(response)
            guard let data else {return}
            do {
                
                let addressData = try decoder.decode(SuggestAddresResponse.self, from: data)
                print("Success")
                completion(addressData.suggestions)
                
            } catch {
                print(error)
            }
            
        }
        task.resume()
    }
    
}


//static let shared = API()

//    func getAddress(query: String, completion: @escaping (AddressResponse) -> Void) {
//        var urlComponents = URLComponents()
//        urlComponents.scheme = "https"
//        urlComponents.host = "cleaner.dadata.ru"
//        urlComponents.path = "/api/v1/clean/address"
//
//        let url = urlComponents.url!
//        let token = "d0f61311a2351aef2a20e94b703826426696d945";
//        let secret = "dee06aef6482e537851b48668d602d100cbe895a";
//
//
//        var request = URLRequest(url: url)
//        request.httpMethod = "POST"
//
//        request.allHTTPHeaderFields = ["Content-type": "application/json",
//                                       "Authorization": "Token " + token,
//                                       "X-Secret": secret]
//
//        do {
//            let bodyParams: [String] = [query]
//            let bodyData = try JSONSerialization.data(withJSONObject: bodyParams, options: .prettyPrinted)
//            print(bodyData)
//            request.httpBody = bodyData
//        } catch {
//            print(error)
//        }
//
//        let session = URLSession(configuration: .default)
//        let decoder = JSONDecoder()
//
//        let task = URLSession.shared.dataTask(with: request) { data, response, error in
//            print(response)
//            guard let data else { return }
//
//            print("->",data.prettyPrintedJSONString)
//
////            do {
////                let json = try JSONSerialization.data(withJSONObject: data, options: .prettyPrinted)
////                print(json)
////            } catch {
////                print(error)
////            }
//
//
//
//
//            do {
//                let addressResponse = try decoder.decode(AddressResponse.self, from: data)
//                print("Success")
//                completion(addressResponse)
//            } catch {
//                print(error)
//            }
//        }
//        task.resume()
//    }
