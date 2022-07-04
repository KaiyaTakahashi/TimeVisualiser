//
//  SettingCollectionViewController.swift
//  TimeVisualiser
//
//  Created by Kaiya Takahashi on 2022-07-03.
//

import UIKit

private let reuseIdentifier = "Cell"

let settingItems = [
    "Account": SettingItem(name: "View profile", image: nil),
    "Account": SettingItem(name: "View goals", image: nil),
    "Setting": SettingItem(name: "Calendar Sync", image: UIImage(systemName: "calendar")),
    "Setting": SettingItem(name: "Notification", image: nil),
    "Setting": SettingItem(name: "Preferences", image: nil)
]

class SettingCollectionViewController: UICollectionViewController {
    
    typealias DataSourceType = UICollectionViewDiffableDataSource<ViewModel.Section, ViewModel.Item>
    
    enum ViewModel {
        enum Section: String {
            case account
            case setting
            
            var identifier: String {
                return rawValue
            }
        }
        
        typealias Item = SettingItem
    }
    
    struct Model {
        var itemsBySection = [String: SettingItem]()
    }
    
    var model = Model()
    var dataSource: DataSourceType!

    override func viewDidLoad() {
        super.viewDidLoad()

        self.collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)
    }
    
    func update() {
        model.itemsBySection = settingItems
        
        self.updateCollectionView()
    }
    
    func updateCollectionView() {
        let itemsBySection = model.itemsBySection.values.sorted { $0.name > $1.name }
        let sectionIDs = model.itemsBySection.keys.sorted()
        
    }
    
}
