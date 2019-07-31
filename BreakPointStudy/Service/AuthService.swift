//
//  AuthService.swift
//  BreakPointStudy
//
//  Created by formathead on 09/07/2019.
//  Copyright © 2019 formathead. All rights reserved.
//

import Foundation
import Firebase

class AuthService {
    static let instance = AuthService()
    
    func registerUser(email: String, password: String, completion: @escaping (_ success: Bool, _ error: Error?) -> ()) {
        Auth.auth().createUser(withEmail: email, password: password) { (result, error) in
            guard let user = result?.user else {
                completion(false, error)
                return
            }
            let userData = ["provider": user.providerID, "email": user.email]
            DataService.instance.createDBUser(uid: user.uid, userData: userData as Dictionary<String, Any>)
            completion(true, nil)
        }
    }
    
    func loginUser(email: String, password: String, completion: @escaping (_ success: Bool, _ error: Error?) -> ()) {
        Auth.auth().signIn(withEmail: email, password: password) { (result, error) in
            if error != nil {
                completion(false, error)
                return
            }
            completion(true, nil)
        }
    }
    
}//End Of The Class
