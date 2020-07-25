//
//  NotifCenterViewController.swift
//  ReusableCustomPopup
//
//  Created by Mehmet Eroğlu on 26.10.2019.
//  Copyright © 2019 Mehmet Eroğlu. All rights reserved.
//

import UIKit

class NotifCenterViewController: UIViewController {

    @IBOutlet weak var dateLabel: UILabel!
    
    var observer: NSObjectProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        // 1. NOTİFİCATİON OLD WAY
        NotificationCenter.default.addObserver(self, selector: #selector(self.handlePopupClosing(notification:)), name: .saveDateTime, object: nil)
        
        // 2. NOTİFİCATİON NEW WAY
        //        observer = NotificationCenter.default.addObserver(forName: .saveDateTime, object: nil, queue: OperationQueue.main) { (notif) in
        //            let datePopupVC = notif.object as! DatePopupViewController
        //            self.dateLabel.text = datePopupVC.formattedDate
        //        }
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
        if let observer = observer {
            NotificationCenter.default.removeObserver(observer)
        }
    }
    
    // 1. NOTİFİCATİON OLD WAY  
    @objc func handlePopupClosing(notification: Notification) {
        let dateVC = notification.object as! DatePopupViewController
        dateLabel.text = dateVC.formattedDate
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDatePopupViewControllerSegue" {
            let popup = segue.destination as! DatePopupViewController
            popup.showTimePicker = false
        }
    }

}

