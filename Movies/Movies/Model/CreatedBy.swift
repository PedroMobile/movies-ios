//
//  CreatedBy.swift
//  Movies
//
//  Created by MacBook Pro 2016 15" .
//  Copyright © 2020 Pedro MKT. All rights reserved.
//

import Foundation

struct CreatedBy : Identifiable, Decodable {
    
    let id = UUID()
    
    let name: String
    
    let credit_id: String
    
    let profile_path: String
    
}

