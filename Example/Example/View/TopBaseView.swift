//
//  TopBaseView.swift
//  Example
//
//  Created by Shusuke Ota on 2021/4/27.
//

import UIKit

protocol TopBaseViewDelegate: AnyObject {
    func didTappedNextButton()
    func didTappedConfigButton()
}

class TopBaseView: UIView {
    /// デリゲート
    weak var delegate: TopBaseViewDelegate?
    
    /// 設定ボタン
    private let searchButton: UIButton = {
        let btn = UIButton()
        btn.setImage(UIImage(systemName: "magnifyingglass"), for: .normal)
        btn.addTarget(self, action: #selector(didTappedConfigButton), for: .touchDown)
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    
    /// StackView
    private let stackView: UIStackView = {
        let stackViewTemp = UIStackView()
        stackViewTemp.axis = .horizontal
        stackViewTemp.distribution = .fillEqually
        stackViewTemp.spacing = 5
        stackViewTemp.translatesAutoresizingMaskIntoConstraints = false
        return stackViewTemp
    }()
    /// StackView用のサンプルView 1
    private let view1: UIView = {
        let viewTemp = UIView()
        viewTemp.backgroundColor = .green
        viewTemp.translatesAutoresizingMaskIntoConstraints = false
        return viewTemp
    }()
    /// StackView用のサンプルView 2
    private let view2: UIView = {
        let viewTemp = UIView()
        viewTemp.backgroundColor = .blue
        viewTemp.translatesAutoresizingMaskIntoConstraints = false
        return viewTemp
    }()
    
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
        buttonTemp.addTarget(self, action: #selector(didTappedNextButton), for: .touchDown)
        buttonTemp.clipsToBounds = true
        buttonTemp.layer.cornerRadius = 5
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
    }
    // MARK: - Action
    @objc func didTappedNextButton(_ sender: UIButton) {
        self.delegate?.didTappedNextButton()
    }
    @objc private func didTappedConfigButton(_ sender: UIButton) {
        self.delegate?.didTappedConfigButton()
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
        self.addSubview(self.stackView)
        self.addSubview(self.searchButton)
        self.stackView.addArrangedSubview(self.view1)
        self.stackView.addArrangedSubview(self.view2)
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
            self.nextButton.heightAnchor.constraint(equalToConstant: 45.0),
            // StackView
            self.stackView.topAnchor.constraint(equalTo: self.nextButton.bottomAnchor, constant: 10),
            self.stackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            self.stackView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            self.stackView.heightAnchor.constraint(equalToConstant: 40),
            // 設定ボタン
            self.searchButton.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 15),
            self.searchButton.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -15)
        ])
    }
}
