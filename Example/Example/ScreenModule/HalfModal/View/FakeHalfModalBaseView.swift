//
//  FakeHalfModalBaseView.swift
//  Example
//
//  Created by Shusuke Ota on 2021/11/26.
//

import UIKit

class FakeHalfModalBaseView: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.5)
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}
