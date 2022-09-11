//
//  ViewController.swift
//  SampleAnimations
//
//  Created by 高瀬紘輝 on 2022/09/05.
//

import UIKit
import SnapKit

class HomeViewController: UIViewController {
    
    // 下から上へスライドするジェスチャーを認識するビュー
    private let transparentView = TransparentView()
    
    // 左のUI
    let leftControlView = LeftControlView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupGestures()
        setupLayout()
    }
    
    private func setupGestures(){
        let parentViewPanGesture = UIPanGestureRecognizer(target: self, action: #selector(panParentView))
        self.view.isUserInteractionEnabled = true
        self.view.addGestureRecognizer(parentViewPanGesture)
        
        let transparentViewPanGesture = UIPanGestureRecognizer(target: self, action: #selector(panTransparentView(gesture:)))
        self.transparentView.isUserInteractionEnabled = true
        self.transparentView.addGestureRecognizer(transparentViewPanGesture)
    }
    
    private var topConstraint: Constraint!
    private var heightConstraint: Constraint!
    
    private func setupLayout(){
        
        view.backgroundColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)

        view.addSubview(transparentView)
        view.addSubview(leftControlView)

        // transparentView.backgroundColor = .brown
        transparentView.snp.makeConstraints {
            $0.left.equalToSuperview()
            $0.top.bottom.equalTo(view.safeAreaInsets)
            $0.width.equalToSuperview().dividedBy(3)
        }
        // leftControlView.backgroundColor = .cyan
        leftControlView.snp.makeConstraints {
            $0.left.equalToSuperview()
            topConstraint = $0.top.equalTo(view.safeAreaInsets).offset(-400).constraint
            heightConstraint =  $0.height.equalTo(300).constraint
            $0.width.equalToSuperview().dividedBy(4)
        }
    }
    
    
    @objc private func panTransparentView(gesture: UIPanGestureRecognizer){
        let translation = gesture.translation(in: self.transparentView)
        if gesture.state == .ended {
            handleTransparentViewPanEnded(translation: translation)
        }
    }
    
    private func handleTransparentViewPanEnded(translation: CGPoint){
        if translation.y > 0 {
            appearLeftControlView()
        }
    }
    
    
    @objc private func panParentView(gesture: UIPanGestureRecognizer){
        let translation = gesture.translation(in: self.transparentView)
        if gesture.state == .ended {
            handleParentViewPanEnded(translation: translation)
        }
    }
    
    private func handleParentViewPanEnded(translation: CGPoint){
        if !leftControlView.isHidden {
            if translation.y < 0 {
                disappearLeftControlView()
            }
        }
    }
    
    
    private func appearLeftControlView(){
        UIView.animate(withDuration: 0.4, delay: 0, options: .curveEaseOut){
            self.transparentView.isHidden = true
            self.topConstraint.update(offset: 100)
            self.heightConstraint.update(offset: 800)
            self.view.layoutIfNeeded()
        }
    }
    
    private func disappearLeftControlView(){
        UIView.animate(withDuration: 0.4, delay: 0, options: .curveEaseOut){
            self.transparentView.isHidden = false
            self.topConstraint.update(offset: -400)
            self.heightConstraint.update(offset: 300)
            self.view.layoutIfNeeded()
        }
    }
}

