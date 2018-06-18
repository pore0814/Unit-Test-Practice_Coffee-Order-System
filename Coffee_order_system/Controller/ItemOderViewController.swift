//
//  ItemOderViewController.swift
//  Coffee_order_system
//
//  Created by 王安妮 on 2018/6/18.
//  Copyright © 2018年 Annie. All rights reserved.
//

import UIKit

class ItemOderViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
   
    

    @IBOutlet weak var orderTableview: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureTableview()

    }

    func configureTableview(){
    
        let nib = UINib(nibName: "OrderTableViewCell", bundle: nil)
        
        orderTableview.register(nib, forCellReuseIdentifier: "OrderTableViewCell")
        
        orderTableview.dataSource = self
        
        orderTableview.delegate = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "OrderTableViewCell") as! OrderTableViewCell
       
        return cell
    }

}
