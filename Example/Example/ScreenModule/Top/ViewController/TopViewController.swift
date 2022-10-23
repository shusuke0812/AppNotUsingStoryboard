//
//  ViewController.swift
//  Example
//
//  Created by Shusuke Ota on 2021/4/26.
//

import UIKit

class TopViewController: UIViewController {

    private var baseView = TopBaseView()
    
    // MARK: - Lifecycle
    override func loadView() {
        view = baseView
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        setDelegate()
        
        setNavigation()
    }
    
    // MARK: - Action
    @objc func didTappedSearchButton() {
        let vc = SearchViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
}
// MARK: - Initialized
extension TopViewController {
    private func setDelegate() {
        baseView.delegate = self
    }
    private func setNavigation() {
        navigationItem.title = "Top"
        let searchButton = UIBarButtonItem(barButtonSystemItem: .search, target: self, action: #selector(didTappedSearchButton))
        navigationItem.rightBarButtonItem = searchButton
    }
}
// MARK: - BaseView Delegate
extension TopViewController: TopBaseViewDelegate {
    func didTappedNextButton() {
        print("DEBUG: \(#function)")
        let vc = SecondViewController()
        present(vc, animated: true, completion: nil)
    }
    func didTappedHalfModalButton() {
        let vc = FakeHalfModalViewController()
        vc.modalPresentationStyle = .overCurrentContext
        present(vc, animated: true, completion: nil)
    }
}
