//
//  CalendarViewController.swift
//  TimeVisualiser
//
//  Created by Kaiya Takahashi on 2022-07-08.
//

import UIKit

class CalendarViewController: UIViewController {

    @IBOutlet var monthYearLabel: UILabel!
    @IBOutlet var previousMonthBtn: UIButton!
    @IBOutlet var nextMonthBtn: UIButton!
    @IBOutlet var calendarCollectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    @IBAction func previousMonthBtnTapped(_ sender: UIButton) {
    }
    @IBAction func nextMonthBtnTapped(_ sender: UIButton) {
    }
}
