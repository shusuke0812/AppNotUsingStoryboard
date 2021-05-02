//
//  SecondBaseView.swift
//  Example
//
//  Created by Shusuke Ota on 2021/4/27.
//

import UIKit

class SecondBaseView: UIView {
    /// 検索バー
    private let searchBar: UISearchBar = {
        let searchBarTemp = UISearchBar()
        searchBarTemp.placeholder = "記事を検索する"
        searchBarTemp.translatesAutoresizingMaskIntoConstraints = false
        return searchBarTemp
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        // UI初期設定
        self.configuredBasic()
        
        // UIをSuperVIewに追加
        self.addSubViews()
        
        // AutoLayout
        self.setLayoutConstraint()
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}
// MARK: - Initialized Basic Method
extension SecondBaseView {
    // 基本設定
    private func configuredBasic() {
        self.backgroundColor = .white
    }
    // UIパーツの追加
    private func addSubViews() {
        self.addSubview(self.searchBar)
    }
}
// MARK: - Initialization SubView Method
extension SecondBaseView {
    private func setLayoutConstraint() {
        NSLayoutConstraint.activate([
            // 検索バー
            self.searchBar.topAnchor.constraint(equalTo: self.topAnchor, constant: 0),
            self.searchBar.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0),
            self.searchBar.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0)
        ])
    }
}
