//
//  OderListViewController.swift
//  Coffee_order_system
//
//  Created by 王安妮 on 2018/6/18.
//  Copyright © 2018年 Annie. All rights reserved.
//

import UIKit

class OderListViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    let orderListManager = OrderListManager()
    
    let getDateFormatter = GetDateFormatter()
    
    var ordersArry = [Orders]()

    
    @IBOutlet weak var ordersTableView: UITableView!
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        orderListManager.getOrderList(completion: {[weak self] (list:[Orders]) in
            
            self?.ordersArry = list
            
            self?.ordersTableView.reloadData()
            
        })
        
    
       
        
        configureTableView()
        
        

    }
    
   func configureTableView(){
    
    ordersTableView.delegate = self
    
    ordersTableView.dataSource = self
    
    let nib = UINib(nibName: "OrderListTableViewCell", bundle: nil)
    
    ordersTableView.register(nib, forCellReuseIdentifier: "OrderListTableViewCell")
    
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ordersArry.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "OrderListTableViewCell") as! OrderListTableViewCell
       
        cell.orderAccountLabel.text = ordersArry[indexPath.row].account
        
        cell.orderNumberLabel.text = ordersArry[indexPath.row].key
        
        let time =  getDateFormatter.getDateString(unixtime: ordersArry[indexPath.row].time)
        
        cell.orderTimeLabel.text = time
        
        cell.orderTotalItemsLabel.text = String(ordersArry[indexPath.row].itemCount)
        
        cell.totalPriceLabel.text = String(ordersArry[indexPath.row].price)
       
        
        
       cell.orderStatusLabel.text = getStatus(status: ordersArry[indexPath.row].status)
        
        return cell
    }

    
    func getStatus(status:Int) -> String{
        
        if status == 0{
            return "Canceled"
        }else if status == 1{
            return "Processing"
        }else if status == 2{
            return "Completed"
        }else {
            return "錯誤"
        }
    }
   

}
