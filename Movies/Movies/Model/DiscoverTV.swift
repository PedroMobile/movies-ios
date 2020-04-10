//
//  DiscoverTV.swift
//  Movies
//
//  Copyright © 2020 Pedro MKT. All rights reserved.
//

import SwiftUI

struct DiscoverTV : Identifiable, Decodable {
    
    let id = UUID()
    let results: [TV]
    let page: Int
    
    
}
