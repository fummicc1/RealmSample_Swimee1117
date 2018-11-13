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
        
        titleLabel.text = diary.title
        contentLabel.text = diary.content
        
        setGradient()
        
        realm = try! Realm()
    }
    
    @IBAction func tappedBackButton() {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func tappedDeleteButton() {
        
        deleteObject()
        dismiss(animated: true, completion: nil)
    }
    
    /// ここでrealmのオブジェクトを削除する。
    func deleteObject() {
    }
}
