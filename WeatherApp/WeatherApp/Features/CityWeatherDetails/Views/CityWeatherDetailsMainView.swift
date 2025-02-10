//
//  DetailsWeatherMainDetailsView.swift
//  WeatherApp
//
//  Created by Sebastian Maludziński on 07/02/2025.
//

import UIKit

final class CityWeatherDetailsMainView: UIView {
    
    // MARK: - Properties
    
    private var state: ViewState = .loading {
        didSet {
            updateViewForState()
        }
    }
    
    private let progressView: UIActivityIndicatorView = {
        let progress = UIActivityIndicatorView(style: .medium)
        progress.translatesAutoresizingMaskIntoConstraints = false
        progress.startAnimating()
        return progress
    }()
    
    private let contentView: CityWeatherDetailsView = {
        let view = CityWeatherDetailsView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    // MARK: - Lifecycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    // MARK: - API
    
    func configureView(with weatherData: WeatherData, and city: City) {
        contentView.configureView(with: weatherData, and: city)
        state = .correctlyLoaded
    }
    
    // MARK: - Methods
    
    private func setupView() {
        backgroundColor = .tertiarySystemBackground
        
        addSubview(progressView)
        addSubview(contentView)
        
        NSLayoutConstraint.activate([
            progressView.centerXAnchor.constraint(equalTo: centerXAnchor),
            progressView.centerYAnchor.constraint(equalTo: centerYAnchor),
            
            contentView.widthAnchor.constraint(equalTo: widthAnchor),
            contentView.heightAnchor.constraint(equalTo: heightAnchor)
        ])
        
        contentView.isHidden = true
    }
    
    private func updateViewForState() {
        DispatchQueue.main.async { [weak self] in
            guard let self else { return }
            switch state {
            case .loading:
                progressView.isHidden = false
                contentView.isHidden = true
            case .correctlyLoaded:
                progressView.isHidden = true
                contentView.isHidden = false
            }
        }
    }
    
}
