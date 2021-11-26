//
//  FakeHalfModalViewController.swift
//  Example
//
//  Created by Shusuke Ota on 2021/11/26.
//

import UIKit

class FakeHalfModalViewController: UIViewController {

    private var baseView = FakeHalfModalBaseView()
    
    override func loadView() {
        view = baseView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
}
