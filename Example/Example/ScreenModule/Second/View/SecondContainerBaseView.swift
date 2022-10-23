//
//  SecondContainerBaseView.swift
//  Example
//
//  Created by Shusuke Ota on 2022/10/23.
//

import UIKit

class SecondContainerBaseView: UIView {
    private let selectedTitleLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 20, weight: .bold)
        label.textColor = .systemRed
        label.text = "-"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initialize()
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    // MARK: - Init
    
    private func initialize() {
        backgroundColor = .white
        
        addSubview(selectedTitleLabel)
        
        NSLayoutConstraint.activate([
            selectedTitleLabel.topAnchor.constraint(equalTo: topAnchor),
            selectedTitleLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            selectedTitleLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            selectedTitleLabel.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
    }
    
    // MARK: - Update
}
