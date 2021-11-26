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
        
        setDelegate()
    }
}

// MARK: -  Initialized
extension FakeHalfModalViewController {
    private func setDelegate() {
        baseView.delegate = self
    }
}

// MARK: - FakeHalfModal BaseView Delegate
extension FakeHalfModalViewController: FakeHalfModalBaseViewDelegate {
    func didTappedCloseButton() {
        presentingViewController?.dismiss(animated: true, completion: nil)
    }
}
