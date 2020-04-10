//
//  LogoTvView.swift
//  Movies
//
//  Created by MacBook Pro 2016 15".
//  Copyright © 2020 Pedro MKT. All rights reserved.
//

import SwiftUI
import URLImage

struct LogoTvView: View {
    
    var url: URL
    
    
    
    init(tv: TV){
        self.url = URL(string: "https://image.tmdb.org/t/p/w500\(tv.poster_path ?? "")")!
        
        UITableViewCell.appearance().backgroundColor = Colors.backgroundui
    }
    
    var body: some View {
        
        ZStack{
            
            Rectangle().background(Colors.white).cornerRadius(5.0).frame(width: 125, height: 188)
            
            URLImage(self.url){ proxy in
                proxy.image
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .clipped()                      
                    
                    .frame(width: 125, height: 188)
                
            }
            
        }.cornerRadius(5.0)
    }
    
    
}

struct LogoTvView_Previews: PreviewProvider {
    
    
    
    static var previews: some View {
        
        let tv = TV(id: 12, name: "Name", first_air_date:"2015-04-10", poster_path: "/3wx3EAMtqnbSLhGG8NrqXriCUIQ.jpg", vote_average: 7.6)
        return LogoTvView(tv: tv)
        
    }
}
