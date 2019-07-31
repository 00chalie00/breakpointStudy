//
//  LoginVC.swift
//  BreakPointStudy
//
//  Created by formathead on 09/07/2019.
//  Copyright © 2019 formathead. All rights reserved.
//

import UIKit

class LoginVC: UIViewController {

    @IBOutlet weak var emailField: InsetTextField!
    @IBOutlet weak var passwordField: InsetTextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        emailField.delegate = self
        passwordField.delegate = self
        
        tapGesture()
    }
    
    func tapGesture() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(tapped(gesture:)))
        view.addGestureRecognizer(tap)
    }
    
    @objc func tapped(gesture: UITapGestureRecognizer) {
        view.endEditing(true)
    }
    
    @IBAction func closeWaPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    
    @IBAction func signInBtnWasPressed(_ sender: Any) {
        if emailField.text != nil && passwordField.text != nil {
            AuthService.instance.loginUser(email: emailField.text!, password: passwordField.text!, completion: { (success, loginError) in
                if success {
                    self.dismiss(animated: true, completion: nil)
                } else {
                    print(String(describing: loginError?.localizedDescription))
                }
                
                AuthService.instance.registerUser(email: self.emailField.text!, password: self.passwordField.text!, completion: { (success, registrationError) in
                    if success {
                        AuthService.instance.loginUser(email: self.emailField.text!, password: self.passwordField.text!, completion: { (success, nil) in
                            self.dismiss(animated: true, completion: nil)
                            print("Successfully registered user")
                        })
                    } else {
                        print(String(describing: registrationError?.localizedDescription))
                    }
                })
            })
        }
    }
}//End Of The Class

extension LoginVC: UITextFieldDelegate {
    
}
