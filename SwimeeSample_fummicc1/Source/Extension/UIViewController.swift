//
//  UIViewController.swift
//  SwimeeSample_fummicc1
//
//  Created by Fumiya Tanaka on 2018/10/28.
//  Copyright © 2018 Fumiya Tanaka. All rights reserved.
//

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
