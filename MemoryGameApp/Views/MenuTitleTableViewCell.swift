//
//  MenuTitleTableViewCell.swift
//  MemoryGameApp
//
//  Created by Gabriela Sillis on 07/05/24.
//

import UIKit
import SnapKit


final class MenuTitleTableViewCell: UITableViewCell {
    static var identifier: String {
        String(describing: MenuTitleTableViewCell.self)
    }
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.textColor = .gray
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
        setupContraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

private extension MenuTitleTableViewCell {
    func setupView() {
        addSubview(titleLabel)
        backgroundColor = .clear
        selectionStyle = .none
    }
    
    func setupContraints() {
        titleLabel.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
}

#Preview {
    return MenuTitleTableViewCell()
}
