//
//  StudentLocation.swift
//  On the map
//
//  Created by Bharani Nammi on 6/30/20.
//  Copyright © 2020 Bharani Nammi. All rights reserved.
//

import Foundation

struct StudentLocation: Codable {
    
    let results: [Result]
}

struct Result: Codable {
    let firstName, lastName: String
    let longitude, latitude: Double
    let mapString: String
    let mediaURL: String
    let uniqueKey, objectID, createdAt, updatedAt: String

    enum CodingKeys: String, CodingKey {
        case firstName, lastName, longitude, latitude, mapString, mediaURL, uniqueKey
        case objectID = "objectId"
        case createdAt, updatedAt
    }
}
