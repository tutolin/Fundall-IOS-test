//
//  RegisterPresenter.swift
//  Fundall UI
//
//  Created by Aboyeji Tolulope on 25/06/2020.
//  Copyright © 2020 MAC. All rights reserved.
//

import Foundation


class RegisterPresenter {
    var delegate: RegisterView?
    func performRegister(firstname: String, lastname: String, email: String, password: String) {
      
        if let registerUrl = URL(string: "https://campaign.fundall.io/api/v1/register") {
            
            var request = URLRequest(url: registerUrl)

                   
                   request.httpMethod = "POST"
                   request.setValue("application/json", forHTTPHeaderField: "Content-Type")
                   
                   let parameters = [
                    "firstname": firstname,
                   "lastname": lastname,
                       "email": email,
                       "password": password,
                       "password_confirmation": password
]
                    guard let httpBody = try? JSONSerialization.data(withJSONObject: parameters, options: []) else {
                         return
                     }
                     request.httpBody = httpBody
                     request.timeoutInterval = 20
                     let session = URLSession(configuration: .default)
                     let task = session.dataTask(with: request) { (data, response, error) in
                         if error != nil {
                            self.delegate?.errorConnecting(error: error!)
                           
                           "check your internet connection".toastDisplay()
                            ProgressHUD.dismiss()
                           return
                         }
                       if let data = data {
                                           
                            print(data)
                        if let register = self.parseJSON(data) {
                           ProgressHUD.showSucceed()
                            self.delegate?.registerWithSuccess(registerModel: register)
                            print(register)
                            
                        }
                        if let error = self.parseError(data) {
                            ProgressHUD.dismiss()
                            self.delegate?.registerWithError(error: error)
                        }
                        
                           }
                                        
                                    
                     }
            task.resume()
        }
     
    }
    func parseJSON (_ loginData: Data) -> RegisterModel? {
        
        let decoder = JSONDecoder()
               do{
                   let decodedData = try decoder.decode(RegisterModel.self, from: loginData)
                   return decodedData
                   
               } catch {
                
                   return nil
               }
    }
    func parseError (_ errorData: Data) -> String? {
        
        let decoder = JSONDecoder()
               do{
                 let decodedData = try decoder.decode(ErrorModel.self, from: errorData)
                 return decodedData.error.message
                   
               } catch {
                
                   return nil
               }
    }
}
