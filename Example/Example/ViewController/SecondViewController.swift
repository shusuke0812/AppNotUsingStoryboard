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

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = self.baseView
    }
}
