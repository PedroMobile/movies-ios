//
//  MoviesViewModel.swift
//  Movies
//
//  Copyright © 2020 Pedro MKT. All rights reserved.
//

import SwiftUI

class TVsViewModel: ObservableObject {
    
    var page = 1
    @Published var message = ""
    @Published var tvs: [TV] = []
    
    
    func fetchTVs() {
        guard let url = URL(string: "\(Constants.endpoint+Constants.discover_tv)?api_key=\(Constants.apikey)&page=\(page)") else { return }
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

