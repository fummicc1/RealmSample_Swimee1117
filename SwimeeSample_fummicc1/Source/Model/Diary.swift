import Foundation
import RealmSwift //ここを忘れずに

//Realmに保存したいオブジェクトのクラスを作成。
class Diary: Object {
    @objc dynamic var title: String!
    @objc dynamic var content: String!
    @objc dynamic var postDate: Date!
}
