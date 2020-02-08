//
//  PDButton.swift
//  Package Dash
//
//  Created by Jerry Turcios on 2/8/20.
//  Copyright © 2020 Jerry Turcios. All rights reserved.
//

import UIKit

class PDButton: UIButton {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupStyling()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupStyling()
    }

    private func setupStyling() {
        // Configures the color for the button
        self.backgroundColor = .systemBlue
        self.tintColor = .white

        // Configures the visual border for the button
        self.layer.borderColor = UIColor.systemBlue.cgColor
        self.layer.cornerRadius = 10
    }
}
