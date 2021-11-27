//
//  FakeHalfModalViewController.swift
//  Example
//
//  Created by Shusuke Ota on 2021/11/26.
//

import UIKit

class FakeHalfModalViewController: UIViewController {

    private var baseView = FakeHalfModalBaseView()
    private var viewModel = FakeHalfModalViewModel()
    
    override func loadView() {
        view = baseView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setDelegate()
    }
    // MARK: - Action
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesEnded(touches, with: event)
        for touch in touches where touch.view == view {
            presentingViewController?.dismiss(animated: true, completion: nil)
        }
    }
}

// MARK: -  Initialized
extension FakeHalfModalViewController {
    private func setDelegate() {
        baseView.delegate = self
        baseView.registerTableViewProtocols(delegate: self, dataSource: viewModel)
    }
}

// MARK: - FakeHalfModal BaseView Delegate
extension FakeHalfModalViewController: FakeHalfModalBaseViewDelegate {
    func didTappedCloseButton() {
        presentingViewController?.dismiss(animated: true, completion: nil)
    }
}

// MARK: - UITableView Delegate
extension FakeHalfModalViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    }
}
