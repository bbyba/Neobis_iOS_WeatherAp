//
//  WeatherMainView.swift
//  Neobis_iOS_WeatherApp
//
//  Created by Burte Bayaraa on 2023.11.23.
//

import UIKit
import SnapKit
import Foundation

class WeatherMainView: UIView {
    
    //Level 1
    lazy var searchButton: UIButton = {
        let button = UIButton()
        button.setBackgroundImage(UIImage(systemName: "magnifyingglass.circle"), for: .normal)
        button.tintColor = .black
        button.isUserInteractionEnabled = true

        return button
    }()
    
    //MARK: - Level 2
    
    lazy var dateLabel: UILabel = {
        let label = UILabel()
        label.text = "2023/11/23"
        label.font = UIFont(name: "Montserrat-Light", size: 14)
        label.textColor = .white
        label.textAlignment = .center
        
        return label
    }()
    
    lazy var cityLabel: UILabel = {
        let label = UILabel()
        label.text = "madrid"
        label.font = UIFont(name: "Montserrat-Bold", size: 40)
        label.textColor = .white
        label.textAlignment = .center
        
        return label
    }()
    
    lazy var countryLabel: UILabel = {
        let label = UILabel()
        label.text = "spain"
        label.font = UIFont(name: "Montserrat-Light", size: 20)
        label.textColor = .white
        label.textAlignment = .center
        
        return label
    }()
    
    //MARK: - Level 3
    
    let currentWeatherBackground: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 120
//        view.addShadowToView()
        
        return view
    }()
    
    let currentWeatherImage: UIImageView = {
        let image = UIImageView(image: UIImage(named: "stormy"))
        image.contentMode = .scaleAspectFit
        
        return image
    }()
    
    lazy var currentTemperatureLabel: UILabel = {
        let label = UILabel()
        label.text = "22"
        label.font = UIFont(name: "Montserrat-Light", size: 100)
        label.textColor = .black
        label.textAlignment = .center
        
        return label
    }()
    
    //MARK: - Level 4
    
    let firstBackground: UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        
        return view
    }()
    
    lazy var windStatusLabel: UILabel = {
        let label = UILabel()
        label.text = "Wind status"
        label.font = UIFont(name: "Montserrat-Bold", size: 14)
        label.textColor = .white
        label.textAlignment = .center
        
        return label
    }()
    
    lazy var windSpeed: UILabel = {
        let label = UILabel()
        label.text = "7 mph"
        label.font = UIFont(name: "Montserrat-Light", size: 20)
        label.textColor = .white
        label.textAlignment = .center
        
        return label
    }()
    
    lazy var humidityLabel: UILabel = {
        let label = UILabel()
        label.text = "Humidity"
        label.font = UIFont(name: "Montserrat-Bold", size: 14)
        label.textColor = .white
        label.textAlignment = .center
        
        return label
    }()
    
    lazy var humidityPercentage: UILabel = {
        let label = UILabel()
        label.text = "85%"
        label.font = UIFont(name: "Montserrat-Light", size: 20)
        label.textColor = .white
        label.textAlignment = .center
        
        return label
    }()
    
    let secondBackground: UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        
        return view
    }()
    
    lazy var visibilityLabel: UILabel = {
        let label = UILabel()
        label.text = "Visibilty"
        label.font = UIFont(name: "Montserrat-Bold", size: 14)
        label.textColor = .white
        label.textAlignment = .center
        return label
    }()
    
    lazy var visibilityDistance: UILabel = {
        let label = UILabel()
        label.text = "64 m"
        label.font = UIFont(name: "Montserrat-Light", size: 20)
        label.textColor = .white
        label.textAlignment = .center
        
        return label
    }()
    
    lazy var airPressureLabel: UILabel = {
        let label = UILabel()
        label.text = "Air pressure"
        label.font = UIFont(name: "Montserrat-Bold", size: 14)
        label.textColor = .white
        label.textAlignment = .center
        
        return label
    }()
    
    lazy var airPressureValue: UILabel = {
        let label = UILabel()
        label.text = "1000"
        label.font = UIFont(name: "Montserrat-Light", size: 20)
        label.textColor = .white
        label.textAlignment = .center
        
        return label
    }()
    
    //MARK: - Level 5
    
    let nextFiveDaysBackground: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 20
//        view.addShadowToView()
        
        return view
    }()
    
    lazy var nextFiveDaysLabel: UILabel = {
        let label = UILabel()
        label.text = "The Next 5 days"
        label.font = UIFont(name: "Montserrat-Bold", size: 14)
        label.textColor = .black
        
        return label
    }()
    
    // MARK: CollectionView
    lazy var collectionView = UICollectionView()
    
    let flowLayout: UICollectionViewFlowLayout = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 10
        layout.itemSize = CGSize(width: 70, height: 90)
        
        return layout
    }()
    
    lazy var gradientLayer: CAGradientLayer = {
        let gradient = CAGradientLayer()
        return gradient
    }()
    
    //MARK: -
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .systemCyan
//        layer.addSublayer(gradientLayer)
//        setupGradient()
        configureCollectionView()
        addSubviews()
        setupConstraints()
    }
    
    func configureCollectionView(){
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        collectionView.backgroundColor = .clear
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.register(WeatherCollectionViewCell.self, forCellWithReuseIdentifier: "weatherCollectionViewCell")
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addSubviews(){
//        addSubview(searchButton)
        addSubview(dateLabel)
        addSubview(cityLabel)
        addSubview(countryLabel)
        addSubview(currentWeatherBackground)
        addSubview(firstBackground)
        addSubview(secondBackground)
        addSubview(nextFiveDaysBackground)
        
        currentWeatherBackground.addSubview(currentWeatherImage)
        currentWeatherBackground.addSubview(currentTemperatureLabel)
        

        firstBackground.addSubview(windStatusLabel)
        firstBackground.addSubview(windSpeed)
        firstBackground.addSubview(humidityLabel)
        firstBackground.addSubview(humidityPercentage)
        
        
        secondBackground.addSubview(visibilityLabel)
        secondBackground.addSubview(visibilityDistance)
        secondBackground.addSubview(airPressureLabel)
        secondBackground.addSubview(airPressureValue)
        
        nextFiveDaysBackground.addSubview(nextFiveDaysLabel)
        nextFiveDaysLabel.addSubview(collectionView)
    }
    
    func setupConstraints(){
//        searchButton.snp.makeConstraints(){ make in
//            make.top.equalToSuperview().offset(30)
//            make.right.equalToSuperview().inset(25)
//            make.height.width.equalTo(30)
//        }
        
        dateLabel.snp.makeConstraints(){ make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(86)
//            make.height.equalTo(17)
        }
        
        cityLabel.snp.makeConstraints(){ make in
            make.centerX.equalToSuperview()
            make.top.equalTo(dateLabel.snp.bottom)
            make.height.equalTo(49)
        }
        
        countryLabel.snp.makeConstraints(){ make in
            make.centerX.equalToSuperview()
            make.top.equalTo(cityLabel.snp.bottom).offset(3)
//            make.height.equalTo(17)
        }
        
        currentWeatherBackground.snp.makeConstraints(){ make in
            make.centerX.equalToSuperview()
            make.top.equalTo(countryLabel.snp.bottom).offset(15)
            make.height.width.equalTo(240)
        }
        
        currentWeatherImage.snp.makeConstraints(){ make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(12)
            make.height.width.equalTo(75)
        }
        
        currentTemperatureLabel.snp.makeConstraints(){ make in
            make.centerX.equalToSuperview()
            make.top.equalTo(currentWeatherImage.snp.bottom).offset(10)
        }
        
        firstBackground.snp.makeConstraints(){ make in
            make.top.equalTo(currentWeatherBackground.snp.bottom).offset(30)
            make.left.equalToSuperview().offset(55)
            make.height.equalTo(118)
            make.width.equalTo(90)
        }
        
        windStatusLabel.snp.makeConstraints(){ make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview()
        }
        
        windSpeed.snp.makeConstraints(){ make in
            make.centerX.equalToSuperview()
            make.top.equalTo(windStatusLabel.snp.bottom).offset(8)
        }
        
        humidityLabel.snp.makeConstraints(){ make in
            make.centerX.equalToSuperview()
            make.top.equalTo(windSpeed.snp.bottom).offset(20)
        }
        
        humidityPercentage.snp.makeConstraints(){ make in
            make.centerX.equalToSuperview()
            make.bottom.equalToSuperview()
//            make.top.equalTo(humidityLabel.snp.bottom).offset(8)
        }
        
        secondBackground.snp.makeConstraints(){ make in
            make.top.equalTo(currentWeatherBackground.snp.bottom).offset(30)
            make.right.equalToSuperview().inset(55)
            make.height.equalTo(118)
            make.width.equalTo(90)
        }
        
        visibilityLabel.snp.makeConstraints(){ make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview()
        }
        
        visibilityDistance.snp.makeConstraints(){ make in
            make.centerX.equalToSuperview()
            make.top.equalTo(visibilityLabel.snp.bottom).offset(8)
        }
        
        airPressureLabel.snp.makeConstraints(){ make in
            make.centerX.equalToSuperview()
            make.top.equalTo(visibilityDistance.snp.bottom).offset(20)
        }
        
        airPressureValue.snp.makeConstraints(){ make in
            make.centerX.equalToSuperview()
            make.bottom.equalToSuperview()
//            make.top.equalTo(humidityLabel.snp.bottom).offset(8)
        }
        
        nextFiveDaysBackground.snp.makeConstraints(){ make in
            make.top.equalTo(firstBackground.snp.bottom).offset(30)
            make.left.right.equalToSuperview()
            make.bottom.equalToSuperview().offset(-3)
        }
        
        nextFiveDaysLabel.snp.makeConstraints(){ make in
            make.top.equalToSuperview().offset(45)
            make.left.equalToSuperview().offset(15)
        }
        
        collectionView.snp.makeConstraints(){ make in
            make.top.equalTo(nextFiveDaysLabel.snp.bottom).offset(15)
            make.left.equalToSuperview()
            make.right.equalToSuperview()
            make.height.equalTo(93)
            make.width.equalTo(350)
//            make.width.equalToSuperview().inset(10)
        }
    }
    
    func setupGradient() {
        gradientLayer.frame = bounds
        gradientLayer.colors = [UIColor(red: 48 / 255, green: 162 / 255, blue: 197 / 255, alpha: 1).cgColor, UIColor(red: 0 / 255, green: 36 / 255, blue: 47 / 255, alpha: 1).cgColor]
        gradientLayer.startPoint = CGPoint(x: 0.5, y: 0)
        gradientLayer.endPoint = CGPoint(x: 0.5, y: 1)
//        layer.insertSublayer(gradientLayer, at: 0)
    }
    
//    @objc func didTapSearchButton(_ sender: UIButton){
//        print("search tapped")
//    }
}
