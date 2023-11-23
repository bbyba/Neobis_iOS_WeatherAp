//
//  WeatherCollectionViewCell.swift
//  Neobis_iOS_WeatherApp
//
//  Created by Burte Bayaraa on 2023.11.23.
//

import UIKit

class WeatherCollectionViewCell: UICollectionViewCell {
    
    private lazy var weekDay: UILabel = {
        let label = UILabel()
        label.text = "Monday"
        label.font = UIFont(name: "Montserrat-Light", size: 10)
        label.textColor = .black
        
        return label
    }()
    
    private lazy var cellView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 20
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor(red: 227/255, green: 227/255, blue: 227/255, alpha: 1).cgColor
        
        return view
    }()
    
    let dailyWeatherImage: UIImageView = {
        let image = UIImageView(image: UIImage(named: ""))
        image.contentMode = .scaleAspectFit
        
        return image
    }()
    
    lazy var dailyTemperatureLabel: UILabel = {
        let label = UILabel()
        label.text = ""
        label.font = UIFont(name: "Montserrat-Light", size: 12)
        label.textColor = .black
        label.textAlignment = .center
        
        return label
    }()
    
    //MARK: -
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubviews()
        setupConstraints()
    }
    
    func configure(with data: DailyModel){
        weekDay.text = data.weekDay
        dailyTemperatureLabel.text = data.temperature
        dailyWeatherImage.image = UIImage(named: data.image)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addSubviews(){
        contentView.addSubview(weekDay)
        contentView.addSubview(cellView)
        cellView.addSubview(dailyWeatherImage)
        cellView.addSubview(dailyTemperatureLabel)
    }
    
    func setupConstraints(){
        weekDay.snp.makeConstraints{ make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview()
        }
        
        cellView.snp.makeConstraints(){ make in
            make.top.equalTo(weekDay.snp.bottom).offset(7)
            make.leading.bottom.trailing.equalToSuperview()
        }
        
        dailyWeatherImage.snp.makeConstraints(){ make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(10)
            make.height.width.equalTo(26)
        }
        
        dailyTemperatureLabel.snp.makeConstraints(){ make in
            make.centerX.equalToSuperview()
            make.top.equalTo(dailyWeatherImage.snp.bottom).offset(6)
//            make.height.width.equalTo(26)
        }
    }
    
}
