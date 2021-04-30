//
//  TopBaseView.swift
//  Example
//
//  Created by Shusuke Ota on 2021/4/27.
//

import UIKit

protocol TopBaseViewDelegate: AnyObject {
    func didTapNextButton()
}

class TopBaseView: UIView {
    /// デリゲート
    weak var delegate: TopBaseViewDelegate?
    
    /// タイトルラベル
    private let titleLabel: UILabel = {
        let labelTemp = UILabel()
        labelTemp.text = "Hellow World !!"
        labelTemp.textColor = .red
        labelTemp.font = .boldSystemFont(ofSize: 17.0)
        labelTemp.translatesAutoresizingMaskIntoConstraints = false
        return labelTemp
    }()
    /// 画面遷移ボタン
    private lazy var nextButton: UIButton = {
        let buttonTemp = UIButton()
        buttonTemp.backgroundColor = .systemRed
        buttonTemp.setTitle("次に進む", for: .normal)
        buttonTemp.addTarget(self, action: #selector(didTapNextButton), for: .touchDown)
        buttonTemp.translatesAutoresizingMaskIntoConstraints = false
        return buttonTemp
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        // UI初期設定
        self.configuredBasic()
        
        // UIをSuperViewに追加
        self.addSubViews()
        
        // AutoLayout
        self.setLayoutConstraint()
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    override func layoutSubviews() {
        self.setNextButton()
    }
    // MARK: - Action Method
    @objc func didTapNextButton(_ sender: UIButton) {
        self.delegate?.didTapNextButton()
    }
}
// MARK: - Initialized Basic Method
extension TopBaseView {
    /// 基本設定
    private func configuredBasic() {
        self.backgroundColor = .white
    }
    /// UIパーツの追加
    private func addSubViews() {
        self.addSubview(self.titleLabel)
        self.addSubview(self.nextButton)
    }
}
// MARK: - Initialization SubView Method
extension TopBaseView {
    /// AutoLayout設定
    private func setLayoutConstraint() {
        NSLayoutConstraint.activate([
            // タイトルラベル
            self.titleLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: 0),
            self.titleLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor, constant: 0),
            // 次に進むボタン
            self.nextButton.topAnchor.constraint(equalTo: self.titleLabel.bottomAnchor, constant: 10),
            self.nextButton.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            self.nextButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            self.nextButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            self.nextButton.heightAnchor.constraint(equalToConstant: 45.0)
        ])
    }
    /// 次に進むボタンの設定
    private func setNextButton() {
        self.nextButton.clipsToBounds = true
        self.nextButton.layer.cornerRadius = 5
    }
}
