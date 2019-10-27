//
//  SecondViewController.swift
//  ReusableCustomPopup
//
//  Created by Mehmet Eroğlu on 26.10.2019.
//  Copyright © 2019 Mehmet Eroğlu. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var dateLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDatePopupViewControllerSegue" {
            let destinationVC = segue.destination as! DatePopupViewController
            destinationVC.showTimePicker = false
            // 1. aynı fonksiyon type olan bir fonksiyona atama
            destinationVC.onSave = setLabel(_:)
            
            // 2. Closure kullanma
//            destinationVC.onSave = { (data) in
//                self.dateLabel.text = data
//
//            }
            
        }
    }

    // DatePopupViewControllerdaki onsave ile aynı func type olmalı (_ data: String) -> ()
    func setLabel(_ text: String) -> () {
        dateLabel.text = text
    }
    

}

