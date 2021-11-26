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
        configuredBasic()
        
        // UIをSuperVIewに追加
        addSubViews()
        
        // AutoLayout
        setLayoutConstraint()
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}
// MARK: - Initialized Basic Method
extension SecondBaseView {
    // 基本設定
    private func configuredBasic() {
        backgroundColor = .white
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: Common.tableViewCellIdentifier)
    }
    // UIパーツの追加
    private func addSubViews() {
        addSubview(self.searchBar)
        addSubview(self.tableView)
    }
}
// MARK: - Initialization SubView Method
extension SecondBaseView {
    private func setLayoutConstraint() {
        NSLayoutConstraint.activate([
            // 検索バー
            searchBar.topAnchor.constraint(equalTo: topAnchor, constant: 0),
            searchBar.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
            searchBar.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0),
            /// 記事リストテーブル
            tableView.topAnchor.constraint(equalTo: searchBar.bottomAnchor, constant: 0),
            tableView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
            tableView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0),
            tableView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0)
        ])
    }
}
