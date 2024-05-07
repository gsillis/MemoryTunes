//
//  MenuTitleTableViewCell.swift
//  MemoryGameApp
//
//  Created by Gabriela Sillis on 07/05/24.
//

import UIKit
import SnapKit

protocol MenuTitleCellConfiguring {
    func setup(with title: String)
}

final class MenuTitleTableViewCell: UITableViewCell {
    static var identifier: String {
        String(describing: MenuTitleTableViewCell.self)
    }
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.textColor = .gray
        label.text = "Test"
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupContraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

private extension MenuTitleTableViewCell {
    func setupContraints() {
        addSubview(titleLabel)
        
        titleLabel.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
}

extension MenuTitleTableViewCell: MenuTitleCellConfiguring {
    func setup(with title: String) {
        titleLabel.text = title
    }
}

#Preview {
    return MenuTitleTableViewCell()
}
