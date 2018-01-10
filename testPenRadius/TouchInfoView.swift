//
//  TouchInfoView.swift
//  testPenRadius
//
//  Created by Water Lou on 8/1/2018.
//  Copyright © 2018 Water Lou. All rights reserved.
//

import UIKit

class TouchInfoView: UIView {
    weak var touch: UITouch?

    let stackView: UIStackView = UIStackView()
    let typeLabel: UILabel = UILabel()
    let locationLabel: UILabel = UILabel()
    let radiusLabel: UILabel = UILabel()
    let radiusTolerenceLabel: UILabel = UILabel()    
    let forceLabel: UILabel = UILabel()

    func setupSelf() {
        stackView.frame = self.bounds.insetBy(dx: 0, dy: 5)
        stackView.axis = .vertical
        stackView.spacing = 0.0
        stackView.distribution = .fillEqually
        stackView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        self.addSubview(stackView)
        
        typeLabel.textAlignment = .center
        typeLabel.font = UIFont.systemFont(ofSize: 12)
        stackView.addArrangedSubview(typeLabel)

        locationLabel.textAlignment = .center
        locationLabel.font = UIFont.systemFont(ofSize: 12)
        stackView.addArrangedSubview(locationLabel)

        radiusLabel.textAlignment = .center
        radiusLabel.font = UIFont.systemFont(ofSize: 12)
        stackView.addArrangedSubview(radiusLabel)

        radiusTolerenceLabel.textAlignment = .center
        radiusTolerenceLabel.font = UIFont.systemFont(ofSize: 12)
        stackView.addArrangedSubview(radiusTolerenceLabel)

        forceLabel.textAlignment = .center
        forceLabel.font = UIFont.systemFont(ofSize: 12)
        stackView.addArrangedSubview(forceLabel)

    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupSelf()
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupSelf()
    }
    
    var type: UITouchType = .direct {
        didSet {
            let string: String
            switch type {
            case .direct:
                string = "direct"
            case .indirect:
                string = "indirect"
            case .stylus:
                string = "stylus"
            }
            typeLabel.text = "Type: \(string)"
        }
    }
    
    var majorRadius: CGFloat = 0.0 {
        didSet {
            radiusLabel.text = "Radius: \(String(format:"%.2f", majorRadius))"
        }
    }

    var majorRadiusTolerance: CGFloat = 0.0 {
        didSet {
            radiusTolerenceLabel.text = "Toler: \(String(format:"%.2f", majorRadiusTolerance))"
        }
    }

    
    
    var force: CGFloat = 0.0 {
        didSet {
            forceLabel.text = "Force: \(String(format:"%.2f", force))"
        }
    }

    var location: CGPoint = .zero {
        didSet {
            locationLabel.text = "\(String(format:"%.1f", location.x)), \(String(format:"%.1f", location.y))"
        }
    }
}
