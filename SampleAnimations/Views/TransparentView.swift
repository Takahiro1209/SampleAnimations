//
//  TransparentView.swift
//  SampleAnimations
//
//  Created by 高瀬紘輝 on 2022/09/11.
//

import UIKit

class TransparentView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        alpha = 0.2
        backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
