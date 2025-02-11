//
//  CitiesTableViewController.swift
//  WeatherApp
//
//  Created by Sebastian Maludziński on 06/02/2025.
//

import Combine
import UIKit

/// ViewController responsible for the array containing the searched cities.
final class CitiesTableViewController: UITableViewController {

    // MARK: - Publisher

    /// Publisher responsible for informing that the user has selected some cell in the list of cities.
    lazy var userTappedCityCellPublisher = _userTappedCityCellSubject.eraseToAnyPublisher()
    private let _userTappedCityCellSubject = PassthroughSubject<City, Never>()

    // MARK: - Properties

    var cities = [City]() {
        didSet {
            reload()
        }
    }

    var savedCities = [City(
        area: AdministrativeArea(name: "Małopolska"),
        country: Country(name: "Polska"),
        key: "test",
        name: "Kraków",
        rank: 1
    )] {
        didSet {
            reload()
        }
    }

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.backgroundColor = .tertiarySystemBackground
        tableView.register(CityCell.self, forCellReuseIdentifier: CityCell.identifier)
    }

    // MARK: - Methods

    private func reload() {
        DispatchQueue.main.async { [weak self] in
            self?.tableView.reloadData()
        }
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int { 2 }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let section = Section(rawValue: section) else { return 0 }
        switch section {
        case .savedCities:
            return savedCities.count
        case .cities:
            return cities.count
        }
    }

    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        guard let section = Section(rawValue: section) else { return nil }
        switch section {
        case .savedCities:
            guard !savedCities.isEmpty else { return nil }
            return "Ostatnio sprawdzane miasta"
        case .cities:
            guard !cities.isEmpty else { return nil }
            return "Wyniki wyszukiwania"
        }
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let section = Section(rawValue: indexPath.section),
              let cell = tableView.dequeueReusableCell(withIdentifier: CityCell.identifier,
                                                       for: indexPath) as? CityCell else {
            let cell = UITableViewCell()
            cell.textLabel?.text = cities[indexPath.row].name
            return cell
        }

        switch section {
        case .savedCities:
            cell.configureCell(with: savedCities[indexPath.row])
        case .cities:
            cell.configureCell(with: cities[indexPath.row])
        }

        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let section = Section(rawValue: indexPath.section) else { return }
        switch section {
        case .savedCities:
            _userTappedCityCellSubject.send(savedCities[indexPath.row])
        case .cities:
            _userTappedCityCellSubject.send(cities[indexPath.row])
        }
    }

    override func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        guard let header = view as? UITableViewHeaderFooterView else { return }
        header.textLabel?.textAlignment = .left
        header.textLabel?.frame = CGRect(x: 0, y: 0, width: tableView.frame.width, height: header.frame.height)
    }

}
