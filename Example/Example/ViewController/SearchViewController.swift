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
