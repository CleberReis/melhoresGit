//
//  DetailGitViewController.swift
//  melhoresGit
//
//  Created by Cleber Reis on 22/04/19.
//  Copyright © 2019 Cleber Reis. All rights reserved.
//

import UIKit

class DetailGitViewController: UIViewController {
    
    let ProfileBox: UIView = {
        let v = UIView()
        v.backgroundColor = .white
        v.layer.borderWidth = 0.5
        v.layer.borderColor = UIColor.lightGray.cgColor
        return v
    }()
    
    let ProfileImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "perfil2")
        
        return image
    }()
    
    let ProfileDetailText: UILabel = {
       let label = UILabel()
        label.text = "texto"
        label.numberOfLines = 0
        return label
    }()
    
    let ProfileLocation: UILabel = {
        let label = UILabel()
        label.text = "Carregando..."
        label.numberOfLines = 1
        return label
    }()
    
    let ProfileBio: UILabel = {
        let label = UILabel()
        label.text = ""
        label.numberOfLines = 0
        return label
    }()
    
    var Login: String = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.groupTableViewBackground
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Voltar", style: .plain, target: self, action: #selector(voltar))
        
        self.view.addSubview(ProfileBox)
        self.ProfileBox.addSubview(ProfileImage)
        self.ProfileBox.addSubview(ProfileDetailText)
        self.ProfileBox.addSubview(ProfileLocation)
        self.ProfileBox.addSubview(ProfileBio)
        
        self.ProfileBox.translatesAutoresizingMaskIntoConstraints = false
        self.ProfileBox.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 10).isActive = true
        self.ProfileBox.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 10).isActive = true
        self.ProfileBox.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: -10).isActive = true
        self.ProfileBox.bottomAnchor.constraint(equalTo: self.ProfileBio.bottomAnchor, constant: 5).isActive = true
        
        ProfileImage.translatesAutoresizingMaskIntoConstraints = false
        ProfileImage.heightAnchor.constraint(equalToConstant: 100).isActive = true
        ProfileImage.widthAnchor.constraint(equalToConstant: 100).isActive = true
        ProfileImage.topAnchor.constraint(equalTo: self.ProfileBox.topAnchor, constant: 10).isActive = true
        ProfileImage.leadingAnchor.constraint(equalTo: self.ProfileBox.leadingAnchor, constant: 10).isActive = true
        
        ProfileDetailText.translatesAutoresizingMaskIntoConstraints = false
        ProfileDetailText.topAnchor.constraint(equalTo: self.ProfileImage.topAnchor).isActive = true
        ProfileDetailText.leadingAnchor.constraint(equalTo: self.ProfileImage.trailingAnchor, constant: 5).isActive = true
        ProfileDetailText.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: -10).isActive = true
        
        ProfileLocation.translatesAutoresizingMaskIntoConstraints = false
        ProfileLocation.topAnchor.constraint(equalTo: ProfileImage.bottomAnchor, constant: 10).isActive = true
        ProfileLocation.leadingAnchor.constraint(equalTo: ProfileImage.leadingAnchor).isActive = true
        
        ProfileBio.translatesAutoresizingMaskIntoConstraints = false
        ProfileBio.topAnchor.constraint(equalTo: ProfileLocation.bottomAnchor, constant: 10).isActive = true
        ProfileBio.leadingAnchor.constraint(equalTo: ProfileImage.leadingAnchor).isActive = true
        ProfileBio.trailingAnchor.constraint(equalTo: self.ProfileBox.trailingAnchor, constant: -10).isActive = true
        
        //chamada http
        let urlString = "https://api.github.com/users/" + self.Login
        
        HttpHandler.Call(urlString: urlString) { (response : UserDetailGit?) in
            
            DispatchQueue.main.async {
                self.ProfileLocation.text = response?.location
                self.ProfileBio.text = response?.bio
            }
        }
    }
    
    @objc func voltar(){
        self.dismiss(animated: true, completion: nil)
    }

}
