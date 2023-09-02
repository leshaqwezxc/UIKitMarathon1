//
//  ViewController.swift
//  UIKitMarathon
//
//  Created by alexeituszowski on 01.09.2023.
//

import UIKit

class ViewController: UIViewController {
    
    private let gradientView: UIView = {
        let view = UIView()
        view.layer.shadowOffset = CGSize(width: 10,
                                         height: 10)
        view.layer.shadowRadius = 5
        view.layer.shadowOpacity = 0.3
        return view
    }()
    
    private let gradientLayer: CAGradientLayer = {
        let layer = CAGradientLayer()
        layer.startPoint = CGPoint(x: -0.2, y: -0.2)
        layer.endPoint = CGPoint(x: 0.8, y: 0.8)
        layer.colors = [UIColor.systemBlue.cgColor, UIColor.systemRed.cgColor]
        return layer
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(gradientView)
        gradientView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            gradientView.widthAnchor.constraint(equalToConstant: 120),
            gradientView.heightAnchor.constraint(equalToConstant: 120),
            gradientView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 100),
            gradientView.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
    
    override func viewDidLayoutSubviews() {
        gradientLayer.frame = gradientView.bounds
        gradientView.layer.insertSublayer(gradientLayer, at: 0)
        let cornerRadii = CGSize(width: 10.0, height: 0.0)
        let maskPath = UIBezierPath(roundedRect: gradientView.bounds,
                                    byRoundingCorners: [.allCorners],
                                    cornerRadii: cornerRadii)
        let maskLayer = CAShapeLayer()
        maskLayer.path = maskPath.cgPath
        gradientLayer.mask = maskLayer
    }
}

