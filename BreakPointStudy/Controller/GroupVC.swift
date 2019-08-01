//
//  GroupVC.swift
//  BreakPointStudy
//
//  Created by formathead on 31/07/2019.
//  Copyright © 2019 formathead. All rights reserved.
//

import UIKit

class GroupVC: UIViewController {

    
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var descTextField: UITextField!
    @IBOutlet weak var emailSearchTextField: UITextField!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var groupMemberLbl: UIStackView!
    @IBOutlet weak var doneBtn: UIButton!
    
    var emailArray = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        emailSearchTextField.delegate = self
        emailSearchTextField.addTarget(self, action: #selector(textFieldDidchange), for: .editingChanged)
    }
    
    @IBAction func closeBtnWasPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
        
    }
    
    @IBAction func doneBtnWasPressed(_ sender: Any) {
        
    }
    
    @objc func textFieldDidchange() {
        if emailSearchTextField.text == "" {
            emailArray = []
            tableView.reloadData()
        } else {
            DataService.instance.getEmail(quary: emailSearchTextField.text!) { (returnedEmail) in
                self.emailArray = returnedEmail
                self.tableView.reloadData()
            }
        }
    }
    

    
}//End Of The Class

extension GroupVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return emailArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "usercell") as? UserCell else {return UITableViewCell()}
        
        let profileImage = UIImage(named: "defaultProfileImage")
        
        cell.configureUserCell(profile: profileImage!, email: emailArray[indexPath.row], checkImg: true)
        
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let cell = tableView.cellForRow(at: indexPath) as? UserCell else { return }
        
    }
    
}

extension GroupVC: UITextFieldDelegate {
    
}
