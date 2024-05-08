//
//  MenuTableViewController.swift
//  MemoryGameApp
//
//  Created by Gabriela Sillis on 06/05/24.
//

import ReSwift
import UIKit

final class MenuTableViewController: UITableViewController {
    var tableViewDataSource: TableViewDataSource<UITableViewCell, String>?
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupNavBar()
        subscribe()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        unsubscribe()
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        var routerDestination: RouterDestination = .categories
        
        switch indexPath.row {
        case 0:
            routerDestination = .game
        case 1:
            routerDestination = .categories
        default:
            break
        }
        
        store.dispatch(RoutingAction(destination: routerDestination))
    }
}

private extension MenuTableViewController {
    func setupNavBar() {
        title = "Menu"
        navigationItem.hidesBackButton = true
    }
    
    func setupView() {
        view.backgroundColor = .systemMint
        tableView.register(
            MenuTitleTableViewCell.self,
            forCellReuseIdentifier: MenuTitleTableViewCell.identifier
        )
    }
    
    func subscribe() {
        store.subscribe(self) { store in
            store.select { $0.menuState }
        }
    }
    
    func unsubscribe() {
        store.unsubscribe(self)
    }
    
    func setupTableViewCell(with state: MenuState) {
        tableViewDataSource = TableViewDataSource(
            models: state.menuTitles,
            cellIdentifier: MenuTitleTableViewCell.identifier,
            setupCell: { cell, model in
                var content = cell.defaultContentConfiguration()
                content.text = model
                content.textProperties.alignment = .center
                cell.contentConfiguration = content
                return cell
            }
        )
        tableView.dataSource = tableViewDataSource
        tableView.reloadData()
    }
}

extension MenuTableViewController: StoreSubscriber {
    func newState(state: MenuState) {
        setupTableViewCell(with: state)
    }
}

#Preview {
    return MenuTableViewController()
}
