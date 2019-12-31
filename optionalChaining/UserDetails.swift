//
//  UserDetails.swift
//  optionalChaining
//
//  Created by BOGADI MOUNISH REDDY on 9/10/19.
//  Copyright © 2019 BOGADI MOUNISH REDDY. All rights reserved.
//

import UIKit

class UserDetails: NSObject {
    
    
    var URLReqObj : URLRequest!
    var dataTaskObj : URLSessionDataTask!
    
    var attendanceArray : String = " ......Dates...\n"
    var reasonArray : String = "....Reason...\n"
    var dateArray : String = "....DateofLeave..\n"
    var leaveReasonArray : String = "....LeavesReason..\n"
    var dateofLate : String = ".....DateofLates....\n"
    var checkInDate :String = "....CheckInDates...\n"
    var dailyworkingHours : String = "..DailyWorkinghours..\n"
    var spentTime :String = "...SpentTime..\n"
    
    
    
    
    
    /* Creating Function For getValidatePulseLogin */
    
    
    func getValidatePulseLogin(registeredEmail:String,registeredPassword:String)
    
       {
        
        URLReqObj=URLRequest(url:URL(string:"https://www.brninfotech.com/pulse/modules/admin/ValidateLogin.php")!)
        
        URLReqObj.httpMethod="POST"
        
        let dataToSend = "registeredEmail=\(registeredEmail)&registeredPassword=\(registeredPassword)&funcName=verifyLogin"
        
        URLReqObj.httpBody = dataToSend.data(using:String.Encoding.utf8)
        
        dataTaskObj = URLSession.shared.dataTask(with: URLReqObj)  { (data, connectionDetails, error)in
            
            print("got data from server")
            
            do{
                
                let convertedData = try JSONSerialization.jsonObject(with:data!, options:JSONSerialization.ReadingOptions.allowFragments) as!  [String:String]
                
               // print(convertedData)
                
               
            }
                
            catch
            
            {
                
                print("something went wrong")
            }
            
        }
        
        dataTaskObj.resume()
    }
    
    
    
    /* Creating Function For getUserAttendance */
    
    func getUserAttendance(TextView:UITextView,UITextView:UITextView,StringVariable:String){
        
        
        URLReqObj = URLRequest(url: URL(string: "https://www.brninfotech.com/pulse/modules/admin/DashboardSnippets.php?")!)
        
        URLReqObj.httpMethod = "POST"
        
        let dataToSend = "funcName=getUserAttendance&studentIDByAdmin=NoValue"
        
        URLReqObj.httpBody = dataToSend.data(using: String.Encoding.utf8)
        
        dataTaskObj = URLSession.shared.dataTask(with: URLReqObj) { (Data, URLResponse, Error) in
            
            do
            {
                let convertedData = try JSONSerialization.jsonObject(with: Data!, options: JSONSerialization.ReadingOptions.allowFragments) as! [[String:Any]]
                //print(convertedData)
                
                
                if(StringVariable == "Holidays")
                {
                
                
                for i in 1..<convertedData.count
                    
                    {
                    
                    if(convertedData[i]["reasonForNonAttendance"] as? String == "Biometric Not Registered" || convertedData[i] ["reasonForNonAttendance"] as? String == nil
                        || convertedData[i]["reasonForNonAttendance"] as? String == "Emergency Leave: Going To Village !" )
                    {
                        
                        
                        
                    }
                    else
                    {
                        self.attendanceArray.append("\(convertedData[i]["reasonForNonAttendance"] as! String)\n \n")
                        self.reasonArray.append("\(convertedData[i]["attendanceDate"] as! String)\n \n")
                        
                        print(convertedData[i] ["reasonForNonAttendance"]!)
                        
                        print(convertedData[i] ["attendanceDate"]!)
                        
                        DispatchQueue.main.async
                            {
                                
                            TextView.text = self.attendanceArray
                            UITextView.text = self.reasonArray
                        } 

                    }
                        
                        
                    }
                
            }
                
            if(StringVariable == "Leaves")
                
            {
                
               
                
                
                for i in 1..<convertedData.count
                    
                {
                    
                    if(convertedData[i]["reasonForNonAttendance"] as? String == "Emergency Leave: Going To Village !" )
                    {
                        self.dateArray.append("\(convertedData[i]["attendanceDate"] as! String)\n \n")
                        self.leaveReasonArray.append("\(convertedData[i]["reasonForNonAttendance"] as! String)\n \n")
                        
                        print(convertedData[i] ["reasonForNonAttendance"]!)
                        
                        DispatchQueue.main.async
                            {
                                
                                TextView.text = self.dateArray
                                UITextView.text = self.leaveReasonArray
                        }
                        
                        
                        
                        
                        
                    }
                }
                
                }
                
                if (StringVariable == "CheckIn")
                {
                    for i in 1..<convertedData.count
                    {
                        if(convertedData[i]["isLateCheckIn"] as? Bool ?? false)
                        {
                            self.dateofLate.append("\(convertedData[i]["attendanceDate"] as! String) \n \n")
                            self.checkInDate.append("\(convertedData[i]["checkIn"] as! String) \n \n")
                        }
                        
                        else
                        {
                            
                           // print(convertedData[i] ["reasonForNonAttendance"]!)
                            
                            DispatchQueue.main.async
                                {
                                    
                                    TextView.text = self.dateofLate
                                    UITextView.text = self.checkInDate
                            }
                        }
                    }
                    
                }
                
                
                if(StringVariable == "WorkingHours")
                {
                    
                    for i in 1..<convertedData.count
                    {
                        
                       
                        if(convertedData[i]["isAttended"] as? Bool ?? false)
                        {
                            self.dailyworkingHours.append(("\(convertedData[i]["attendanceDate"] as! String) \n \n"))
                            self.spentTime.append(("\(convertedData[i]["timeSpent"] as! String) \n \n"))
                            print("shfahfdahfhfl")
                            
                            DispatchQueue.main.async {
                                TextView.text = self.dailyworkingHours
                                UITextView.text = self.spentTime
                            }
                            
                        }
                       
                    }
                    
                    
                }
                

                
                
                
                
                
    
                    
                }
                
               catch
        
               {
            
                print("OOPS Something Went Wrong ")
                
            }
                
                
                
            }
                
        
        
            
        dataTaskObj.resume()
        
            
        }
        
            
      
    
        
        
        
   }
    





  
