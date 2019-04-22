//
//  ListGitTableViewController.swift
//  melhoresGit
//
//  Created by Cleber Reis on 22/04/19.
//  Copyright © 2019 Cleber Reis. All rights reserved.
//

import UIKit

class ListGitTableViewController: UITableViewController {
    
    var users: [UserGit] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Buscando..."
        self.view.backgroundColor = UIColor.groupTableViewBackground
        
        let urlString = "https://api.github.com/search/users?q=followers:%3E10000"
        
        HttpHandler.Call(urlString: urlString) { (response : GitRS?) in
            self.users = response!.items
            
            DispatchQueue.main.async {
                self.title = "Melhores do Git"
                self.tableView.reloadData()
            }
        }

    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.users.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: "cellId")
        
        let user = self.users[indexPath.row]
        
        cell.textLabel?.text = user.login
        cell.detailTextLabel?.text = user.url
        cell.imageView?.image = UIImage(named: "perfil2")
        cell.imageView?.download(from: user.avatar_url)
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let userSelect = self.users[indexPath.row]
        let detailGit = DetailGitViewController()
        detailGit.title = userSelect.login
        detailGit.ProfileImage.download(from: userSelect.avatar_url)
        detailGit.ProfileDetailText.text = userSelect.url
        detailGit.Login = userSelect.login
        
        
        self.present(UINavigationController(rootViewController: detailGit), animated: true, completion: nil)
    }
}
