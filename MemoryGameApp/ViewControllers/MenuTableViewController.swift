//
//  MenuTableViewController.swift
//  MemoryGameApp
//
//  Created by Gabriela Sillis on 06/05/24.
//

import UIKit

class MenuTableViewController: UITableViewController {

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupNavBar()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
}

private extension MenuTableViewController {
    func setupNavBar() {
        title = "Menu"
        navigationItem.hidesBackButton = true
    }
    
    func setupView() {
        view.backgroundColor = .lightGray
    }
}

#Preview {
    return MenuTableViewController()
}
