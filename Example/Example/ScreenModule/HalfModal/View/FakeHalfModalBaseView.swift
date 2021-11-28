//
//  FakeHalfModalBaseView.swift
//  Example
//
//  Created by Shusuke Ota on 2021/11/26.
//

import UIKit

protocol FakeHalfModalBaseViewDelegate: AnyObject {
    func didTappedCloseButton()
}

class FakeHalfModalBaseView: UIView {
    
    weak var delegate: FakeHalfModalBaseViewDelegate?
    
    /// ハーフモーダルで表示するContentView
    private lazy var contentView: UIView = {
        let tempView = UIView()
        tempView.backgroundColor = .white
        tempView.layer.masksToBounds = true
        tempView.layer.cornerRadius = 10
        tempView.layer.borderWidth = 0.1
        tempView.layer.borderColor = UIColor.gray.cgColor
        tempView.translatesAutoresizingMaskIntoConstraints = false
        return tempView
    }()
    /// タイトル
    private lazy var titleLabel: UILabel = {
        let tempLabel = UILabel()
        tempLabel.text = "検索"
        tempLabel.translatesAutoresizingMaskIntoConstraints = false
        return tempLabel
    }()
    /// 閉じるボタン
    private lazy var closeButton: UIButton = {
        let tempButton = UIButton()
        tempButton.setImage(UIImage(systemName: "xmark.circle.fill"), for: .normal)
        tempButton.tintColor = .lightGray
        tempButton.addTarget(self, action: #selector(close(_:)), for: .touchDown)
        tempButton.translatesAutoresizingMaskIntoConstraints = false
        return tempButton
    }()
    /// タイトル境界線
    private lazy var boarderLineView: UIView = {
        let tempView = UIView()
        tempView.backgroundColor = .black
        tempView.translatesAutoresizingMaskIntoConstraints = false
        return tempView
    }()
    /// フィルタセクション
    private lazy var tableView: UITableView = {
        let tableViewTemp = UITableView()
        tableViewTemp.register(UITableViewCell.self, forCellReuseIdentifier: Common.tableViewCellIdentifier)
        tableViewTemp.backgroundColor = .systemGroupedBackground
        tableViewTemp.isScrollEnabled = false
        tableViewTemp.translatesAutoresizingMaskIntoConstraints = false
        return tableViewTemp
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        // UI初期設定
        configBasic()
        
        // UIをSuperViewに追加
        addSubViews()
        
        // Autolayout
        setLayoutConstraint()
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    // MARK: - Action
    @objc private func close(_ sender: UIButton) {
        delegate?.didTappedCloseButton()
    }
}

// MARK: - Initialized
extension FakeHalfModalBaseView {
    /// 基本設定
    private func configBasic() {
        backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.0)
    }
    /// UIパーツの追加
    private func addSubViews() {
        addSubview(contentView)
        contentView.addSubview(titleLabel)
        contentView.addSubview(closeButton)
        contentView.addSubview(boarderLineView)
        contentView.addSubview(tableView)
    }
    /// Autolayout
    private func setLayoutConstraint() {
        NSLayoutConstraint.activate([
            contentView.leadingAnchor.constraint(equalTo: leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: bottomAnchor),
            contentView.heightAnchor.constraint(equalToConstant: 350)
        ])
        contentView.addConstraints([
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
            titleLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            
            closeButton.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
            closeButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            
            boarderLineView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 15),
            boarderLineView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            boarderLineView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            boarderLineView.heightAnchor.constraint(equalToConstant: 0.1),
            
            tableView.topAnchor.constraint(equalTo: boarderLineView.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
    func registerTableViewProtocols(delegate: UITableViewDelegate? = nil, dataSource: UITableViewDataSource? = nil) {
        tableView.delegate = delegate
        tableView.dataSource = dataSource
    }
}
