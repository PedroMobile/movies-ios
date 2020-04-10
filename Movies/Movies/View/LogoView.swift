//
//  NetworkView.swift
//  Movies
//
//  Created by MacBook Pro 2016 15" .
//  Copyright © 2020 Pedro MKT. All rights reserved.
//

import SwiftUI
import URLImage

struct LogoView: View {
    
    var company: Company!
    var url: URL
    
    
    
    init(company: Company){
        self.company = company
        self.url = URL(string: "https://image.tmdb.org/t/p/w500\(company.logo_path ?? "")")!
        
        UITableViewCell.appearance().backgroundColor = Colors.backgroundui
    }
    
    var body: some View {
        
        ZStack (alignment: .top){
            
            URLImage(self.url){ proxy in
                proxy.image
                    .resizable()                     // Make image resizable
                    .aspectRatio(contentMode: .fit) // Fill the frame
                    .clipped()                       // Clip overlaping parts
                    
                    .frame(maxHeight: 20)
                
                }.padding().background(Colors.white).cornerRadius(5.0)
            
        }
    }
    
    
}

struct NetworkView_Previews: PreviewProvider {
    
    
    
    static var previews: some View {
        
        let company = Company(id:12, name: "Name", logo_path: "/3wx3EAMtqnbSLhGG8NrqXriCUIQ.jpg", origin_country: "BR")
        
        return LogoView(company: company)
        
    }
}
