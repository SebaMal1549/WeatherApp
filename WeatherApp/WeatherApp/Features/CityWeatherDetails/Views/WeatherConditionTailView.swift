//
//  WeatherConditionTailView.swift
//  WeatherApp
//
//  Created by Sebastian Maludziński on 07/02/2025.
//

import UIKit

/// A view showing the weather tile.
final class WeatherConditionTileView: UIView {
    
    // MARK: - Properties
    
    private let mainStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.alignment = .leading
        stackView.spacing = 5
        stackView.backgroundColor = .systemGroupedBackground
        stackView.layer.cornerRadius = 10
        stackView.layer.masksToBounds = true
        stackView.layoutMargins = UIEdgeInsets(top: 10, left: 15, bottom: 10, right: 15)
        stackView.isLayoutMarginsRelativeArrangement = true
        return stackView
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 9, weight: .medium)
        label.textColor = .secondaryLabel
        return label
    }()
    
    private let valueLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16, weight: .bold)
        label.textColor = .label
        return label
    }()
    
    // MARK: - Lifecycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - API
    
    func reloadView(title: String, value: String) {
        titleLabel.text = title.uppercased()
        valueLabel.text = value
    }
    
    // MARK: - Methods
    
    private func setupView() {
        addSubview(mainStackView)
        mainStackView.addArrangedSubview(titleLabel)
        mainStackView.addArrangedSubview(valueLabel)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            mainStackView.heightAnchor.constraint(equalTo: heightAnchor),
            mainStackView.widthAnchor.constraint(equalTo: widthAnchor),
        ])
    }

}
