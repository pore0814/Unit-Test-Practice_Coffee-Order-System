//
//  ItemsCollectionViewCell.swift
//  Coffee_order_system
//
//  Created by 王安妮 on 2018/6/18.
//  Copyright © 2018年 Annie. All rights reserved.
//

import UIKit




class ItemsCollectionViewCell: UICollectionViewCell {
    
   

    @IBOutlet weak var itemImageBtn: UIButton!
    
    @IBOutlet weak var itemPriceLabel: UILabel!
    
    @IBOutlet weak var itemNameLabel: UILabel!
    
    override func awakeFromNib() {
        
        super.awakeFromNib()

    }
   
    
    @IBAction func itemImageBtn(_ sender: Any) {
     
    }
    

}
