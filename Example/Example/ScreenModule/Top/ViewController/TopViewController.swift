//
//  ViewController.swift
//  Example
//
//  Created by Shusuke Ota on 2021/4/26.
//

import UIKit

class TopViewController: UIViewController {
    /// BaseView
    private var baseView = TopBaseView()
    
    // MARK: - Lifecycle
    override func loadView() {
        self.view = self.baseView
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setDelegate()
        
        self.setNavigation()
    }
    
    // MARK: - Action
    @objc func didTappedSearchButton() {
        let vc = SearchViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
// MARK: - Initialized
extension TopViewController {
    private func setDelegate() {
        self.baseView.delegate = self
    }
    private func setNavigation() {
        self.navigationItem.title = "Top"
        let searchButton = UIBarButtonItem(barButtonSystemItem: .search, target: self, action: #selector(didTappedSearchButton))
        self.navigationItem.rightBarButtonItem = searchButton
    }
}
// MARK: - BaseView Delegate
extension TopViewController: TopBaseViewDelegate {
    func didTappedNextButton() {
        let vc = SecondViewController()
        self.present(vc, animated: true, completion: nil)
    }
}
