//
//  RegisterView.swift
//  Fundall UI
//
//  Created by Aboyeji Tolulope on 25/06/2020.
//  Copyright © 2020 MAC. All rights reserved.
//

import Foundation

protocol RegisterView: class{
     func registerWithSuccess(registerModel: RegisterModel)
     func errorConnecting(error: Error)
     func registerWithError(error: String)
}
