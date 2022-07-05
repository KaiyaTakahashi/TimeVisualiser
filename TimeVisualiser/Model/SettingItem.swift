//
//  SettingItem.swift
//  TimeVisualiser
//
//  Created by Kaiya Takahashi on 2022-07-03.
//

import UIKit

struct SettingItem {
    let category: String
    let name: String
    let image: UIImage?
}

extension SettingItem: Hashable {
    func hash(into hasher: inout Hasher) {
        hasher.combine(name)
    }
    
    static func == (lhs: SettingItem, rhs: SettingItem) -> Bool {
        return lhs.name == rhs.name
    }
}
