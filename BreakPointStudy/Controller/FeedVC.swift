//
//  FirstViewController.swift
//  BreakPointStudy
//
//  Created by formathead on 08/07/2019.
//  Copyright © 2019 formathead. All rights reserved.
//

import UIKit

class FeedVC: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var messageArr = [Message]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        DataService.instance.getAllFeedMessages { (returnedMessagesArray) in
//            print(returnedMessagesArray[0].content)
//            print(returnedMessagesArray[0].senderId)
            self.messageArr = returnedMessagesArray
//            print(self.messageArr[0].content)
//            print(self.messageArr[0].senderId)
            self.tableView.reloadData()
        }
    }
}//End Of The Class

extension FeedVC: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messageArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "feedcell") as? FeedCell else {return UITableViewCell()}
        let image = UIImage(named: "defaultProfileImage")
        let message = messageArr[indexPath.row]
        
        DataService.instance.getUserName(uid: message.senderId) { (returnedUserName) in
            cell.configure(profile: image!, email: returnedUserName, content: message.content)
        }
        return cell
    }
}

