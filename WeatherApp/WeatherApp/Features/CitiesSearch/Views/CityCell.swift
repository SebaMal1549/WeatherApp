//
//  CityCell.swift
//  WeatherApp
//
//  Created by Sebastian Maludziński on 06/02/2025.
//


import Foundation
import UIKit

/// View used as a cell in the list of cities.
final class CityCell: UITableViewCell {
    
    // MARK: - Identifier
    
    /// Cell identifier.
    static let identifier = "CityCell"
    
    // MARK: - Properties
    
    private let mainStack: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.spacing = 3
        stack.isLayoutMarginsRelativeArrangement = true
        stack.layoutMargins = UIEdgeInsets(top: 10, left: 0, bottom: 10, right: 0)
        return stack
    }()
    
    private let cityNameLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 18, weight: .semibold)
        return label
    }()
    
    private let areaNameLabel: UILabel = {
        let label = UILabel()
        label.textColor = .secondaryLabel
        label.font = .systemFont(ofSize: 12, weight: .regular)
        return label
    }()
    
    // MARK: - Lifecycle
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - API
    
    /// The method responsible for configuring the cell using the selected city.
    func configureCell(with city: City) {
        cityNameLabel.text = city.name
        areaNameLabel.text = "\(city.country.name), \(city.area.name)"
    }
    
    // MARK: - Methods
    
    private func setupView() {
        backgroundColor = .tertiarySystemBackground
        contentView.addSubview(mainStack)
        
        mainStack.addArrangedSubview(cityNameLabel)
        mainStack.addArrangedSubview(areaNameLabel)
        
        NSLayoutConstraint.activate([
            mainStack.widthAnchor.constraint(equalTo: contentView.widthAnchor),
            mainStack.heightAnchor.constraint(equalTo: contentView.heightAnchor)
        ])
    }
    
}
