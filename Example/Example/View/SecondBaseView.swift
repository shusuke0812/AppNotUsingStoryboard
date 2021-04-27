//
//  SecondBaseView.swift
//  Example
//
//  Created by Shusuke Ota on 2021/4/27.
//

import UIKit

class SecondBaseView: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.configuredBasic()
        self.addSubViews()
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}
// MARK: - Initialized Basic Method
extension SecondBaseView {
    // 基本設定
    private func configuredBasic() {
        self.backgroundColor = .red
    }
    // UIパーツの追加
    private func addSubViews() {
    }
}
