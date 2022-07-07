//
//  NamedSectionHeaderCollectionReusableView.swift
//  TimeVisualiser
//
//  Created by Kaiya Takahashi on 2022-07-04.
//

import UIKit

class NamedSectionHeaderCollectionReusableView: UICollectionReusableView {
        
    var nameLabel: UILabel = {
        var label = UILabel()
        label.textColor = .black
        label.font = .boldSystemFont(ofSize: 17)
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
    }
    
    func setupView() {
        addSubview(nameLabel)
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            nameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 50),
            nameLabel.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
}
