//
//  ShowDiaryViewController.swift
//  SwimeeSample_fummicc1
//
//  Created by Fumiya Tanaka on 2018/10/28.
//  Copyright © 2018 Fumiya Tanaka. All rights reserved.
//

import UIKit
import RealmSwift

class ShowDiaryViewController: UIViewController {

    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var contentLabel: UILabel!
    
    var realm: Realm! //パブリック変数にしてどこでも呼べるようにしておく
    var diary: Diary! //表示する日記のオブジェクト
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        realm = try! Realm()
        
        titleLabel.text = diary.title
        contentLabel.text = diary.content
        
        setGradient()
    }
    
    @IBAction func tappedBackButton() {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func tappedDeleteButton() {
        
        // データの更新はwriteメソッドの中でしないといけない
        try! realm.write {
            realm.delete(diary)
        }
        dismiss(animated: true, completion: nil)
    }
}
