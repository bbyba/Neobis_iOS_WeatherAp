//
//  ViewModel.swift
//

import Foundation

protocol WeatherViewModelProtocol {
    
    var didTapSearch: (() -> Void)? { get set }
    
    //
    
    func fetchWeatherData(cityName: String)

}

class CurrentWeatherViewModel {
    

}
