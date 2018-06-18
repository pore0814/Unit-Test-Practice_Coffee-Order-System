//
//  ItemsManager.swift
//  Coffee_order_system
//
//  Created by 王安妮 on 2018/6/18.
//  Copyright © 2018年 Annie. All rights reserved.
//

import Foundation
import CodableFirebase

class ItemManager{
    
    
    func getItems(completion:@escaping([Items])->()){
        
        FireBaseConnect.databaseRef.child("items").observeSingleEvent(of: .value) { (snapshot) in
          
            guard   let value = snapshot.value else {return}

            
            do {
                let model = try FirebaseDecoder().decode([Items].self, from: value)
                
                completion(model)
             

            } catch let error {
                
                print(error)
                
            }
            
        }
    }
}


