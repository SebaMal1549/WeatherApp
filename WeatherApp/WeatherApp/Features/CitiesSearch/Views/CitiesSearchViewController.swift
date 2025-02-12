//
//  ViewController.swift
//  WeatherApp
//
//  Created by Sebastian Maludziński on 04/02/2025.
//

import CombineCocoa
import Combine
import UIKit

/// ViewController for CitiesSearch feature.
final class CitiesSearchViewController: UIViewController {

    // MARK: - Properties

    private let viewModel: CitiesSearchViewModel
    private let customView = CitiesSearchView()

    private var cancellables = [AnyCancellable]()

    // MARK: - Lifecycle

    init(viewModel: CitiesSearchViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
        bindEvents()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func loadView() {
        view = customView
        title = "Wyszukiwarka miast"
    }

    // MARK: - API

    func clearSearchText() {
        customView.clearSearchText()
    }

    // MARK: - Methods

    private func bindEvents() {
        customView.textFieldPublisher
            .map { .userEditedSearchText($0) }
            .subscribe(viewModel.eventsSubject)
            .store(in: &cancellables)

        customView.userTappedCityCellPublisher
            .map { .userTappedCityCell($0) }
            .subscribe(viewModel.eventsSubject)
            .store(in: &cancellables)

        customView.userDeletedSavedCityPublisher
            .map { .userDeletedSavedCity($0) }
            .subscribe(viewModel.eventsSubject)
            .store(in: &cancellables)

        viewModel.citiesListFetchedPublisher
            .sink { [weak self] event in
                guard let self else { return }
                customView.reloadCities(with: event)
            }
            .store(in: &cancellables)
    }

}
