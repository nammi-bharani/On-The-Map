//
//  StudentLocationResponse.swift
//  On the map
//
//  Created by Bharani Nammi on 7/1/20.
//  Copyright © 2020 Bharani Nammi. All rights reserved.
//

import Foundation

struct StudentLocationResponse: Codable {
    
    let createdAt, objectID: String

    enum CodingKeys: String, CodingKey {
        case createdAt
        case objectID = "objectId"
    }
}
