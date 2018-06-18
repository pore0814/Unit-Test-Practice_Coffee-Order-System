//
//  OrderListManager.swift
//  Coffee_order_system
//
//  Created by 王安妮 on 2018/6/18.
//  Copyright © 2018年 Annie. All rights reserved.
//

import Foundation
import Firebase
import CodableFirebase

class OrderListManager{
    
    func getOrderList(completion:@escaping([Orders])->()){
        
        var ordersArray = [Orders]()
        
        FireBaseConnect.databaseRef.child("orders").observeSingleEvent(of: .value) { (snapshot) in
            guard let values = snapshot.value as? [String:Any] else {return}
            
            for value in values {
                
                guard let key = value.key as? String,
                    
                      let order = value.value  as? [String:Any],
                    
                      let account = order["account"] as? String,
                    
                      let itemCount = order["itemCount"] as? Int,
                    
                      let price = order["price"] as? Int,
                    
                      let status = order["status"] as? Int,
                    
                      let time = order["time"] as? Int
                    
                    else {return}
              
                let orderInstance = Orders(key: key, account: account, itemCount: itemCount, price: price, status: status, time: time)
        
                    ordersArray.append(orderInstance)
              
               completion(ordersArray)
             
            }
           
         
        }
    }
       
    
}
