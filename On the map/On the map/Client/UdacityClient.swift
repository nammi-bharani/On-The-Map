//
//  UdacityClient.swift
//  On the map
//
//  Created by Bharani Nammi on 6/30/20.
//  Copyright © 2020 Bharani Nammi. All rights reserved.
//

import Foundation


class UdacityClient{
    
    struct Auth {
        //static var sessionId = 0
        static var key = ""
        static var sessionId = ""
    }
    
    
    enum Endpoints {
        static let base = "https://onthemap-api.udacity.com/v1/"
        
        case login
        
        var stringValue: String {
            switch self {
            
            case .login:
                return Endpoints.base + "session"
           
            }
        }
        
        var url: URL {
            return URL(string: stringValue)!
        }
    }
    
    class func taskForPOSTRequest<RequestType: Encodable, ResponseType: Decodable>(url: URL, responseType: ResponseType.Type, body: RequestType, completion: @escaping (ResponseType?, Error?) -> Void) {
           var request = URLRequest(url: url)
           request.httpMethod = "POST"
           request.httpBody = try! JSONEncoder().encode(body)
           request.addValue("application/json", forHTTPHeaderField: "Accept")
           request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        print(body.self)
           let task = URLSession.shared.dataTask(with: request) { data, response, error in
               guard let data = data else {
                   DispatchQueue.main.async {
                       completion(nil, error)
                   }
                   return
               }
               let decoder = JSONDecoder()
            print("reached decoder")
               do {
                print("Inide do")
                let range = (5..<data.count)
                let newData = data.subdata(in: range) /* subset response data! */
                print("----")
                print("")
                print("")
                print(String(data: newData, encoding: .utf8)!)
                print("")
                print("")
                print("----")
                   let responseObject = try decoder.decode(ResponseType.self, from: newData)
                print("Printing response object")
                print(responseObject.self)
                   DispatchQueue.main.async {
                       completion(responseObject, nil)
                   }
               }
                catch {
                    DispatchQueue.main.async {
                        print(error)
                        completion(nil, error)
                    }
               }
           }
           task.resume()
       }
    
    class func login(username: String, password: String, completion: @escaping (Bool, Error?) -> Void) {
        let udacityUsernamePassword = UdacityUsernamePassword(username: username, password: password)
        let body = LoginRequest(udacity: udacityUsernamePassword)
        taskForPOSTRequest(url: Endpoints.login.url, responseType: UdacityResponse.self, body: body) { response, error in
            if let response = response {
                Auth.key = response.account.key
                print(Auth.key)
                Auth.sessionId = response.session.id
                completion(true, nil)
            } else {
                
                completion(false, error)
            }
        }
    }

    
}
