//
//  SecondContainerViewController.swift
//  Example
//
//  Created by Shusuke Ota on 2022/10/23.
//

import UIKit

class SecondContainerViewController: UIViewController {

    private var baseView = SecondContainerBaseView()

    override func loadView() {
        view = baseView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func updateSelectedTitleLabel(_ text: String) {
        baseView.updateSelectedTitleLabel(text)
    }
}
