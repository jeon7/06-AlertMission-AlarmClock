//
//  ViewController.swift
//  06 AlertMission AlarmClock
//
//  Created by Gukhwa Jeon on 24.04.20.
//  Copyright © 2020 G-Kay. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    let timeSelector: Selector = #selector(ViewController.updateTime)
    let interval = 1.0
    var alarmTime: String?
    var alertFlag = false
    
    @IBOutlet var lblCurrentTime: UILabel!
    @IBOutlet var lblAlarmTime: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Timer.scheduledTimer(timeInterval: interval, target: self, selector: timeSelector, userInfo: nil, repeats: true)
    }

    @IBAction func setAlarm(_ sender: UIDatePicker) {
        let formatter = DateFormatter()
        formatter.dateFormat = "E MMM dd hh:mm aaa"
        
        alarmTime = formatter.string(from: sender.date)
        lblAlarmTime.text = "Set Alarm at: \(alarmTime ?? "?")"
    }
    
    @objc func updateTime() {
        let date = NSDate()
        let formatter = DateFormatter()
        formatter.dateFormat = "E MMM dd hh:mm:ss aaa"
        lblCurrentTime.text = "Current Time: \(formatter.string(from: date as Date))"
        
        formatter.dateFormat = "E MMM dd hh:mm aaa"
        let currentTime = formatter.string(from: date as Date)
        
        if (currentTime == alarmTime) {
            if !alertFlag {
                let alarmAlert = UIAlertController(title: "Alarm", message: "It's time", preferredStyle: UIAlertController.Style.alert)
                let onAction = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil)
                alarmAlert.addAction(onAction)
                present(alarmAlert, animated: true, completion: nil)
                alertFlag = true
            }
        } else {
            alertFlag = false
        }
    }
}

