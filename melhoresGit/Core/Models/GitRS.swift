//
//  File.swift
//  melhoresGit
//
//  Created by Cleber Reis on 22/04/19.
//  Copyright © 2019 Cleber Reis. All rights reserved.
//

struct GitRS: Codable {
    let total_count: Int
    let incomplete_results: Bool
    
    let items : [UserGit]
}
