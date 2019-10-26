//
//  DatePopupViewController.swift
//  ReusableCustomPopup
//
//  Created by Mehmet Eroğlu on 26.10.2019.
//  Copyright © 2019 Mehmet Eroğlu. All rights reserved.
//

import UIKit

class DatePopupViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var saveButton: UIButton!
    
    var showTimePicker = false
    var onSave: ((_ data: String) -> ())?
    var delegate: PopupDelegate?
    
    var formattedDate: String {
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        return formatter.string(from: datePicker.date)
        
    }
    
    var formattedTime: String {
        get {
            let formatter = DateFormatter()
            formatter.timeStyle = .short
            return formatter.string(from: datePicker.date)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if showTimePicker {
            titleLabel.text = "Select Time"
            datePicker.datePickerMode = .time
            saveButton.setTitle("Save Time", for: .normal)
        }
        
    }

    @IBAction func saveDateButtonTapped(_ sender: Any) {
        NotificationCenter.default.post(name: .saveDateTime, object: self)
        
        if showTimePicker {
            onSave?(formattedTime)
            delegate?.popupValueSelected(value: formattedTime)
        }else {
            onSave?(formattedDate)
        }
        
        dismiss(animated: true)
    }
    
}
