//
//  CitiesSearchView.swift
//  WeatherApp
//
//  Created by Sebastian Maludziński on 05/02/2025.
//

import Combine
import UIKit

/// City search view.
final class CitiesSearchView: UIView {
    
    // MARK: - Publishers
    
    /// Publisher responsible for informing that the user has selected some cell in the list of cities.
    lazy var userTappedCityCellPublisher = citiesTableViewController.userTappedCityCell
    
    /// Publisher indicating that a user has typed something in the search field.
    lazy var textFieldPublisher = textField.textPublisher
    
    // MARK: - Properties
    
    private let textField: UITextField = {
        let textField = TextFieldWithPadding()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = .secondarySystemBackground
        textField.layer.cornerRadius = 8
        textField.layer.masksToBounds = true
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor.systemGray.cgColor
        textField.placeholder = "Wyszukaj miasto..."
        return textField
    }()
    
    private let citiesTableViewController: CitiesTableViewController = {
        let tableView = CitiesTableViewController()
        tableView.view.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    // MARK: - Lifecycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - API
    
    /// The method responsible for refreshing the list of cities.
    func reloadCities(with cities: [City]) {
        citiesTableViewController.cities = cities
    }
    
    func clearSearchText() {
        textField.text = ""
    }
    
    // MARK: - Methods
    
    private func setupView() {
        backgroundColor = .tertiarySystemBackground
        
        addSubview(textField)
        addSubview(citiesTableViewController.view)
        
        NSLayoutConstraint.activate([
            textField.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            textField.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.9),
            textField.heightAnchor.constraint(equalToConstant: 40),
            textField.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            citiesTableViewController.view.topAnchor.constraint(equalTo: textField.bottomAnchor, constant: 10),
            citiesTableViewController.view.widthAnchor.constraint(equalTo: widthAnchor, constant: -40),
            citiesTableViewController.view.centerXAnchor.constraint(equalTo: centerXAnchor),
            citiesTableViewController.view.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor)
        ])
    }

}
