import UIKit
import RealmSwift

class MakeDiaryViewController: UIViewController {

    @IBOutlet var titleTextField: UITextField!
    @IBOutlet var contentTextView: UITextView!
    
    var date: Date!
    var realm: Realm! // 同じく、利便性のためにパブリック変数で宣言
    
    override func viewDidLoad() {
        super.viewDidLoad()
        contentTextView.setCloseKeyBoardButton() //キーボードに閉じるボタンを設定。
        contentTextView.showPlaceHolder()
        contentTextView.delegate = self
        titleTextField.delegate = self
        setGradient()
        realm = try! Realm() //realmのインスタンス生成
    }
    
    /// check if text exsits.
    ///
    /// - Parameter text: チェックしたいテキスト
    /// - Returns: falseなら文字が入ってて、trueなら空欄
    func checkTextIsEmpty(text: String) -> Bool {
        if text.isEmpty {
            return true
        }else {
            return false
        }
    }
    
    //日記を保存する処理を書こう。
    @IBAction func save() {
        if checkTextIsEmpty(text: titleTextField.text!) || checkTextIsEmpty(text: contentTextView.text!) {
            return
        }
        createObject()
        dismiss(animated: true, completion: nil)
    }

    @IBAction func tappedBackButton() {
        dismiss(animated: true, completion: nil)
    }
    
    /// ここでrealmにデータを保存していく。
    func createObject() {
        let diary = Diary()
        diary.title = titleTextField.text!
        diary.content = contentTextView.text!
        diary.postDate = date
        try! realm.write {
            realm.add(diary)
        }
    }
}
