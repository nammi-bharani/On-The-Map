//
//  LoginRequest.swift
//  On the map
//
//  Created by Bharani Nammi on 6/30/20.
//  Copyright © 2020 Bharani Nammi. All rights reserved.
//

import Foundation

struct LoginRequest: Encodable {
    
    let udacity: UdacityUsernamePassword
}
struct UdacityUsernamePassword: Encodable {
    
    let username: String
    let password: String
}
