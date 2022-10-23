//
//  SecondViewController.swift
//  Example
//
//  Created by Shusuke Ota on 2021/4/27.
//

import UIKit

class SecondViewController: UIViewController {

    private var baseView = SecondBaseView()
    private var containerVC = SecondContainerViewController()
    private var viewModel = SecondViewModel()

    // MARK: - View Lifecycle
    /*
    override func loadView() {
        /**
         * 【注】
         *  このメソッドを呼ぶ場合、このメソッド内で VC.view の設定をしないと
         *  viewDidLoadが複数回呼ばれViewの初期化ができなくなるので注意する
         */
        view = baseView
    }
    */

    override func viewDidLoad() {
        super.viewDidLoad()
        baseView.searchBar.delegate = self
        baseView.tableView.delegate = self
        baseView.tableView.dataSource = self.viewModel
        
        initUI()
        setDissmissKeyboard()
    }
    
    private func initUI() {
        addChild(containerVC)
        
        baseView.translatesAutoresizingMaskIntoConstraints = false
        containerVC.view.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(baseView)
        view.addSubview(containerVC.view)
        
        NSLayoutConstraint.activate([
            baseView.topAnchor.constraint(equalTo: view.topAnchor),
            baseView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            baseView.trailingAnchor.constraint(equalTo: view.trailingAnchor),

            containerVC.view.topAnchor.constraint(equalTo: baseView.bottomAnchor),
            containerVC.view.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            containerVC.view.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            containerVC.view.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            containerVC.view.heightAnchor.constraint(equalToConstant: 150)
        ])
        
        containerVC.didMove(toParent: self)
    }
    
    private func removeContainerVC() {
        containerVC.willMove(toParent: nil)
        containerVC.view.removeFromSuperview()
        containerVC.removeFromParent()
    }
}

// MARK: - SearchBar Delegate

extension SecondViewController: UISearchBarDelegate {
}

// MARK: - TableView Delegate
extension SecondViewController: UITableViewDelegate {
}
