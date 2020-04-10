//
//  Production.swift
//  Movies
//
//  Created by MacBook Pro 2016 15" .
//  Copyright © 2020 Pedro MKT. All rights reserved.
//

import Foundation

struct Company : Identifiable, Decodable {
    
    let id: Int
    
    let name: String
    
    let logo_path: String?
    
    let origin_country: String
    
}
