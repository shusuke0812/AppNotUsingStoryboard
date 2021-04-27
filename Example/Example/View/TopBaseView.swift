//
//  TopBaseView.swift
//  Example
//
//  Created by Shusuke Ota on 2021/4/27.
//

import UIKit

class TopBaseView: UIView {
    /// タイトルラベル
    private let titleLabel: UILabel = {
        let labelTemp = UILabel()
        labelTemp.text = "Hellow World !!"
        labelTemp.textColor = .red
        labelTemp.font = .boldSystemFont(ofSize: 17.0)
        labelTemp.translatesAutoresizingMaskIntoConstraints = false
        return labelTemp
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.configuredBasic()
        self.addSubViews()
        
        self.setLayoutConstraintTitleLabel()
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}
// MARK: - Initialized Basic Method
extension TopBaseView {
    /// 基本設定
    private func configuredBasic() {
        self.backgroundColor = .white
    }
    /// UIパーツの追加
    private func addSubViews() {
        self.addSubview(self.titleLabel)
    }
}
// MARK: - Initialization SubView Method
extension TopBaseView {
    /// タイトルラベル設定
    private func setLayoutConstraintTitleLabel() {
        NSLayoutConstraint.activate([
            self.titleLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: 0),
            self.titleLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor, constant: 0)
        ])
    }
}
