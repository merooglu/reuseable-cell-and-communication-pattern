//
//  SelectTimeViewController.swift
//  ReusableCustomPopup
//
//  Created by Mehmet Eroğlu on 26.10.2019.
//  Copyright © 2019 Mehmet Eroğlu. All rights reserved.
//

import UIKit

class SelectTimeViewController: UIViewController {

    @IBOutlet weak var timeLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func selectTimeButtonTapped(_ sender: Any) {
        let sb = UIStoryboard(name: "DatePopupViewController", bundle: nil)
        let popup = sb.instantiateInitialViewController()! as! DatePopupViewController
        popup.showTimePicker = true
        popup.delegate = self
        present(popup, animated: true)
    }
    
}

extension SelectTimeViewController: PopupDelegate {
    
    func popupValueSelected(value: String) {
        timeLabel.text = value
    }
    
}
