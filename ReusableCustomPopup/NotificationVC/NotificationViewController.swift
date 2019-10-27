//
//  NotificationViewController.swift
//  ReusableCustomPopup
//
//  Created by Mehmet Eroğlu on 27.10.2019.
//  Copyright © 2019 Mehmet Eroğlu. All rights reserved.
//

import UIKit

class NotificationViewController: UIViewController {
   
    @IBOutlet weak var dateLabel: UILabel!
    
    //1. weak reference is broke retain cycle so memory leak doesn't occur
    weak var observer: NSObjectProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        // 2. NOTİFİCATİON NEW WAY
       observer = NotificationCenter.default.addObserver(forName: Notification.Name.saveDateTime, object: nil, queue: OperationQueue.main) { //2. [unowned self] is broke retain cycle
        (notif) in
            let destVC = notif.object as! DatePopupViewController
            self.dateLabel.text = destVC.formattedDate
        }
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidAppear(animated)
        if let observer = observer {
             NotificationCenter.default.removeObserver(observer)
        }
    }
    
    
    @IBAction func selectDateButtonTapped(_ sender: Any) {
        let sb = UIStoryboard(name: "DatePopupViewController", bundle: nil)
        let popup = sb.instantiateInitialViewController() as! DatePopupViewController
        popup.showTimePicker = false
        present(popup, animated: true)
    }
    
    @IBAction func dismissButtonTapped(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    deinit {
        print("NotificationViewController was de-initialized.")
    }

}
