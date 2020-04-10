//
//  TV.swift
//  Movies
//
//  Copyright © 2020 Pedro MKT. All rights reserved.
//

import Foundation

struct TV : Identifiable, Decodable {
    
    let id : Int
    
    let name: String
    //let original_name: String
    let first_air_date: String
    let poster_path: String?
    //let vote_count: Int
    let vote_average: Double
    //let popularity: Float
    
}
