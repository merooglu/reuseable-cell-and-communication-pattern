//
//  DelegateViewController.swift
//  ReusableCustomPopup
//
//  Created by Mehmet Eroğlu on 27.10.2019.
//  Copyright © 2019 Mehmet Eroğlu. All rights reserved.
//

import UIKit

class DelegateViewController: UIViewController {

    @IBOutlet weak var timeLabel: UILabel!
    
    weak var showTimePopup: DatePopupViewController?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    @IBAction func selectTimeButtonTapped(_ sender: Any) {
        let sb = UIStoryboard(name: "DatePopupViewController", bundle: nil)
        showTimePopup = sb.instantiateViewController(withIdentifier: "DatePopupVC") as? DatePopupViewController
        showTimePopup?.showTimePicker = true
        showTimePopup?.delegate = self
        present(showTimePopup!, animated: true)
    }
    
    @IBAction func dismissButtonTapped(_ sender: Any) {
        dismiss(animated: true)
    }
    
    deinit {
        print("DelegateViewController was de-initialized.")
    }
}

extension DelegateViewController: PopupDelegate {
    func popupValueSelected(value: String) {
        timeLabel.text = value
//        showTimePopup?.delegate = nil --> will also break retain cycle
//        showTimePopup = nil --> will also break retain cycle
        
    }
}
