//
//  InsetTextField.swift
//  BreakPointStudy
//
//  Created by formathead on 12/07/2019.
//  Copyright © 2019 formathead. All rights reserved.
//

import UIKit

class InsetTextField: UITextField {
    //Frame의 내부 크기를 축소(양수)하거나 확장(음수)
    private var padding = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 0)
//    private var padding1 = UIEdgeInsets(top: 0, left: 40, bottom: 0, right: 0)
//    private var padding2 = UIEdgeInsets(top: 0, left: 60, bottom: 0, right: 0)
    
    override func awakeFromNib() {
        let placeHolder = NSAttributedString(string: self.placeholder!, attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
        
        self.attributedPlaceholder = placeHolder
        super.awakeFromNib()
    }
    
    //입력 확정 시 여백
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
    
    //입력 시 여백
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
    
    //Placeholder의 여백
    override func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
    
}//End Of The Class

