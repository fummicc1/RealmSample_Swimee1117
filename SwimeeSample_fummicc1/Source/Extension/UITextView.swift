//
//  UITextView.swift
//  SwimeeSample_fummicc1
//
//  Created by Fumiya Tanaka on 2018/10/28.
//  Copyright © 2018 Fumiya Tanaka. All rights reserved.
//

import Foundation
import UIKit

extension UITextView {
    
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
    
    /// 今回はUILabelを置いてます。
    func showPlaceHolder() {
        let label = UILabel()
        
        switch textAlignment {
        
        case .center:
            
            label.frame = CGRect(x: 0, y: 0, width: 120, height: 30)
            label.center = CGPoint(x: bounds.midX, y: bounds.midY)
        case .right:
            
            label.frame = CGRect(x: 0, y: 0, width: 120, height: 30)
        case .left:
            
            label.frame = CGRect(x: 0, y: 0, width: 120, height: 30)
        default:
            break
        }
        label.text = "タップして入力"
        addSubview(label)
        
    }
}
