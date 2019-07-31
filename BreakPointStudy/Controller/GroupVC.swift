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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    @IBAction func closeBtnWasPressed(_ sender: Any) {
        
    }
    
    @IBAction func doneBtnWasPressed(_ sender: Any) {
        
    }
    

    
}//End Of The Class

extension GroupVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "usercell") as? UserCell else {return UITableViewCell()}
        
        let profileImage = UIImage(named: "defaultProfileImage")
        
        cell.configureUserCell(profile: profileImage!, email: "formathead@gmail.com", checkImg: true)
        
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    
}
