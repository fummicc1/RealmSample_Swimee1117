//
//  Diary.swift
//  SwimeeSample_fummicc1
//
//  Created by Fumiya Tanaka on 2018/10/28.
//  Copyright © 2018 Fumiya Tanaka. All rights reserved.
//

import Foundation
import RealmSwift //ここを忘れずに

//Realmに保存したいオブジェクトのクラスを作成。
class Diary: Object {
    
    @objc dynamic var title: String!
    @objc dynamic var content: String!
    @objc dynamic var postDate: Date!
}
