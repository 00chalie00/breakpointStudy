//
//  ShadowView.swift
//  BreakPointStudy
//
//  Created by formathead on 12/07/2019.
//  Copyright © 2019 formathead. All rights reserved.
//

import UIKit

class ShadowView: UIView {
    
    override func awakeFromNib() {
        self.layer.shadowOpacity = 0.5
        self.layer.shadowRadius = 1
        self.layer.shadowColor = UIColor.black.cgColor
        super.awakeFromNib()
    }
}//End Of The Class

