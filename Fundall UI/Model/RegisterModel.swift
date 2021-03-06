//
//  RegisterModel.swift
//  Fundall UI
//
//  Created by Aboyeji Tolulope on 25/06/2020.
//  Copyright © 2020 MAC. All rights reserved.
//

import Foundation
struct RegisterModel: Codable {
    let success: Register
}

struct Register: Codable {
    let message, status: String
}
