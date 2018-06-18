//
//  ItemOderViewController.swift
//  Coffee_order_system
//
//  Created by 王安妮 on 2018/6/18.
//  Copyright © 2018年 Annie. All rights reserved.
//

import UIKit

class ItemAddViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    
    
    @IBOutlet weak var orderTableview: UITableView!
    
    var addItmesArray = [Items]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureTableview()
        
        
      
        let app = UIApplication.shared.delegate! as! AppDelegate
        
        if let viewControllers = app.window?.rootViewController?.childViewControllers {
            
            viewControllers.forEach { vc in
                
                if let cont = vc as? ItemsViewController {
                    
                    cont.delegate = self
                    
                }
            }
        }
    }
    
    func configureTableview(){
        
        let nib = UINib(nibName: "OrderTableViewCell", bundle: nil)
        
        orderTableview.register(nib, forCellReuseIdentifier: "OrderTableViewCell")
        
        orderTableview.dataSource = self
        
        orderTableview.delegate = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        
        return  addItmesArray.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "OrderTableViewCell") as! OrderTableViewCell
        
        cell.nameLabel.text = addItmesArray[indexPath.row].name
        
        cell.drinkimageView.sd_setImage(with: URL(string: addItmesArray[indexPath.row].image), completed: nil)
        
        return cell
    }
    
}

extension ItemAddViewController: addItemsDelegate{
    
    func manager(_ manager: ItemsViewController, getItems orderArray: [Items]) {
        
        addItmesArray = orderArray
        
        orderTableview.reloadData()
        
    }
    
    
}
