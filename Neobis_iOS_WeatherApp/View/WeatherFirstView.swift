//
//  WeatherFirstView.swift
//  Neobis_iOS_WeatherApp
//
//  Created by Burte Bayaraa on 2023.11.23.
//

import UIKit
import SnapKit
import Foundation

class WeatherFirstView: UIView {
    
    //Level 1
    
    lazy var dateLabel: UILabel = {
        let label = UILabel()
        label.text = ""
        label.font = UIFont(name: "Montserrat-Light", size: 14)
        label.textColor = .white
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    lazy var cityLabel: UILabel = {
        let label = UILabel()
        label.text = ""
        label.font = UIFont(name: "Montserrat-Bold", size: 40)
        label.textColor = .white
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    lazy var countryLabel: UILabel = {
        let label = UILabel()
        label.text = ""
        label.font = UIFont(name: "Montserrat-Light", size: 20)
        label.textColor = .white
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    //MARK: - Level 2
    
    let currentWeatherBackground: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 1)
        view.layer.cornerRadius = 20
//        view.addShadowToView()
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    let currentWeatherImage: UIImageView = {
        let image = UIImageView(image: UIImage(named: ""))
        image.contentMode = .scaleAspectFit
        image.translatesAutoresizingMaskIntoConstraints = false
        
        return image
    }()
    
    lazy var currentTemperatureLabel: UILabel = {
        let label = UILabel()
        label.text = ""
        label.font = UIFont(name: "Montserrat-Light", size: 100)
        label.textColor = .black
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    //MARK: - Level 3
    
    lazy var windStatusLabel: UILabel = {
        let label = UILabel()
        label.text = ""
        label.font = UIFont(name: "Montserrat-Bold", size: 14)
        label.textColor = .white
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    lazy var windSpeed: UILabel = {
        let label = UILabel()
        label.text = ""
        label.font = UIFont(name: "Montserrat-Light", size: 20)
        label.textColor = .white
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    lazy var visibilityLabel: UILabel = {
        let label = UILabel()
        label.text = ""
        label.font = UIFont(name: "Montserrat-Bold", size: 14)
        label.textColor = .white
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    lazy var visibilityDistance: UILabel = {
        let label = UILabel()
        label.text = ""
        label.font = UIFont(name: "Montserrat-Light", size: 20)
        label.textColor = .white
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    lazy var humidityLabel: UILabel = {
        let label = UILabel()
        label.text = ""
        label.font = UIFont(name: "Montserrat-Bold", size: 14)
        label.textColor = .white
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    lazy var humidityPercentage: UILabel = {
        let label = UILabel()
        label.text = ""
        label.font = UIFont(name: "Montserrat-Light", size: 20)
        label.textColor = .white
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    lazy var airPressureLabel: UILabel = {
        let label = UILabel()
        label.text = ""
        label.font = UIFont(name: "Montserrat-Bold", size: 20)
        label.textColor = .white
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    lazy var airPressureValue: UILabel = {
        let label = UILabel()
        label.text = ""
        label.font = UIFont(name: "Montserrat-Light", size: 20)
        label.textColor = .white
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    //MARK: - Level 4
    
    let nextFiveDaysBackground: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 1)
        view.layer.cornerRadius = 20
//        view.addShadowToView()
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    lazy var nextFiveDaysLabel: UILabel = {
        let label = UILabel()
        label.text = "The Next 5 days"
        label.font = UIFont(name: "Montserrat-Bold", size: 14)
        label.textColor = .black
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
