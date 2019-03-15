//
//  Ultility.swift
//  TIkiHomeTest
//
//  Created by Nguyen Hoan on 3/15/19.
//  Copyright © 2019 com.hoan. All rights reserved.
//

import Foundation
import UIKit

class Utility {
    class func getWidthOfString2Lines(title:String?, font: UIFont)-> CGFloat {
        guard let str = title else{
            return 0.0
        }
        var line1 = ""
        var line2 = ""
        let compos = str.components(separatedBy: " ")
        let centerIndex:Int = Int(str.count/2)
        if compos.count == 1{
            line1 = str
            line2 = ""
        }else if compos.count == 2 {
            let temCenter = str.firstIndex(of: " ")!
            line1 = String(str[0...temCenter.encodedOffset])
            line2 = (str.count - 1) <= temCenter.encodedOffset ? "" : String(str[temCenter.encodedOffset+1...str.count-1])
        }else{
            line1 = String(str[0...centerIndex])
            line2 = String(str[centerIndex+1...str.count-1])
            if str[centerIndex] != " " {
                if let temCenter =  line1.lastIndex(of: " ") {
                    line1 = String(str[0...temCenter.encodedOffset])
                    line2 = String(str[temCenter.encodedOffset...str.count - 1])
                }else{
                    line1 = str
                    line2 = ""
                }
            }
        }
        let line1W = line1.width(withConstrainedHeight: 21, font: font)
        let line2W = line2.width(withConstrainedHeight: 21, font: font)
        return line1W > line2W ? line1W : line2W
    }
}
