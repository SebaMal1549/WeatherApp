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
    lazy var userTappedCityCell = _userTappedCityCell.eraseToAnyPublisher()
    private let _userTappedCityCell = PassthroughSubject<City, Never>()
    
    // MARK: - Properties
    
    var cities = [City]() {
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

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        cities.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CityCell.identifier, for: indexPath) as? CityCell else {
            let cell = UITableViewCell()
            cell.textLabel?.text = cities[indexPath.row].name
            return cell
        }
        
        cell.configureCell(with: cities[indexPath.row])
        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        _userTappedCityCell.send(cities[indexPath.row])
    }

}
