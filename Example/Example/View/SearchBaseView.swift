//
//  SearchBaseView.swift
//  Example
//
//  Created by Shusuke Ota on 2021/8/28.
//

import UIKit

class SearchBaseView: UIView {
    
    // 検索バー
    private let searchBar: UISearchBar = {
        let searchBarTemp = UISearchBar()
        searchBarTemp.translatesAutoresizingMaskIntoConstraints = false
        return searchBarTemp
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        // UI初期設定
        self.configBasic()
        
        // UIをSuperViewに追加
        self.addSubViews()
        
        // AutoLayout
        self.setLayoutConstraint()
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}

// MARK: - Initialized
extension SearchBaseView {
    private func configBasic() {
        self.backgroundColor = .white
    }
    private func addSubViews() {
        self.addSubview(self.searchBar)
    }
    private func setLayoutConstraint() {
        NSLayoutConstraint.activate([
            self.searchBar.topAnchor.constraint(equalTo:  self.topAnchor, constant: 0),
            self.searchBar.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0),
            self.searchBar.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0)
        ])
    }
}
