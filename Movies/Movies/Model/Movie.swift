
//
//  Moview.swift
//  Movies
//
//  Copyright © 2020 Pedro MKT. All rights reserved.
//

import SwiftUI

struct Movie : Identifiable, Decodable {
    
    let id = UUID()
    
    let title: String
    
}
