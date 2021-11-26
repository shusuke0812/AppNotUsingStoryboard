//
//  TopBaseView.swift
//  Example
//
//  Created by Shusuke Ota on 2021/4/27.
//

import UIKit

protocol TopBaseViewDelegate: AnyObject {
    func didTappedNextButton()
    func didTappedHalfModalButton()
}

class TopBaseView: UIView {

    weak var delegate: TopBaseViewDelegate?
    
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
    /// Half Modal表示ボタン
    private lazy var halfModalButton: UIButton = {
        let buttonTemp = UIButton()
        buttonTemp.backgroundColor = .systemGray
        buttonTemp.setTitle("ハーフモーダル", for: .normal)
        buttonTemp.setTitleColor(.white, for: .normal)
        buttonTemp.addTarget(self, action: #selector(transitionHalfModal), for: .touchDown)
        buttonTemp.translatesAutoresizingMaskIntoConstraints = false
        return buttonTemp
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        // UI初期設定
        configuredBasic()
        
        // UIをSuperViewに追加
        addSubViews()
        
        // AutoLayout
        setLayoutConstraint()
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    override func layoutSubviews() {
    }
    // MARK: - Action
    @objc func didTappedNextButton(_ sender: UIButton) {
        delegate?.didTappedNextButton()
    }
    @objc func transitionHalfModal(_ sender: UIButton) {
        delegate?.didTappedHalfModalButton()
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
        addSubview(self.titleLabel)
        addSubview(self.nextButton)
        addSubview(self.stackView)
        addSubview(self.halfModalButton)
        stackView.addArrangedSubview(self.view1)
        stackView.addArrangedSubview(self.view2)
    }
}
// MARK: - Initialization SubView Method
extension TopBaseView {
    /// AutoLayout設定
    private func setLayoutConstraint() {
        NSLayoutConstraint.activate([
            // タイトルラベル
            titleLabel.centerYAnchor.constraint(equalTo: centerYAnchor, constant: 0),
            titleLabel.centerXAnchor.constraint(equalTo: centerXAnchor, constant: 0),
            // ハーフモーダルボタン
            halfModalButton.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 15),
            halfModalButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            halfModalButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            halfModalButton.heightAnchor.constraint(equalToConstant: 45.0),
            // 次に進むボタン
            nextButton.topAnchor.constraint(equalTo: halfModalButton.bottomAnchor, constant: 10),
            nextButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            nextButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            nextButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            nextButton.heightAnchor.constraint(equalToConstant: 45.0),
            // StackView
            stackView.topAnchor.constraint(equalTo: nextButton.bottomAnchor, constant: 10),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            stackView.heightAnchor.constraint(equalToConstant: 40),
        ])
    }
}
