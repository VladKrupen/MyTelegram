//
//  MainTabBarController.swift
//  Telegram
//
//  Created by Vlad on 6.01.24.
//

import SnapKit
import UIKit

class MainTabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        setupTabBar()
        
    }
    
    private func setupTabBar() {
        
        let contactsViewController = createNavigationController(vc: ContactsViewController(), itemName: "Контакты", itemImage: UIImage(systemName: "person.circle.fill")!)
        let callsViewController = createNavigationController(vc: CallsViewController(), itemName: "Звонки", itemImage: UIImage(systemName: "phone.fill")!)
        let chatsViewcontroller = createNavigationController(vc: ChatsViewController(), itemName: "Чаты", itemImage: UIImage(named: "message")!)
        let setupViewController = createNavigationController(vc: SetupViewController(), itemName: "Настройки", itemImage: UIImage(named: "setting")!)

    
        
        viewControllers = [contactsViewController, callsViewController, chatsViewcontroller, setupViewController]
        selectedViewController = chatsViewcontroller

    }
    
    private func createNavigationController(vc: UIViewController, itemName: String, itemImage: UIImage) -> UINavigationController {
        
        let item = UITabBarItem(title: itemName, image: itemImage.withAlignmentRectInsets(.init(top: 10, left: 0, bottom: 0, right: 0)), tag: 0)
        
        let navigationController = UINavigationController(rootViewController: vc)
        navigationController.tabBarItem = item
        
        return navigationController
    }
    
}
