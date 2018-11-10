

import RealmSwift
//: realmのインスタンスは何回作っても共通
let realm = try! Realm() //Realmのデータベースを作成

let realm2 = try! Realm() //Realmのデータベースを作成

//: Realmのデータベースにデータを追加する。

realm.add() // ()の中に保存したい物をかく。

//: このままだと落ちます。

try! realm.write {
    realm.add() // ()の中に保存したい物をかく。
}

//: `realm.write`の中に書いてあげましょう。

//: 保存したいオブジェクトを宣言

class Diary: Object {
    
    @objc var title: String = ""
    @objc var content: String = ""
    @objc var date: Date!
}

//: クラスには`Object`クラスを継承して、変数には`@objc`をつけましょう。
