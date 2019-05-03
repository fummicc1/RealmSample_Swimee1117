import Foundation
import UIKit

extension CalendarViewController {
    
    /// Date型から数字を取得。　ex: 2018年12月21日 -> (2018, 12, 21) が返ってくる。
    ///
    /// - Parameter date: 指定したい日時を選択
    /// - Returns: (年, 月, 日)が出力
    func getDay(_ date: Date) -> (Int, Int, Int) {
        let tempCalendar = Calendar(identifier: Calendar.Identifier.gregorian)
        let year = tempCalendar.component(Calendar.Component.year, from: date)
        let month = tempCalendar.component(Calendar.Component.month, from: date)
        let day = tempCalendar.component(Calendar.Component.day, from: date)
        return (year, month, day)
    }
}

extension MakeDiaryViewController: UITextViewDelegate {
    public func textViewShouldBeginEditing(_ textView: UITextView) -> Bool {
        // textViewはcontentを表示するUILabelだったり
        for view in textView.subviews {
            if let label = view as? UILabel {
                label.removeFromSuperview()
            }
        }
        return true
    }
    
    public func textViewShouldEndEditing(_ textView: UITextView) -> Bool {
        if textView.text.count == 0 {
            textView.showPlaceHolder()
        }
        return true
    }
}

extension MakeDiaryViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}

extension UIViewController {
    
    func setGradient() {
        //グラデーションの開始色
        let topColor = UIColor(red:76/255, green:217/255, blue:100/255, alpha:1)
        //グラデーションの開始色
        let bottomColor = UIColor(red: 90/255, green: 200/255, blue: 250/255, alpha:1)
        //グラデーションの色を配列で管理
        let gradientColors: [CGColor] = [topColor.cgColor, bottomColor.cgColor]
        //グラデーションレイヤーを作成
        let gradientLayer: CAGradientLayer = CAGradientLayer()
        //グラデーションの色をレイヤーに割り当てる
        gradientLayer.colors = gradientColors
        //グラデーションレイヤーをスクリーンサイズにする
        gradientLayer.frame = view.bounds
        view.layer.insertSublayer(gradientLayer, at: 0)
    }
}
