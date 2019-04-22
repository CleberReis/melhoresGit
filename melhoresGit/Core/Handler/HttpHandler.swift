//
//  HttpHandler.swift
//  melhoresGit
//
//  Created by Cleber Reis on 22/04/19.
//  Copyright © 2019 Cleber Reis. All rights reserved.
//

import Foundation

class HttpHandler {
    static func Call<T: Codable>(urlString: String, complete: @escaping(T?) -> ()) {
        //chamada http
        
        guard let url = URL(string: urlString) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if error != nil{
                print(error!.localizedDescription)
            }
            
            guard let data = data else { return }
            
            do{
                
                let gitResponse = try JSONDecoder().decode(T.self, from: data)
                complete(gitResponse)
                
            }catch let jsonError{
                print(jsonError)
            }
        }.resume()
    }
}
