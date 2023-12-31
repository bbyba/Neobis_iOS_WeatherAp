//
//  MainViewController.swift
//


import UIKit
import Foundation

class MainViewController: UIViewController {
    
    let mainView = MainView()
    let secondaryView = SearchView()
    
    let dailyModel = [
            DailyModel(weekDay: "Monday", temperature: "22", image: "cloudy"),
            DailyModel(weekDay: "Tuesday", temperature: "10", image: "stormy"),
            DailyModel(weekDay: "Wednesday", temperature: "22", image: "cloudy"),
            DailyModel(weekDay: "Thursday", temperature: "10", image: "stormy"),
            DailyModel(weekDay: "Friday", temperature: "22", image: "cloudy"),


        ]

    var weatherManager = WeatherManager()
    
    private var viewModel: WeatherViewModelProtocol
    
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
        let searchViewController = SearchViewController()
        searchViewController.modalPresentationStyle = UIModalPresentationStyle.fullScreen
        present(searchViewController, animated: false, completion: nil)
    }
    
    init(viewModel: WeatherViewModelProtocol = CurrentWeatherViewModel()) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)

        self.viewModel.updateUI = { [weak self] weatherData in
            guard let self else { return }
            DispatchQueue.main.async {
                self.mainView.cityLabel.text = weatherData.name
                self.mainView.countryLabel.text = weatherData.sys.country
                self.mainView.currentTemperatureLabel.text = "\(weatherData.main.temp) °C"
                self.mainView.windSpeed.text = "\(weatherData.wind.speed) mph"
                self.mainView.visibilityDistance.text = "\((weatherData.visibility)) miles"
                self.mainView.humidityPercentage.text = "\(weatherData.main.humidity) %"
                self.mainView.airPressureValue.text = "\(weatherData.main.pressure) mb"
            }
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
//    func updateUI(weatherData: WeatherData, dailyWeatherData: dailyWeatherData) {   //in the viewController?
//        DispatchQueue.main.async {
//            self.mainView.cityLabel.text = weatherData.name
//            self.mainView.countryLabel.text = weatherData.sys.country
//            self.mainView.currentTemperatureLabel.text = "\(self.weatherModel.temperature) °C"
//            self.mainView.windSpeed.text = "\(self.weatherModel.windSpeed) mph"
//            self.mainView.visibilityDistance.text = "\(self.weatherModel.visibility) miles"
//            self.mainView.humidityPercentage.text = "\(self.weatherModel.humidity) %"
//            self.mainView.airPressureValue.text = "\(self.weatherModel.airPressure) mb"
//            //CollectionView
//        }
//    }
    
//    mainView.currentTemperatureLabel.text = "\(self.weatherModel.temperature) °C"
//    mainView.windSpeed.text = "\(self.weatherModel.windSpeed) mph"
//    mainView.visibilityDistance.text = "\(self.weatherModel.visibility) miles"
//    mainView.humidityPercentage.text = "\(self.weatherModel.humidity) %"
//    mainView.airPressureValue.text = "\(self.weatherModel.airPressure) mb"
}


extension MainViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dailyModel.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "weatherCollectionViewCell", for: indexPath) as! CollectionViewCell
        let data = dailyModel[indexPath.item]
        cell.configure(with: data)
        
        return cell
    }
}
