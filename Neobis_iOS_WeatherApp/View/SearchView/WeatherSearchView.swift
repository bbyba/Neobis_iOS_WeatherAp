//
//  WeatherSearchView.swift
//  Neobis_iOS_WeatherApp
//
//  Created by Burte Bayaraa on 2023.11.24.
//

import UIKit
import SnapKit
import Foundation

class WeatherSearchView: UIView {
    
    let searchLocationBackground: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 20
  
        return view
    }()
    
//    lazy var closeButton: UIButton = {
//        let button = UIButton()
//        button.setBackgroundImage(UIImage(systemName: "xmark.circle"), for: .normal)
//        button.tintColor = .black
//        return button
//    }()
    
    let searchBar : UISearchBar = {
        let bar = UISearchBar()
        bar.placeholder = "SEARCH LOCATION"
        bar.searchTextField.font = UIFont(name: "Montserrat-Light", size: 14)
        bar.searchBarStyle = .minimal
        
        return bar
    }()
    
    lazy var gradientLayer: CAGradientLayer = {
        let gradient = CAGradientLayer()
        return gradient
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .yellow
        layer.addSublayer(gradientLayer)
        addSubviews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addSubviews(){
        addSubview(searchLocationBackground)
        
//        searchLocationBackground.addSubview(closeButton)
        searchLocationBackground.addSubview(searchBar)
    }
    
    func setupConstraints(){
//        closeButton.snp.makeConstraints(){ make in
//            make.top.equalToSuperview().offset(30)
//            make.right.equalToSuperview().inset(30)
//            make.height.width.equalTo(30)
//        }
        
        searchBar.snp.makeConstraints(){ make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(80)
            make.height.equalTo(44)
            make.width.equalTo(305)
        }
    }
    
    func setupGradient() {
        gradientLayer.frame = bounds
        gradientLayer.colors = [UIColor(red: 48 / 255, green: 162 / 255, blue: 197 / 255, alpha: 1).cgColor, UIColor(red: 0 / 255, green: 36 / 255, blue: 47 / 255, alpha: 1).cgColor]
        gradientLayer.startPoint = CGPoint(x: 0.5, y: 0)
        gradientLayer.endPoint = CGPoint(x: 0.5, y: 1)
//        layer.insertSublayer(gradientLayer, at: 0)
    }
    

}