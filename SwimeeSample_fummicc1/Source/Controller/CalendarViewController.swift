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
        
        // DBのファイルの場所
        print(Realm.Configuration.defaultConfiguration.fileURL!)
        
        // realmをインスタンス化
        
    }
    
}

extension CalendarViewController: FSCalendarDataSource, FSCalendarDelegate {
    
    func calendar(_ calendar: FSCalendar, didSelect date: Date, at monthPosition: FSCalendarMonthPosition) {
        
    
        // 画面遷移を行う。
        let diaryVC = UIStoryboard(name: "MakeDiaryViewController", bundle: nil).instantiateInitialViewController() as! MakeDiaryViewController
        diaryVC.date = date
        present(diaryVC, animated: true, completion: nil)
    }
}
