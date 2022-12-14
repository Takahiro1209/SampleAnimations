//
//  BottomButton.swift
//  SampleTinder
//
//  Created by 高瀬紘輝 on 2022/09/06.
//

import UIKit

class LeftButton: UIButton {
    
    override var isHighlighted: Bool {
        didSet {
            // 選択された時に少し小さくするアニメーション
            if isHighlighted {
                UIView.animate(withDuration: 0.3, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.7, options: []){
                    self.transform = .init(scaleX: 0.8, y: 0.8)
                    self.layoutIfNeeded()
                }
            } else {
                UIView.animate(withDuration: 0.3, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.7, options: []){
                    self.transform = .identity
                    self.layoutIfNeeded()
                }
            }
        }
    }
    
    override var isSelected: Bool {
        didSet {
            print(isSelected)
        }
    }
    
    override init(frame: CGRect){
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
