//
//  ViewController.swift
//  TIkiHomeTest
//
//  Created by Nguyen Hoan on 3/15/19.
//  Copyright © 2019 com.hoan. All rights reserved.
//

import UIKit

class HotProductController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    @IBOutlet weak var collectionview: UICollectionView!
    
    var products = [Product]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Sản Phẩm"
        self.fetchProducts()
    }
    
    private func fetchProducts() {
        self.view.showLoading()
        ProductServices.fetchProducts { (listProduct, message) in
            if let _products = listProduct {
                self.products = _products
                self.collectionview.reloadData()
            }else {
                print("Error: \(message == nil ? "" : message!)")
            }
            self.view.hideLoading()
        }
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return products.count
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let product = products[indexPath.item]
        let cellPading:CGFloat = 16.0
        let namePading:CGFloat = 10.0
        let cellMinHeight:CGFloat = 112
        let cellHeight:CGFloat = 170
        let textWdith = Utility.getWidthOfString2Lines(title: product.name, font: UIFont.systemFont(ofSize: 14))
        if (textWdith + cellPading) <= cellMinHeight{
            return CGSize(width: cellMinHeight + namePading, height: cellHeight)
        }else{
            return CGSize(width: textWdith + cellPading + namePading, height: cellHeight)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let product = products[indexPath.item]
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ProductCardCell", for: indexPath) as! ProductCardCell
        cell.setData(productName: product.name, icon: product.icon, color: colorsBox[indexPath.item % colorsBox.count])
        return cell
    }
    
}

