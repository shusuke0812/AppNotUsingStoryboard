//
//  SecondViewController.swift
//  Example
//
//  Created by Shusuke Ota on 2021/4/27.
//

import UIKit

class SecondViewController: UIViewController {

    private var baseView = SecondBaseView()
    private var viewModel = SecondViewModel()

    // MARK: - Lifecycle Method
    override func loadView() {
        view = baseView
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        setDissmissKeyboard()

        baseView.searchBar.delegate = self
        baseView.tableView.delegate = self
        baseView.tableView.dataSource = self.viewModel
    }
}
// MARK: - SearchBar Delegate Method
extension SecondViewController: UISearchBarDelegate {
}
// MARK: - TableView Delegate Method
extension SecondViewController: UITableViewDelegate {
}
