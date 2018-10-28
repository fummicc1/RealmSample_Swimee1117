//
//  UIViewController.swift
//  SwimeeSample_fummicc1
//
//  Created by Fumiya Tanaka on 2018/10/28.
//  Copyright © 2018 Fumiya Tanaka. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController {
    
    // Date型から数字を取得。　ex: 2018年12月21日 -> (2018, 12, 21) が返ってくる。
    func getDay(_ date: Date) -> (Int, Int, Int) {
        
        let tempCalendar = Calendar(identifier: Calendar.Identifier.gregorian)
        let year = tempCalendar.component(Calendar.Component.year, from: date)
        let month = tempCalendar.component(Calendar.Component.month, from: date)
        let day = tempCalendar.component(Calendar.Component.day, from: date)
        return (year, month, day)
    }
}
