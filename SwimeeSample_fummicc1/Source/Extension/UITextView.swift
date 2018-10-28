//
//  UITextView.swift
//  SwimeeSample_fummicc1
//
//  Created by Fumiya Tanaka on 2018/10/28.
//  Copyright © 2018 Fumiya Tanaka. All rights reserved.
//

import Foundation
import UIKit

extension UITextView: UITextViewDelegate {
    
    func setCloseKeyBoardButton() {
        
        let spaceButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: self, action: nil)
        let closeKeyBoardButton = UIBarButtonItem(title: "完了", style: .plain, target: self, action: #selector(self.closeKeyBoard))
        let inputView = UIToolbar(frame: CGRect(x: 0, y: 0, width: self.frame.maxX, height: 50))
        inputView.items = [spaceButton, closeKeyBoardButton]
        inputAccessoryView = inputView
    }
    
    @objc func closeKeyBoard() {
        self.endEditing(true) //キーボードを閉じるコード
    }
}
