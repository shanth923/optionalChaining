//
//  ViewController.swift
//  optionalChaining
//
//  Created by BOGADI MOUNISH REDDY on 9/10/19.
//  Copyright © 2019 BOGADI MOUNISH REDDY. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
         detail.getValidatePulseLogin(registeredEmail: "mounish2610@gmail.com", registeredPassword: "momslove2610")
        // Do any additional setup after loading the view, typically from a nib.
    }
    
     let detail = UserDetails()


    @IBOutlet weak var dailySpentTime: UITextView!
    @IBOutlet weak var dailyWorkingHours: UITextView!
    @IBOutlet weak var holidaysTextView: UITextView!
    @IBOutlet weak var dateTextView: UITextView!
    
     @IBOutlet weak var leaveTextView: UITextView!
    @IBOutlet weak var leaveReasonTextView: UITextView!
   
    
    @IBOutlet weak var checkInDate: UITextView!
    @IBOutlet weak var dateofLate: UITextView!
    
    @IBAction func getHolidays(_ sender: Any) {
        detail.getUserAttendance(TextView: holidaysTextView, UITextView: dateTextView, StringVariable: "Holidays")
        
        
    }
    
    @IBAction func getLeaves(_ sender: Any) {
        detail.getUserAttendance(TextView: leaveTextView, UITextView: leaveReasonTextView, StringVariable: "Leaves")
        
        
        
    }
    
   
    @IBAction func getLateDetails(_ sender: Any) {
        detail.getUserAttendance(TextView: dateofLate, UITextView: checkInDate, StringVariable: "CheckIn")
    }
    
    @IBAction func getWorkingHours(_ sender: Any) {
        detail.getUserAttendance(TextView: dailyWorkingHours, UITextView: dailySpentTime, StringVariable: "WorkingHours")
    }
}

