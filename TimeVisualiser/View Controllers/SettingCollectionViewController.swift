//
//  SettingCollectionViewController.swift
//  TimeVisualiser
//
//  Created by Kaiya Takahashi on 2022-07-03.
//

import UIKit

private let reuseIdentifier = "Cell"

let settingItems = [
    SettingItem(category: "Account", name: "View profile", image: UIImage(systemName: "person.fill")),
    SettingItem(category: "Account", name: "View goals", image: UIImage(systemName: "target")),
    SettingItem(category: "Setting", name: "Calendar Sync", image: UIImage(systemName: "calendar")),
    SettingItem(category: "Setting", name: "Notification", image: UIImage(systemName: "person")),
    SettingItem(category: "Setting", name: "Preferences", image: UIImage(systemName: "person"))
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
        var itemsBySection = [SettingItem]()
    }
    
    var model = Model()
    var dataSource: DataSourceType!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.register(NamedSectionHeaderCollectionReusableView.self, forSupplementaryViewOfKind: "SectionHeader", withReuseIdentifier: "HeaderView")
        createDataSource()
        update()
        createLayout()
    }
    
    func update() {
        model.itemsBySection = settingItems
        
        self.updateCollectionView()
    }
    
    func updateCollectionView() {
        let sectionItems = model.itemsBySection.reduce(into: [ViewModel.Section: [ViewModel.Item]]()) { partialResult, item in
            let section: ViewModel.Section
            if item.category == "Account" {
                section = .account
            } else {
                section = .setting
            }
            partialResult[section, default: []].append(item)
        }
        let sectionIDs = sectionItems.keys.sorted { $0.rawValue < $1.rawValue }
        
        dataSource.applySnapshotUsing(SectionIDs: sectionIDs, itemsBySection: sectionItems)
    }
    
    func createDataSource() {
        self.dataSource = DataSourceType(collectionView: collectionView, cellProvider: { (collectionView, indexPath, itemIdentifier) -> SettingCollectionViewCell in
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Setting", for: indexPath) as! SettingCollectionViewCell
            cell.nameLabel.text = itemIdentifier.name
            cell.image.image = itemIdentifier.image
            return cell
        })
        
        dataSource.supplementaryViewProvider = { (collectionView, kind, indexPath) in
            let header = collectionView.dequeueReusableSupplementaryView(ofKind: "SectionHeader", withReuseIdentifier: "HeaderView", for: indexPath) as! NamedSectionHeaderCollectionReusableView
            let section = self.dataSource.snapshot().sectionIdentifiers[indexPath.section]
            
            switch section {
            case .setting:
                header.backgroundColor = .systemGray4
                header.nameLabel.text = "Setting"
            case .account:
                header.backgroundColor = .systemGray3
                header.nameLabel.text = "Account"
            }
            return header
        }
    }
    
    func createLayout() {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(60))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(50))
        let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitem: item, count: 1)
        let section = NSCollectionLayoutSection(group: group)
        let headerSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(55))
        let header = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: headerSize, elementKind: "SectionHeader", alignment: .top)
        section.boundarySupplementaryItems = [header]
        section.supplementariesFollowContentInsets = false
        collectionView.collectionViewLayout = UICollectionViewCompositionalLayout(section: section)
    }
}
