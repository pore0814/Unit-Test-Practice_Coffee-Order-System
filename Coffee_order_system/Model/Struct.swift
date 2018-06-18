//
//  Struct.swift
//  Coffee_order_system
//
//  Created by 王安妮 on 2018/6/18.
//  Copyright © 2018年 Annie. All rights reserved.
//

import Foundation


struct Items:Codable {
    
    var image:String
    
    var price:Int
    
    var name:String
    
}


struct Orders {
    
    var key : String
    
    var account: String
    
    var itemCount : Int
    
    var price : Int
    
    var status: Int
    
    var time : Int
    
        
    }
    
    
    

