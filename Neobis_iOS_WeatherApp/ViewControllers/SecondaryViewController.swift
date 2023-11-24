//
//  SecondaryViewController.swift
//  Neobis_iOS_WeatherApp
//
//  Created by Burte Bayaraa on 2023.11.24.
//

import UIKit

class WeatherSearchViewController: UIViewController {
    let secondaryView = WeatherSearchView()
    
    lazy var closeButton: UIButton = {
        let button = UIButton()
        button.setBackgroundImage(UIImage(systemName: "xmark.circle"), for: .normal)
        button.tintColor = .black
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(secondaryView)
        configureNavBar()
    }
    
    func setupConstraintsSecondaryView(){
        secondaryView.snp.makeConstraints { make in
            make.top.leading.trailing.bottom.equalToSuperview()
        }
    }
    
    func configureNavBar() {
        let closeButton = UIBarButtonItem(barButtonSystemItem: .search, target: self, action: #selector(didTapCloseButton))
        navigationItem.rightBarButtonItem = closeButton
    }
    
    func addTargets(){
        closeButton.addTarget(self, action: #selector(didTapCloseButton(_ :)), for: .touchUpInside)
    }
    
    @objc func didTapCloseButton(_ sender: UIButton) {
        self.dismiss(animated: false, completion: nil)
    }
}
