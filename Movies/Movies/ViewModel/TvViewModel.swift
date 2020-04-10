//
//  TvViewModel.swift
//  Movies
//
//  Created by MacBook Pro 2016 15" .
//  Copyright © 2020 Pedro MKT. All rights reserved.
//

import SwiftUI

class TvViewModel: ObservableObject {
    
    @Published var tvModel: TvModel = TvModel(genres:[], networks:[], production_companies:[], first_air_date: "", overview: "")
    
    func fetchTV(tv:TV) {
        
        guard let url = URL(string: "\(Constants.endpoint)/tv/\(tv.id)?api_key=\(Constants.apikey)") else { return }
        
        URLSession.shared.dataTask(with: url) { (data, resp, err) in
            
            DispatchQueue.main.async {
                self.tvModel = try! JSONDecoder().decode(TvModel.self, from: data!)
            }
            
        }.resume()
    }
}
