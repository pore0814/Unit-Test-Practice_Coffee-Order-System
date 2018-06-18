//
//  MenueViewController.swift
//  Coffee_order_system
//
//  Created by 王安妮 on 2018/6/18.
//  Copyright © 2018年 Annie. All rights reserved.
//

import UIKit
import SDWebImage

class MenueViewController: UIViewController {
    
    var itemsManager = ItemManager()
    
    @IBOutlet weak var cafeBtn1: UIButton!
    @IBOutlet weak var cafeBtn2: UIButton!
    @IBOutlet weak var cafeBtn3: UIButton!
    @IBOutlet weak var cafeBtn4: UIButton!
    @IBOutlet weak var cafeBtn5: UIButton!
    @IBOutlet weak var cafeBtn6: UIButton!
    @IBOutlet weak var cafeBtn7: UIButton!
    @IBOutlet weak var cafeBtn8: UIButton!
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        itemsManager.getItems(completion: {(itemsInfo:[Items]) in
          
           self.cafeBtn1.sd_setBackgroundImage(with: URL(string: itemsInfo[0].image), for: .normal, completed: nil)
            self.cafeBtn2.sd_setBackgroundImage(with: URL(string: itemsInfo[1].image), for: .normal, completed: nil)
            self.cafeBtn3.sd_setBackgroundImage(with: URL(string: itemsInfo[2].image), for: .normal, completed: nil)
            self.cafeBtn4.sd_setBackgroundImage(with: URL(string: itemsInfo[3].image), for: .normal, completed: nil)
            self.cafeBtn5.sd_setBackgroundImage(with: URL(string: itemsInfo[4].image), for: .normal, completed: nil)
            self.cafeBtn6.sd_setBackgroundImage(with: URL(string: itemsInfo[5].image), for: .normal, completed: nil)
            self.cafeBtn7.sd_setBackgroundImage(with: URL(string: itemsInfo[6].image), for: .normal, completed: nil)
          
            
            
            
        })
    }

   
}
