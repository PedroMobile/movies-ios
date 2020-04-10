//
//  TvsSimilarViewModel.swift
//  Movies
//
//  Created by MacBook Pro 2016 15".
//  Copyright © 2020 Pedro MKT. All rights reserved.
//

import SwiftUI

class TvsSimilarViewModel: ObservableObject {
    
    var page = 1
    @Published var tvs: [TV] = []
    
    
    func fetchTvsBy(tv:TV) {
        guard let url = URL(string: "\(Constants.endpoint)/tv/\(tv.id)/similar?api_key=\(Constants.apikey)&page=\(page)") else { return }
        print(url)
        URLSession.shared.dataTask(with: url) { (data, resp, err) in
            
            DispatchQueue.main.async {
                let discover:DiscoverTV = try! JSONDecoder().decode(DiscoverTV.self, from: data!)
                
                self.tvs += discover.results
                self.page += 1
                
            }
            
        }.resume()
    }
}
