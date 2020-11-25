//
//  BlackBgView.swift
//  StarTrivia
//
//  Created by Ahmed Sayed on 11/6/20.
//  Copyright © 2020 Ahmed Sayed. All rights reserved.
//

import UIKit

class BlackBgView: UIView {
    
    override func awakeFromNib() {
        layer.backgroundColor = BLACK_BG
        layer.cornerRadius = 10
    }
}


class BlackBgButton: UIButton {
    
    override func awakeFromNib() {
        layer.backgroundColor = BLACK_BG
        layer.cornerRadius = 10
    }
}
