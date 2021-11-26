//
//  UIViewController+Extension.swift
//  Example
//
//  Created by Shusuke Ota on 2021/5/2.
//

import UIKit

extension UIViewController {
    /// キーボード以外の画面をタップした時にキーボードを閉じる処理
    internal func setDissmissKeyboard() {
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dissmissKeyboard))
        tapGestureRecognizer.cancelsTouchesInView = true
        view.addGestureRecognizer(tapGestureRecognizer)
    }
    @objc private func dissmissKeyboard() {
        view.endEditing(true)
    }
}
