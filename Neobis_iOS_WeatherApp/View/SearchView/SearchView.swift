//
//  WeatherSearchView.swift
//

import UIKit
import SnapKit
import Foundation

class SearchView: UIView, UISearchBarDelegate {
    
    lazy var gradientLayer: CAGradientLayer = {
        let gradient = CAGradientLayer()
        gradient.frame = bounds
        gradient.colors = [UIColor(red: 48 / 255, green: 162 / 255, blue: 197 / 255, alpha: 1).cgColor, UIColor(red: 0 / 255, green: 36 / 255, blue: 47 / 255, alpha: 1).cgColor]
        gradient.startPoint = CGPoint(x: 0.5, y: 0)
        gradient.endPoint = CGPoint(x: 0.5, y: 1)
        layer.insertSublayer(gradient, at: 0)
        
        return gradient
    }()
    
    let searchLocationBackground: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 30
        
        return view
    }()
    
    lazy var closeButton: UIButton = {
        let button = UIButton()
        button.setBackgroundImage(UIImage(systemName: "xmark"), for: .normal)
        button.tintColor = .black
        
        return button
    }()
    
//    let searchBar : UISearchBar = {
//        let bar = UISearchBar()
//        bar.placeholder = "SEARCH LOCATION"
//        bar.searchTextField.font = UIFont(name: "Montserrat-Light", size: 14)
//        bar.searchBarStyle = .minimal
//        bar.layer.cornerRadius = 15
//        
//        return bar
//    }()
    
    let searchTextField: UITextField = {
        let textField = UITextField()
        textField.backgroundColor = UIColor(red: 237/255, green: 237/255, blue: 237/255, alpha: 1.0)
        textField.font = UIFont(name: "Montserrat-Light", size: 14)
        textField.placeholder = "SEARCH LOCATION"
        textField.textColor = .black
        textField.layer.cornerRadius = 22
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: textField.frame.height))
        textField.leftView = paddingView
        textField.leftViewMode = .always

        return textField
    }()
    
    let searchSecondButton: UIButton = {
        let button = UIButton()
        button.setBackgroundImage(UIImage(systemName: "magnifyingglass"), for: .normal)
        button.tintColor = .black
        
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubviews()
        setupConstraints()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        gradientLayer.frame = bounds
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
        
    func addSubviews(){
        addSubview(searchLocationBackground)
        searchLocationBackground.addSubview(closeButton)
        searchLocationBackground.addSubview(searchTextField)
        searchLocationBackground.addSubview(searchSecondButton)
    }
    
    func setupConstraints(){
        searchLocationBackground.snp.makeConstraints(){ make in
            make.top.equalToSuperview().offset(70)
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(365)
        }
        
        closeButton.snp.makeConstraints(){ make in
            make.top.equalToSuperview().offset(30)
            make.right.equalToSuperview().inset(15)
            make.height.width.equalTo(20)
        }
        
        searchTextField.snp.makeConstraints(){ make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(80)
            make.height.equalTo(44)
            make.width.equalTo(305)
        }
        
        searchSecondButton.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(85)
            make.leading.equalTo(searchTextField.snp.trailing).offset(3)
            make.width.equalTo(30)
            make.height.equalTo(30)
        }
    }
}
