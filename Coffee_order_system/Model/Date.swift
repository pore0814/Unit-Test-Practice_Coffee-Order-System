//
//  Date.swift
//  Coffee_order_system
//
//  Created by 王安妮 on 2018/6/18.
//  Copyright © 2018年 Annie. All rights reserved.
//

import Foundation

class GetDateFormatter{
    
    func getDateString(unixtime:Int) -> String{
    
        let date1 = NSDate(timeIntervalSince1970:TimeInterval(unixtime) )
        
        let dayTimePeriodFormatter = DateFormatter()
        
        dayTimePeriodFormatter.dateFormat = "YYYY MM dd , hh:mm:ss"
        
        let dateString = dayTimePeriodFormatter.string(from: date1 as Date)
        
        return dateString
    }
}
