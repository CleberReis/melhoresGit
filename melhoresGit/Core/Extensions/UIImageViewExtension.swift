//
//  UiImageExtension.swift
//  melhoresGit
//
//  Created by Cleber Reis on 22/04/19.
//  Copyright © 2019 Cleber Reis. All rights reserved.
//

import UIKit

extension UIImageView{
    private func download(from url: URL, contentMode mode: UIView.ContentMode = .scaleAspectFill){
        contentMode = mode
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard
                let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
                let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
                let data = data, error == nil,
                let image = UIImage(data: data)
                else { return }
            DispatchQueue.main.async() {
                self.image = image
            }
        }.resume()
    }
    
    func download(from link: String, contentMode mode: UIView.ContentMode = .scaleAspectFill) {
        guard let url = URL(string: link) else { return }
        download(from: url, contentMode: mode)
    }
}
