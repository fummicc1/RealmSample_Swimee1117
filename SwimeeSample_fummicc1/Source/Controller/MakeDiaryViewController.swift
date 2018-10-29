//
//  DiaryViewController.swift
//  SwimeeSample_fummicc1
//
//  Created by Fumiya Tanaka on 2018/10/28.
//  Copyright © 2018 Fumiya Tanaka. All rights reserved.
//

import UIKit
import RealmSwift

class MakeDiaryViewController: UIViewController {

    @IBOutlet var titleTextField: UITextField!
    @IBOutlet var contentTextView: UITextView!
    
    var date: Date!
    var realm: Realm! // 同じく、利便性のためにパブリック変数で宣言
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        realm = try! Realm() //realmのインスタンス生成
        contentTextView.setCloseKeyBoardButton() //キーボードに閉じるボタンを設定。
    }
    
    //日記を保存する処理を書こう。
    @IBAction func save() {
        
        let diary = Diary() // 日記のオブジェクトを作成。
        diary.title = titleTextField.text!
        diary.content = contentTextView.text!
        diary.postDate = date
        
        try! realm.write {
            realm.add(diary)
        }
        
        dismiss(animated: true, completion: nil)
    }

    @IBAction func tappedBackButton() {
        dismiss(animated: true, completion: nil)
    }
}
