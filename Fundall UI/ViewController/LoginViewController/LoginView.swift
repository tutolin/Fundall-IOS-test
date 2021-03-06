//
//  LoginView.swift
//  Fundall UI
//
//  Created by Aboyeji Tolulope on 25/06/2020.
//  Copyright © 2020 MAC. All rights reserved.
//

import Foundation

protocol LoginView: class{
     func loginsWithSuccess(loginModel: LoginModel)
     func loginsWithError(error: String)
    func errorConnecting(error: Error)
}
