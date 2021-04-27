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
        self.setDelegate()
    }
}
// MARK: - Initialized Method
extension TopViewController {
    private func setDelegate() {
        self.baseView.delegate = self
    }
}
// MARK: - BaseView Delegate Method
extension TopViewController: TopBaseViewDelegate {
    func didTapNextButton() {
        let vc = SecondViewController()
        self.present(vc, animated: true, completion: nil)
    }
}
