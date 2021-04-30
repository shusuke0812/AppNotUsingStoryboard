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

    // MARK: - Lifecycle Method
    override func loadView() {
        self.view = self.baseView
    }
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
