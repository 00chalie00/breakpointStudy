//
//  Message.swift
//  BreakPointStudy
//
//  Created by formathead on 29/07/2019.
//  Copyright © 2019 formathead. All rights reserved.
//

import UIKit

class Message {
    
    private var _content: String
    private var _senderId: String
    
    var content: String {
        return _content
    }
    
    var senderId: String {
        return _senderId
    }
    
    init(content: String, senderId: String) {
        self._content = content
        self._senderId = senderId
    }
}
