//
//  ErrorModel.swift
//  Fundall UI
//
//  Created by Aboyeji Tolulope on 25/06/2020.
//  Copyright © 2020 MAC. All rights reserved.
//

import Foundation

struct ErrorModel: Codable {
    let error: ErrorMessage
}

struct ErrorMessage: Codable {
    let status, message: String
}
