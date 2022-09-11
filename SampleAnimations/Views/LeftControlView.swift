//
//  leftControlView.swift
//  SampleAnimations
//
//  Created by 高瀬紘輝 on 2022/09/11.
//

import UIKit
import SnapKit

class LeftControlView: UIView {
    
    let systemButtonView = LeftButtonView(frame: .zero, diameter: 80, imageSystemName: "gearshape.fill", color: #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1))
    let profileButtonView = LeftButtonView(frame: .zero, diameter: 80, imageSystemName: "person.fill", color: #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1))
    let friendButtonView = LeftButtonView(frame: .zero, diameter: 80, imageSystemName: "person.2.fill", color: #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1))
    let chatButtonView = LeftButtonView(frame: .zero, diameter: 80, imageSystemName: "message.fill", color: #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1))
    let mapButtonView = LeftButtonView(frame: .zero, diameter: 80, imageSystemName: "mappin.and.ellipse", color: #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1))
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0)
        
        let stackView = UIStackView(arrangedSubviews: [systemButtonView, profileButtonView, friendButtonView, chatButtonView, mapButtonView])
        stackView.axis = .vertical
        stackView.spacing = 30
        stackView.distribution = .fillEqually
        
        addSubview(stackView)
        
        stackView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupLayout(){
        
    }
}
