//
//  FakeHalfModalBaseView.swift
//  Example
//
//  Created by Shusuke Ota on 2021/11/26.
//

import UIKit

class FakeHalfModalBaseView: UIView {
    /// ハーフモーダルで表示するContentView
    private lazy var contentView: UIView = {
        let tempView = UIView()
        tempView.backgroundColor = .white
        tempView.translatesAutoresizingMaskIntoConstraints = false
        return tempView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        // UI初期設定
        configBasic()
        
        // UIをSuperViewに追加
        addSubViews()
        
        // Autolayout
        setLayoutConstraint()
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}

// MARK: - Initialized
extension FakeHalfModalBaseView {
    /// 基本設定
    private func configBasic() {
        backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.5)
    }
    /// UIパーツの追加
    private func addSubViews() {
        addSubview(contentView)
    }
    /// Autolayout
    private func setLayoutConstraint() {
        NSLayoutConstraint.activate([
            contentView.leadingAnchor.constraint(equalTo: leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: bottomAnchor),
            contentView.heightAnchor.constraint(equalToConstant: 300)
        ])
    }
}
