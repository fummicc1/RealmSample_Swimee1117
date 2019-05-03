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
    var realm: Realm!
    
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
        realm = try! Realm()
    }
}

extension CalendarViewController: FSCalendarDataSource, FSCalendarDelegate {
    
    func calendar(_ calendar: FSCalendar, didSelect date: Date, at monthPosition: FSCalendarMonthPosition) {
        /*
         カレンダーがタップされたら
            1. タップした日付からもうすでにその日の日記が書かれているかを調べる。
            2. すでに日記があったら、ShowDiaryViewControllerへ画面遷移。無ければ、MakeDiaryViewControllerへ画面遷移。
         */
        if let diary = realm.objects(Diary.self).filter("postDate=%@", date).first {
            let showVC = UIStoryboard(name: "ShowDiaryViewController", bundle: nil).instantiateInitialViewController() as! ShowDiaryViewController
            showVC.diary = diary
            present(showVC, animated: true, completion: nil)
        }else {
            let makeVC = UIStoryboard(name: "MakeDiaryViewController", bundle: nil).instantiateInitialViewController() as! MakeDiaryViewController
            makeVC.date = date
            present(makeVC, animated: true, completion: nil)
        }
    }
}
