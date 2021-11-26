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
    // リスト
    private let tableView: UITableView = {
        let tableViewTemp = UITableView()
        tableViewTemp.isHidden = true
        tableViewTemp.translatesAutoresizingMaskIntoConstraints = false
        return tableViewTemp
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        // UI初期設定
        configBasic()
        
        // UIをSuperViewに追加
        addSubViews()
        
        // AutoLayout
        setLayoutConstraint()
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}

// MARK: - Initialized
extension SearchBaseView {
    /// 基本設定
    private func configBasic() {
        backgroundColor = .white
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: Common.tableViewCellIdentifier)
    }
    /// UIパーツの追加
    private func addSubViews() {
        addSubview(self.searchBar)
        addSubview(self.tableView)
    }
    /// AutoLayout設定
    private func setLayoutConstraint() {
        NSLayoutConstraint.activate([
            // 検索バー
            searchBar.topAnchor.constraint(equalTo:  topAnchor, constant: 0),
            searchBar.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
            searchBar.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0),
            // リスト
            tableView.topAnchor.constraint(equalTo: searchBar.bottomAnchor, constant: 0),
            tableView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
            tableView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0),
            tableView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0)
        ])
    }
}

// MARK: - Setting
extension SearchBaseView {
    /// TableViewの`Delegate`, `DataSource`を設定する（MEMO：１つのクラスで左記プロトコルを継承する仕様になっているため、`DataSource`をViewModelで定義したい場合は引数を２つにした方が良いかも）
    func configTableViewProtocol<T: UITableViewDelegate & UITableViewDataSource>(delegate: T) {
        tableView.delegate = delegate
        tableView.dataSource = delegate
    }
}
