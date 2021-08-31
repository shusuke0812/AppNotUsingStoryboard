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
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: Common.tableViewCellIdentifier)
    }
    private func addSubViews() {
        self.addSubview(self.searchBar)
        self.addSubview(self.tableView)
    }
    private func setLayoutConstraint() {
        NSLayoutConstraint.activate([
            // 検索バー
            self.searchBar.topAnchor.constraint(equalTo:  self.topAnchor, constant: 0),
            self.searchBar.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0),
            self.searchBar.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0),
            // リスト
            self.tableView.topAnchor.constraint(equalTo: self.searchBar.bottomAnchor, constant: 0),
            self.tableView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0),
            self.tableView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0),
            self.tableView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0)
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
