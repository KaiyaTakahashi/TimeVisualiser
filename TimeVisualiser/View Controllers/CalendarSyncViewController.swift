//
//  CalendarSyncViewController.swift
//  TimeVisualiser
//
//  Created by Kaiya Takahashi on 2022-07-07.
//

import UIKit

class CalendarSyncViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    init?(coder: NSCoder, item: SettingItem) {
        super.init(coder: coder)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
