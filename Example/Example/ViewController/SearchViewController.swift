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
        self.view = self.baseView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

// MARK: - Initialized
extension SearchViewController {
    private func configBaseView() {}
}
