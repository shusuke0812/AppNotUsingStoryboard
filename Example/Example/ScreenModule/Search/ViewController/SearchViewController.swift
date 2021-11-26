//
//  SearchViewController.swift
//  Example
//
//  Created by Shusuke Ota on 2021/8/28.
//

import UIKit

class SearchViewController: UIViewController {
    /// BaseView
    private var baseView = SearchBaseView()
    
    // MARK: - Lifecycle
    override func loadView() {
        view = baseView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        baseView.configTableViewProtocol(delegate: self)
        configNavigation()
    }
}

// MARK: - Initialized
extension SearchViewController {
    private func configBaseView() {}
    private func configNavigation() {
        // Viewの上端をNavBar下端に合わせる
        navigationController?.navigationBar.isTranslucent = false
    }
}

// MARK: - UITableView Delegate
extension SearchViewController: UITableViewDelegate {
    
}

// MARK: - UITableView DataSource
extension SearchViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 30
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Common.tableViewCellIdentifier, for: indexPath)
        cell.textLabel?.text = "test"
        return cell
    }
}
