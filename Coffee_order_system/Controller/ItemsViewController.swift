//
//  MenueViewController.swift
//  Coffee_order_system
//
//  Created by 王安妮 on 2018/6/18.
//  Copyright © 2018年 Annie. All rights reserved.
//

import UIKit
import SDWebImage


protocol addItemsDelegate:class {
    
    func manager(_ manager:ItemsViewController , getItems orderArray:[Items])
    
}

class ItemsViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource {
    
    var itemsManager = ItemManager()
    
    weak var delegate: addItemsDelegate?
    
    var itemsArray = [Items]()
    
    var orderArray = [Items]()
    
    @IBOutlet weak var containView: UIView!
    
    @IBOutlet weak var itemCollectionView: UICollectionView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        configurecollectionview()
        
        
        itemsManager.getItems(completion: {[weak self](itemsInfo:[Items]) in
            
            self?.itemsArray = itemsInfo
            
            self?.itemCollectionView.reloadData()
            
            
        })
    }
    
    
    func configurecollectionview(){
        let nib = UINib(nibName: "ItemsCollectionViewCell", bundle: nil)
        
        itemCollectionView.register(nib, forCellWithReuseIdentifier: "ItemsCollectionViewCell")
        
        itemCollectionView.delegate = self
        
        itemCollectionView.dataSource = self
        
        let  fullScreenSize = UIScreen.main.bounds.size
        
//CollectionView 間距設定
        let layout = itemCollectionView.collectionViewLayout as! UICollectionViewFlowLayout
        
        layout.itemSize = CGSize(width: fullScreenSize.width/4 - 10 , height:fullScreenSize.width/4 - 10)
        
        layout.scrollDirection = .vertical //.horizontal
        
        layout.sectionInset = UIEdgeInsets(top: 0, left: 8, bottom: 0, right: 8)
        
        layout.minimumLineSpacing = 2.0
        
        layout.minimumInteritemSpacing = 2.0
        
        itemCollectionView.setCollectionViewLayout(layout, animated: false)
        
        
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return itemsArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ItemsCollectionViewCell", for: indexPath) as! ItemsCollectionViewCell
        
        //        cell.itemNameLabel.text = itemsArray[indexPath.row].name
   
        //        cell.itemPriceLabel.text = String(itemsArray[indexPath.row].price)
        
        cell.itemImageBtn.sd_setBackgroundImage(with:  URL(string: itemsArray[indexPath.row].image), for: .normal, completed: nil)
        
        cell.itemImageBtn.tag = indexPath.row
        
        cell.itemImageBtn.addTarget(self, action: #selector(seletcted(_:)), for: .touchUpInside)
        
        return cell
    }
    
    @objc func seletcted(_ sender:UIButton){
        
        orderArray.append(itemsArray[sender.tag])
        
        self.delegate?.manager(self, getItems: orderArray)
        
    }
    
    @IBAction func confirmBtn(_ sender: Any) {
        
      orderArray.removeAll()
        
        self.delegate?.manager(self, getItems: orderArray)
    }
    
    
    
    
    
}
