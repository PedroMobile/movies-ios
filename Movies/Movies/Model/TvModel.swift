//
//  TvModel.swift
//  Movies
//
//  Created by MacBook Pro 2016 15" .
//  Copyright © 2020 Pedro MKT. All rights reserved.
//

import Foundation

struct TvModel : Identifiable, Decodable {
    
    let id = UUID()
    
    //let created_by: [CreatedBy]
    let genres:[Genre]
    
    let networks:[Company]
    
    let production_companies:[Company]
    
    let first_air_date: String
    let overview: String
    //let backdrop_path: String?
    
    //let vote_average: Double
    
    
}
