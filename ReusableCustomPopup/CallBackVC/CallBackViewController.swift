//
//  CallBackViewController.swift
//  ReusableCustomPopup
//
//  Created by Mehmet Eroğlu on 27.10.2019.
//  Copyright © 2019 Mehmet Eroğlu. All rights reserved.
//

import UIKit

class CallBackViewController: UIViewController {

    @IBOutlet weak var dateLabel: UILabel!
    var showPopup: DatePopupViewController?
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    @IBAction func selectDateButtonTapped(_ sender: Any) {
        let sb = UIStoryboard(name: "DatePopupViewController", bundle: nil)
        showPopup = sb.instantiateViewController(withIdentifier: "DatePopupVC") as? DatePopupViewController
        showPopup?.showTimePicker = false
//        showPopup.onSave = saveDate
        showPopup?.onSave = { [unowned self](value) in
            self.dateLabel.text = value
//            self.showPopup = nil  --> will breaks retain cycle
        }
        present(showPopup!, animated: true)
        
    }
    
    @IBAction func dismissButtonTapped(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    
    func saveDate(_ value: String) {
        dateLabel.text = value
    }
    
    deinit {
        print("CallbackViewController was de-initialized.")
    }
    
}
