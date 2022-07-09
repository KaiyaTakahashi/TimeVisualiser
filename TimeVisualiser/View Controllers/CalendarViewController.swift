//
//  CalendarViewController.swift
//  TimeVisualiser
//
//  Created by Kaiya Takahashi on 2022-07-08.
//

import UIKit

class CalendarViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {

    @IBOutlet var monthYearLabel: UILabel!
    @IBOutlet var previousMonthBtn: UIButton!
    @IBOutlet var nextMonthBtn: UIButton!
    @IBOutlet var calendarCollectionView: UICollectionView!
    
    var selectedDate = Date()
    var totalSquares = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    func setupCell() {
        let width = (calendarCollectionView.frame.size.width - 2) / 8
        let height = (calendarCollectionView.frame.size.height - 2) / 8
        
        let flowLayout = calendarCollectionView.collectionViewLayout as! UICollectionViewFlowLayout
        flowLayout.itemSize = CGSize(width: width, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = calendarCollectionView.dequeueReusableCell(withReuseIdentifier: "CalCell", for: indexPath) as! CalendarCollectionViewCell
        cell.dayOfMonth.text = totalSquares[indexPath.item]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return totalSquares.count
    }


    @IBAction func previousMonthBtnTapped(_ sender: UIButton) {
    }
    @IBAction func nextMonthBtnTapped(_ sender: UIButton) {
    }
}
