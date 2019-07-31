//
//  AuthVC.swift
//  BreakPointStudy
//
//  Created by formathead on 09/07/2019.
//  Copyright © 2019 formathead. All rights reserved.
//

import UIKit
import Firebase

class AuthVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        if Auth.auth().currentUser != nil {
            dismiss(animated: true, completion: nil)
        }
   
    }
    
    @IBAction func facebookSignInBtnWasPressed(_ sender: Any) {
    }
    
    @IBAction func googleSignInBtnWasPressed(_ sender: Any) {
    }
    
    @IBAction func pressedWasEmail(_ sender: Any) {
        let loginVC = storyboard?.instantiateViewController(withIdentifier: "LoginVC")
        present(loginVC!, animated: true, completion: nil)
    }
    
}//End Of The Class

