//
//  ProductCardCell.swift
//  TIkiHomeTest
//
//  Created by Nguyen Hoan on 3/15/19.
//  Copyright © 2019 com.hoan. All rights reserved.
//

import Foundation
import UIKit

class ProductCardCell: UICollectionViewCell {
    
    
    @IBOutlet weak var textBox: UIView!
    @IBOutlet weak var icon: UIImageView!
    @IBOutlet weak var lblTitle: UILabel!
    
    @IBOutlet weak var llblWidthConstraint: NSLayoutConstraint!
    override func awakeFromNib() {
        super.awakeFromNib()
        textBox.layer.cornerRadius = 6.0
    }
    
    
    func setData(productName:String?,icon: String?, color:String)  {
        if let name = productName{
            self.lblTitle.text = name
            let width = Utility.getWidthOfString2Lines(title: name, font: lblTitle.font)
            self.llblWidthConstraint.constant = width
        }
        self.textBox.backgroundColor = UIColor(hexString: color)
        if let url = icon, let iconURL = URL(string: url){
            self.icon.setImageWith(iconURL, placeholderImage: UIImage(named: "placehoder"))
        }
    }
}
