//
//  Coordinator+Extension.swift
//  WeatherApp
//
//  Created by Sebastian Maludziński on 10/02/2025.
//

import Foundation

extension Coordinator {

    func removeChild(_ coordinator: Coordinator?) {
        children.removeAll(where: { $0 === coordinator})
    }

    func finish() {
        parentCoordinator?.removeChild(self)
    }

}
