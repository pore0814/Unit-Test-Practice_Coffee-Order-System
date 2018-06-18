//
//  OrderListTableViewCell.swift
//  Coffee_order_system
//
//  Created by 王安妮 on 2018/6/18.
//  Copyright © 2018年 Annie. All rights reserved.
//

import UIKit

class OrderListTableViewCell: UITableViewCell {

    @IBOutlet weak var orderStatusLabel: UILabel!
   
    @IBOutlet weak var totalPriceLabel: UILabel!
    
    @IBOutlet weak var orderNumberLabel: UILabel!
    
    @IBOutlet weak var orderTimeLabel: UILabel!
    
    @IBOutlet weak var orderAccountLabel: UILabel!
    
    @IBOutlet weak var orderTotalItemsLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    
}
