//
//  ItemManager.swift
//  Coffee_order_system
//
//  Created by 王安妮 on 2018/6/18.
//  Copyright © 2018年 Annie. All rights reserved.
//

import Foundation
import Firebase



struct FireBaseConnect {
    
    static var databaseRef: DatabaseReference {
        
        return Database.database().reference()
        
    }
}

