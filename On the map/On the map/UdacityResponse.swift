//
//  UdacityResponse.swift
//  On the map
//
//  Created by Bharani Nammi on 6/30/20.
//  Copyright © 2020 Bharani Nammi. All rights reserved.
//

import Foundation

struct UdacityResponse: Codable {
    let account: Account
    let session: Session
}


struct Account: Codable {
    
    let registered: Bool
    let key: String
}

