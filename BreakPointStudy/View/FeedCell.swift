//
//  FeedCell.swift
//  BreakPointStudy
//
//  Created by formathead on 29/07/2019.
//  Copyright © 2019 formathead. All rights reserved.
//

import UIKit

class FeedCell: UITableViewCell {
    
    @IBOutlet weak var profileImg: UIImageView!
    @IBOutlet weak var emailLbl: UILabel!
    @IBOutlet weak var contentLbl: UILabel!
    
    func configure(profile: UIImage, email: String, content: String) {
        self.profileImg.image = profile
        self.emailLbl.text = email
        self.contentLbl.text = content
    }
    
}
