//
//  TempViewController.swift
//  TimeVisualiser
//
//  Created by Kaiya Takahashi on 2022-07-04.
//

import UIKit

class TempViewController: UIViewController{

    var label: UILabel = {
        var label = UILabel()
        label.textColor = .white
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(label)
        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            label.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
        label.translatesAutoresizingMaskIntoConstraints = false
    }
    
}

