//
//  ErrorModel.swift
//  Fundall UI
//
//  Created by Aboyeji Tolulope on 25/06/2020.
//  Copyright © 2020 MAC. All rights reserved.
//

import Foundation

struct ErrorMessage: Codable {
    let error: Error
}

struct Error: Codable {
    let status, message: String
}
