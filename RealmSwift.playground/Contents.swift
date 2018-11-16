import RealmSwift
import Foundation
import UIKit
//: realmのインスタンスはキャッシュされる。
let realm = try! Realm() //Realmのデータベースを作成

let realm2 = try! Realm() //Realmのデータベースを作成

//: Realmのデータベースにデータを追加する。

realm.add(Object()) // ()の中に保存したい物をかく。

//: このままだと落ちます。

try! realm.write {
    realm.add(Object()) // ()の中に保存したい物をかく。
}

//: `realm.write`の中に書いてあげましょう。

//: 保存したいオブジェクトを宣言

class Diary: Object {
    
    @objc var title: String = ""
    @objc var content: String = ""
    @objc var date: Date!
}

//: クラスには`Object`クラスを継承して、変数には`@objc`をつけましょう。

//: オブジェクトがStandAlone出ない限りはトランザクション内でUIの更新処理を書かないと行けない。

//: ダメな例

let diary = realm.objects(Diary.self).first!

diary.title = "new title" // 落ちる

try! realm.write {
    diary.title = "new title" // 落ちない
}
