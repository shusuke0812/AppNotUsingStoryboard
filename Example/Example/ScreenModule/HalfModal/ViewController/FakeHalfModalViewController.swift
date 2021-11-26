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
        baseView.registerTableViewProtocols(delegate: self, dataSource: self)
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

// MARK: - UITableiew DataSource
extension FakeHalfModalViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Common.tableViewCellIdentifier, for: indexPath)
        return cell
    }
}
