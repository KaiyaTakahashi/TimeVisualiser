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
        label.font = .boldSystemFont(ofSize: 17)
        return label
    }()
}
