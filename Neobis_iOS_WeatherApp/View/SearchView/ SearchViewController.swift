//
//  SearchViewController.swift
//


import UIKit

class SearchViewController: UIViewController {
    let secondaryView = SearchView()
    var weatherManager = WeatherManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(secondaryView)
        setupConstraintsSecondaryView()
        secondaryView.searchTextField.delegate = self
        addTargets()
    }
    
    func setupConstraintsSecondaryView(){
        secondaryView.snp.makeConstraints { make in
            make.top.leading.trailing.bottom.equalToSuperview()
        }
    }
    
    func addTargets(){
        secondaryView.closeButton.addTarget(self, action: #selector(didTapCloseButton(_ :)), for: .touchUpInside)
        secondaryView.searchSecondButton.addTarget(self, action: #selector(didTapSecondSearchButton(_ :)), for: .touchUpInside)
    }
    
    @objc func didTapCloseButton(_ sender: UIButton) {
        self.dismiss(animated: false, completion: nil)
    }
}

//MARK: -
extension SearchViewController: UITextFieldDelegate {
    
    @objc func didTapSecondSearchButton(_ sender: UIButton) {
        print(secondaryView.searchTextField.text!)
        secondaryView.searchTextField.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        secondaryView.searchTextField.endEditing(true)
        return true
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        if textField.text != "" {
            return true
        } else {
            textField.placeholder = "Type something"
            return false
        }
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        //use the data before clearing
        if let city = secondaryView.searchTextField.text {
            weatherManager.fetchWeather(cityName: city) { weatherData in
                print("Received weather data: \(weatherData)")
            }
            weatherManager.fetchDailyWeather(cityName: city) { dailyWeatherData in
                print("Received daily weather data: \(dailyWeatherData)")
            }
        }
        secondaryView.searchTextField.text = ""
    }
}


