//
//  TextFieldWithPadding.swift
//  WeatherApp
//
//  Created by Sebastian Maludziński on 06/02/2025.
//

import Foundation
import UIKit

/// Text field with padding.
final class TextFieldWithPadding: UITextField {

    // MARK: - Properties

    /// Pudding value for the field.
    private let inset: CGFloat

    // MARK: - Lifecycle

    init(inset: CGFloat = 10) {
        self.inset = inset
        super.init(frame: .zero)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - API

    override func textRect(forBounds: CGRect) -> CGRect {
        forBounds.insetBy(dx: inset, dy: inset)
    }

    override func editingRect(forBounds: CGRect) -> CGRect {
        forBounds.insetBy(dx: inset, dy: inset)
    }

    override func placeholderRect(forBounds: CGRect) -> CGRect {
        forBounds.insetBy(dx: inset, dy: inset)
    }

}
