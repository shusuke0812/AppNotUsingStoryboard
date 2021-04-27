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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = self.baseView
    }
}

