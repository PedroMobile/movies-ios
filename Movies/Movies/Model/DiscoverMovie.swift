//
//  Discover.swift
//  Movies
//
//  Copyright © 2020 Pedro MKT. All rights reserved.
//

import SwiftUI

struct DiscoverMovie : Identifiable, Decodable {
    
    let id = UUID()
    let results: [Movie]
    let page: Int
    
    
}
