//
//  LoginProvider.swift
//  Fundall UI
//
//  Created by Aboyeji Tolulope on 25/06/2020.
//  Copyright © 2020 MAC. All rights reserved.
//

import Foundation



struct LoginPresenter {
    
    var delegate: LoginView?
    
    func performLogin(email: String, password: String) {
      
        if let loginUrl = URL(string: "https://campaign.fundall.io/api/v1/login") {
            
            var request = URLRequest(url: loginUrl)

                   
                   request.httpMethod = "POST"
                   request.setValue("application/json", forHTTPHeaderField: "Content-Type")
                   
                   let parameters = ["email": email,
                                     "password": password]
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
                        if let login = self.parseJSON(data) {
                            ProgressHUD.showSucceed()
                            self.delegate?.loginsWithSuccess(loginModel: login)
                            print(login)
                            
                        }
                        if let error = self.parseError(data) {
                            ProgressHUD.dismiss()
                            self.delegate?.loginsWithError(error: error)
                        }
                        
                           }
                                        
                                    
                     }
            task.resume()
        }
     
    }
    func parseJSON (_ loginData: Data) -> LoginModel? {
        
        let decoder = JSONDecoder()
               do{
                   let decodedData = try decoder.decode(LoginModel.self, from: loginData)
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


