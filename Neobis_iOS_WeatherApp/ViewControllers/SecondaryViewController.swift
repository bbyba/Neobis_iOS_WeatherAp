//
//  SecondaryViewController.swift
//  Neobis_iOS_WeatherApp
//
//  Created by Burte Bayaraa on 2023.11.24.
//

import UIKit

class WeatherSearchViewController: UIViewController {
    let secondaryView = WeatherSearchView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(secondaryView)
        setupConstraintsSecondaryView()
        addTargets()
    }
    
    func setupConstraintsSecondaryView(){
        secondaryView.snp.makeConstraints { make in
            make.top.leading.trailing.bottom.equalToSuperview()
        }
    }
    
    func addTargets(){
        secondaryView.closeButton.addTarget(self, action: #selector(didTapCloseButton(_ :)), for: .touchUpInside)
    }
    
    @objc func didTapCloseButton(_ sender: UIButton) {
        self.dismiss(animated: false, completion: nil)
    }
}
