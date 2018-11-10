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

    @IBOutlet var calendarView: FSCalendar!
    
    var realm: Realm! //利便性のためにパブリックな変数で宣言しておく。
    var diaries: Results<Diary>! //日記のデータを保存しておくための変数。
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        calendarView.delegate = self
        calendarView.dataSource = self
        print(Realm.Configuration.defaultConfiguration.fileURL!) // DBのファイルの場所
        realm = try! Realm() // realmをインスタンス化
        
        setGradient()
    }
    
}

extension CalendarViewController: FSCalendarDataSource, FSCalendarDelegate {
    
    func calendar(_ calendar: FSCalendar, didSelect date: Date, at monthPosition: FSCalendarMonthPosition) {
        
        if let diary = realm.objects(Diary.self).filter("postDate== %@", date).first {
            let showDiaryVC = UIStoryboard(name: "ShowDiaryViewController", bundle: nil).instantiateInitialViewController() as! ShowDiaryViewController
            showDiaryVC.diary = diary
            present(showDiaryVC, animated: true, completion: nil)
        }else {
            // 画面遷移を行う。
            let makeDiaryVC = UIStoryboard(name: "MakeDiaryViewController", bundle: nil).instantiateInitialViewController() as! MakeDiaryViewController
            makeDiaryVC.date = date
            present(makeDiaryVC, animated: true, completion: nil)
        }
    }
}
