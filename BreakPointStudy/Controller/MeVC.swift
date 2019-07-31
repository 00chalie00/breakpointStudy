//
//  MeVC.swift
//  BreakPointStudy
//
//  Created by formathead on 26/07/2019.
//  Copyright © 2019 formathead. All rights reserved.
//

import UIKit
import Firebase

class MeVC: UIViewController {

    @IBOutlet weak var profileImg: UIImageView!
    @IBOutlet weak var emailLbl: UILabel!
    @IBOutlet weak var tableVIew: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.emailLbl.text = Auth.auth().currentUser?.email
    }
    
    @IBAction func signOutBtnWasPressed(_ sender: Any) {
        do {
            try Auth.auth().signOut()
            let authVC = self.storyboard?.instantiateViewController(withIdentifier: "AuthVC") as? AuthVC
            self.present(authVC!, animated: true, completion: nil)
        } catch {
            print(error)
        }
    }
    
}
