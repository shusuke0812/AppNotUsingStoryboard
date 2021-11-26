//
//  SecondViewController.swift
//  Example
//
//  Created by Shusuke Ota on 2021/4/27.
//

import UIKit

class SecondViewController: UIViewController {
    /// BaseView
    private var baseView = SecondBaseView()
    /// ViewModel
    private var viewModel = SecondViewModel()

    // MARK: - Lifecycle Method
    override func loadView() {
        self.view = self.baseView
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setDissmissKeyboard()
        // デリゲート登録
        self.baseView.searchBar.delegate = self
        self.baseView.tableView.delegate = self
        self.baseView.tableView.dataSource = self.viewModel
    }
}
// MARK: - SearchBar Delegate Method
extension SecondViewController: UISearchBarDelegate {
}
// MARK: - TableView Delegate Method
extension SecondViewController: UITableViewDelegate {
}
