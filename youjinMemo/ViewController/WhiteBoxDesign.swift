//
//  WhiteBoxDesign.swift
//  youjinMemo
//
//  Created by 김유진 on 2021/01/24.
//

import UIKit

class WhiteBoxDesign: UIView {
    
    override func awakeFromNib() {
        self.clipsToBounds = true
        self.layer.cornerRadius = 30.0;
        self.layer.shadowOffset = CGSize(width: 0, height: 2) // 위치조정
        self.layer.shadowRadius = 5 // 반경
        self.layer.shadowColor = CGColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 1)
        self.layer.shadowOpacity = 0.3 // alpha값
        
    }

}

