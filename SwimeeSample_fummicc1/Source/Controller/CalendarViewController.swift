//
//  ViewController.swift
//  SwimeeSample_fummicc1
//
//  Created by Fumiya Tanaka on 2018/10/28.
//  Copyright © 2018 Fumiya Tanaka. All rights reserved.
//

import UIKit
import FSCalendar
import RealmSwift

class CalendarViewController: UIViewController {

    var realm: Realm! //利便性のためにパブリックな変数で宣言しておく。
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // realmをインスタンス化
        
    }
    
}

extension CalendarViewController: FSCalendarDataSource, FSCalendarDelegate {
    
    func calendar(_ calendar: FSCalendar, didSelect date: Date, at monthPosition: FSCalendarMonthPosition) {
        
        let selectedDateComponents: (Int, Int, Int) = getDay(date) //現在の日付を取得
        
        // 画面遷移を行う。
        let diaryVC = UIStoryboard(name: "DiaryViewController", bundle: nil).instantiateInitialViewController() as! DiaryViewController
        present(diaryVC, animated: true, completion: nil)
    }
}
