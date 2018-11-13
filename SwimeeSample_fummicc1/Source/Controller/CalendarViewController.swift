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
    
    /*
     realmのインスタンスの生成の仕方
     var realm = try! Realm()
    */
    // ここにrealmの宣言だけしておく。
    
    
    var diaries: Results<Diary>! //日記のデータを保存しておくための変数。
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        calendarView.delegate = self
        calendarView.dataSource = self
        setGradient()
        
        print(Realm.Configuration.defaultConfiguration.fileURL!) // DBのファイルの場所
        
        /*
         ここにrealmのインスタンスを作成しよう
         上で宣言したrealmを使う。
         */
        
    }
}

extension CalendarViewController: FSCalendarDataSource, FSCalendarDelegate {
    
    func calendar(_ calendar: FSCalendar, didSelect date: Date, at monthPosition: FSCalendarMonthPosition) {
        
        /*
         カレンダーがタップされたら
            1. タップした日付からもうすでにその日の日記が書かれているかを調べる。
            2. すでに日記があったら、ShowDiaryViewControllerへ画面遷移。無ければ、MakeDiaryViewControllerへ画面遷移。
         */
        
        
    }
}
