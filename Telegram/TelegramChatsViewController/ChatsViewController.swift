//
//  ChatsViewController.swift
//  Telegram
//
//  Created by Vlad on 6.01.24.
//

import SnapKit
import UIKit

class ChatsViewController: UIViewController {
    
    private let searchBar: UISearchBar = {
        let searchBar = UISearchBar()
        searchBar.searchBarStyle = .minimal
        searchBar.placeholder = "Search for messages or users"
        
        return searchBar
    }()
    
    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(ChatItemCell.self, forCellReuseIdentifier: String(describing: ChatItemCell.self))
        tableView.separatorInset = UIEdgeInsets(top: 0, left: 80, bottom: 0, right: 0)
        
        return tableView
    }()
    
    private var itemsForCell: [ChatsCellInfo] = [
        ChatsCellInfo(avatar: UIImage(named: "dog")!, nickName: "Helen", context: "Hello!"),
        ChatsCellInfo(avatar: UIImage(named: "dog")!, nickName: "Serge", context: "How are you?"),
        ChatsCellInfo(avatar: UIImage(named: "dog")!, nickName: "Саша", context: "Что по домашке"),
        ChatsCellInfo(avatar: UIImage(named: "dog")!, nickName: "Alex", context: "Hello!"),
        ChatsCellInfo(avatar: UIImage(named: "dog")!, nickName: "Alex", context: "Hello!"),
        ChatsCellInfo(avatar: UIImage(named: "dog")!, nickName: "Alex", context: "Hello!"),
        ChatsCellInfo(avatar: UIImage(named: "dog")!, nickName: "Alex", context: "Hello!"),
        ChatsCellInfo(avatar: UIImage(named: "dog")!, nickName: "Alex", context: "Hello!"),
        ChatsCellInfo(avatar: UIImage(named: "dog")!, nickName: "Alex", context: "Hello!"),
        ChatsCellInfo(avatar: UIImage(named: "dog")!, nickName: "Alex", context: "Hello!"),
        ChatsCellInfo(avatar: UIImage(named: "dog")!, nickName: "Alex", context: "Hello!"),
        ChatsCellInfo(avatar: UIImage(named: "dog")!, nickName: "Alex", context: "Hello!"),
        ChatsCellInfo(avatar: UIImage(named: "dog")!, nickName: "Alex", context: "Hello!"),
        ChatsCellInfo(avatar: UIImage(named: "dog")!, nickName: "Alex", context: "Hello!"),
        ChatsCellInfo(avatar: UIImage(named: "dog")!, nickName: "Alex", context: "Hello!"),
        ChatsCellInfo(avatar: UIImage(named: "dog")!, nickName: "Alex", context: "Hello!"),
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        setupNavigationItems()
        layoutElements()
        
        tableView.dataSource = self
        tableView.delegate = self
        
    }
    
    private func setupNavigationItems() {
        let writeMessageButton = UIBarButtonItem(image: UIImage(systemName: "square.and.pencil"), style: .plain, target: self, action: #selector(writeMessageButtonTapped))
        
        
        navigationItem.rightBarButtonItem = writeMessageButton
        navigationItem.title = "Чаты"
        navigationItem.leftBarButtonItem = editButtonItem
    }
    
    @objc func writeMessageButtonTapped() {
        print("writeMessageButtonTapped")
        
    }
    
    private func layoutElements() {
        layoutSearchBar()
        layoutTableView()
    }
    
    private func layoutSearchBar() {
        view.addSubview(searchBar)
        searchBar.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            make.leading.trailing.equalToSuperview().inset(10)
        }
    }
    
    private func layoutTableView() {
        view.addSubview(tableView)
        tableView.snp.makeConstraints { make in
            make.top.equalTo(searchBar.snp.bottom)
            make.bottom.leading.trailing.equalTo(view.safeAreaLayoutGuide)
        }
    }

    
}


extension ChatsViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemsForCell.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: ChatItemCell.self), for: indexPath) as! ChatItemCell
        cell.configure(with: itemsForCell[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 76
    }
    
    
}

extension ChatsViewController: UITableViewDelegate {
    
}

