//
//  BottomButtonView.swift
//  SampleTinder
//
//  Created by 高瀬紘輝 on 2022/09/06.
//

import UIKit
import SnapKit

class LeftButtonView: UIView {

    init(frame: CGRect, diameter: CGFloat, imageSystemName: String, color: UIColor){
        super.init(frame: frame)
        
        let button = LeftButton()
        
        var config = UIButton.Configuration.filled()
        config.image = UIImage(systemName: imageSystemName)
        config.baseForegroundColor = color
        config.baseBackgroundColor = .white
        config.cornerStyle = .capsule
        config.imagePlacement = .trailing
        button.configuration = config
        
        let outerCircle = UIView()
        outerCircle.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        outerCircle.layer.shadowColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        outerCircle.layer.cornerRadius = 50
        outerCircle.layer.shadowOffset = CGSize(width: 1.5, height: 2)
        outerCircle.layer.shadowOpacity = 0.6
        outerCircle.layer.shadowRadius = 4

        let innerCircle = UIView()
        innerCircle.backgroundColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        innerCircle.layer.cornerRadius = 50
        
        addSubview(outerCircle)
        addSubview(innerCircle)
        addSubview(button)
        
        outerCircle.snp.makeConstraints {
            $0.centerX.centerY.equalToSuperview()
            $0.size.equalTo(CGSize(width: diameter, height: diameter)).inset(-50)
        }
        
        innerCircle.snp.makeConstraints {
            $0.centerX.centerY.equalToSuperview()
            $0.size.equalTo(CGSize(width: diameter, height: diameter)).inset(-49)
        }
        
        button.snp.makeConstraints {
            $0.centerX.centerY.equalToSuperview()
            $0.size.equalTo(CGSize(width: diameter, height: diameter))
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
