//
//  AppRootController.swift
//  Example
//
//  Created by Shusuke Ota on 2021/8/27.
//

import UIKit

class AppRootController: UIViewController {

    private var currentViewController: UIViewController?
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        showTopPage()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
}

// MARK: - Private
extension AppRootController {
    private func showTopPage() {
        let vc = UINavigationController(rootViewController: TopViewController())
        changeViewController(vc)
    }
    private func changeViewController(_ vc: UIViewController) {
        removeCurrentViewController()
        setCurrentViewController(vc)
    }
    private func setCurrentViewController(_ vc: UIViewController) {
        currentViewController = vc
        addChild(vc)
        view.addSubview(vc.view)
        didMove(toParent: vc)
    }
    private func removeCurrentViewController() {
        guard let vc = currentViewController else { return }
        vc.willMove(toParent: nil)
        vc.view.removeFromSuperview()
        vc.removeFromParent()
    }
}
