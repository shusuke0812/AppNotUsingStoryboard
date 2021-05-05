//
//  SecondBaseView.swift
//  Example
//
//  Created by Shusuke Ota on 2021/4/27.
//

import UIKit

class SecondBaseView: UIView {
    /// 検索バー
    var searchBar: UISearchBar = {
        let searchBarTemp = UISearchBar()
        searchBarTemp.placeholder = "記事を検索する"
        searchBarTemp.translatesAutoresizingMaskIntoConstraints = false
        return searchBarTemp
    }()
    /// 記事リストテーブル
    var tableView: UITableView = {
        let tableViewTemp = UITableView()
        tableViewTemp.translatesAutoresizingMaskIntoConstraints = false
        return tableViewTemp
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
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: Common.tableViewCellIdentifier)
    }
    // UIパーツの追加
    private func addSubViews() {
        self.addSubview(self.searchBar)
        self.addSubview(self.tableView)
    }
}
// MARK: - Initialization SubView Method
extension SecondBaseView {
    private func setLayoutConstraint() {
        NSLayoutConstraint.activate([
            // 検索バー
            self.searchBar.topAnchor.constraint(equalTo: self.topAnchor, constant: 0),
            self.searchBar.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0),
            self.searchBar.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0),
            /// 記事リストテーブル
            self.tableView.topAnchor.constraint(equalTo: self.searchBar.bottomAnchor, constant: 0),
            self.tableView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0),
            self.tableView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0),
            self.tableView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0)
        ])
    }
}
