//
//  ViewController.swift
//  Neobis_iOS_WeatherApp
//


import UIKit
import Foundation

class ViewController: UIViewController {
    
    let mainView = WeatherMainView()
    let secondaryView = WeatherSearchView()
    let dailyModel = [
            DailyModel(weekDay: "Monday", temperature: "22", image: "cloudy"),
            DailyModel(weekDay: "Tuesday", temperature: "10", image: "stormy"),
            DailyModel(weekDay: "Wednesday", temperature: "22", image: "cloudy"),
            DailyModel(weekDay: "Thursday", temperature: "10", image: "stormy"),
            DailyModel(weekDay: "Friday", temperature: "22", image: "cloudy"),


        ]
//    let currentWeatherViewModel = CurrentWeatherViewModel()
//    let dailyWeatherViewModel = DailyWeatherViewModel()
    
    var weatherManager = WeatherManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(mainView)
        setupConstraintsMainView()

        mainView.collectionView.delegate = self
        mainView.collectionView.dataSource = self
        addTargets()

    }
    
    func setupConstraintsMainView(){
        mainView.snp.makeConstraints { make in
            make.top.leading.trailing.bottom.equalToSuperview()
        }
    }
    
    func addTargets(){
        mainView.searchButton.addTarget(self, action: #selector(didTapSearchButton), for: .touchUpInside)
    }
    
    @objc func didTapSearchButton(_ sender: UIButton) {
        // Navigate to the search screen
        let searchViewController = WeatherSearchViewController()
        searchViewController.modalPresentationStyle = UIModalPresentationStyle.fullScreen
        present(searchViewController, animated: false, completion: nil)
        
        weatherManager.fetchWeather(cityName: "London") { weatherModel in
                if let weatherModel = weatherModel {
                    // Update UI with the fetched data
                    DispatchQueue.main.async {
                        self.updateUI(with: weatherModel)
                    }
                } else {
                    // Handle error or show an alert
                    print("Failed to fetch weather data.")
                }
            }
    }
    func updateUI(with weatherModel: WeatherModel) {
        // Update your UI components with data from the WeatherModel
        mainView.cityLabel.text = weatherModel.cityName
        mainView.countryLabel.text = weatherModel.countryName
        // Update other UI components as needed
    }
}


extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dailyModel.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "weatherCollectionViewCell", for: indexPath) as! WeatherCollectionViewCell
        let data = dailyModel[indexPath.item]
        cell.configure(with: data)
        
        return cell
    }
}
