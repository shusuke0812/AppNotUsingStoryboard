//
//  GitHubRepositorySearchBaseView.swift
//  iOSEngineerCodeCheck
//
//  Created by Shusuke Ota on 2020/11/27.
//  Copyright © 2020 YUMEMI Inc. All rights reserved.
//

import UIKit

class GitHubRepositorySearchBaseView: UIView {
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var noRepositoryView: UIView!
    @IBOutlet weak var noRepositoryCommentLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        self.initUI()
    }
}
// MARK: - Setting UI Method
extension GitHubRepositorySearchBaseView {
    private func initUI() {
        // 検索バーの入力値を初期化
        self.searchBar.text = ""
        // 検索バーのプレースホルダーを設定
        self.searchBar.placeholder = "GitHubのリポジトリを検索できるよー"
        // TableViewセル登録
        self.tableView.register(R.nib.gitHubRepositoryCell)
        self.setLodingCellWithStartingAnimation()
        // リポジトリ検索結果の表示
        self.noRepositoryView.isHidden = false
        self.noRepositoryCommentLabel.text = "リポジトリがないよー"
        self.noRepositoryCommentLabel.font = .boldSystemFont(ofSize: 17)
        self.noRepositoryCommentLabel.textColor = .lightGray
    }
    func setNoRepositoryUI(gitHubRepositorys: [GitHubRepository]) {
        gitHubRepositorys.isEmpty ? (self.noRepositoryView.isHidden = false) : (self.noRepositoryView.isHidden = true)
    }
    func setLodingCellWithStartingAnimation() {
        if self.tableView.tableFooterView == nil {
            self.tableView.register(R.nib.loadingCell)
            let footerCell: LoadingCell = self.tableView.dequeueReusableCell(withIdentifier: R.reuseIdentifier.loadingCell.identifier) as! LoadingCell // swiftlint:disable:this force_cast
            footerCell.startAnimation()
            self.tableView.tableFooterView = footerCell.contentView
        }
    }
    func cancelTableFooterView() {
        self.tableView.tableFooterView = nil
    }
}
