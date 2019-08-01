//
//  UserCell.swift
//  BreakPointStudy
//
//  Created by formathead on 31/07/2019.
//  Copyright © 2019 formathead. All rights reserved.
//

import UIKit

class UserCell: UITableViewCell {

    
    @IBOutlet weak var profileImg: UIImageView!
    @IBOutlet weak var emailTextField: UILabel!
    @IBOutlet weak var checkImg: UIImageView!
    
    var showing = false
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        if selected {
            if showing {
               checkImg.isHidden = false
                showing = false
            } else {
                checkImg.isHidden = true
                showing = true
            }
        }
    }

    func configureUserCell(profile: UIImage, email: String, checkImg: Bool) {
        self.profileImg.image = profile
        self.emailTextField.text = email
        
        if checkImg {
            self.checkImg.isHidden = false
        } else {
            self.checkImg.isHidden = true
        }
    }
    
}
