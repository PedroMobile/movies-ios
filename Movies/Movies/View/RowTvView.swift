//
//  TvView.swift
//  Movies
//
//  Created by MacBook Pro 2016 15".
//  Copyright © 2020 Pedro MKT. All rights reserved.
//

import SwiftUI
import URLImage

struct RowTvView: View {
    
    var tv: TV!
    var url: URL
    
    @State var rating: Double = 1
    
    
    init(tv: TV){
        self.tv = tv
        self.url = URL(string: "https://image.tmdb.org/t/p/w500\(tv.poster_path ?? "")")!
        self.rating = 5*(self.tv.vote_average/10)
        
        UITableViewCell.appearance().backgroundColor = Colors.backgroundui //.systemPink
    }
    
    
    
    func getRating() -> Double {
        return  5*(self.tv.vote_average/10)
    }
    
    var body: some View {
        
        ZStack (alignment: .top){
            
            
            
            VStack{
                RoundedRectangle(cornerRadius: 5, style: .continuous)
                    .fill(Colors.backgroundDark)
                    .frame(minWidth: 0, maxWidth: .infinity)
                    .frame(height: 170)
            }.padding(.top, 40)
            
            HStack {
                Spacer()
                ZStack{
                    Image("flag")
                }.padding(.trailing, 10)
            }.padding(.top, 35)
            
            HStack (alignment: .bottom){
                
                ZStack{
                    
                    Rectangle().background(Colors.white).frame(width: 125, height: 188)
                    
                    URLImage(self.url){ proxy in
                        proxy.image
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .clipped()
                            
                            .frame(width: 125, height: 188)
                        
                    }
                }.cornerRadius(5.0).padding(.leading, 20)
                
                VStack (alignment: .leading){
                    
                    Text(self.tv.name).font(Font.system(size: 20.0)).frame(maxWidth: .infinity, alignment: .leading).padding(.trailing, 40)
                    
                    RatingView(rating: getRating()).clipped(antialiased: true)
                    
                    Spacer()
                    
                    Text(DateUtil.convertDateFormat(inputDate: self.tv.first_air_date)).font(.system(.caption))
                    
                }.frame(height: 130)
                    .padding(.bottom, 5)
                    .padding(.leading, 10)
                    .padding(.trailing, 10)
            }
            
            
            
        }.padding(.top, 10).padding(.bottom, 10).frame(height: 250)
    }
    
    
}

struct TvView_Previews: PreviewProvider {
    
    static var previews: some View {
        
        let tv = TV(id: 12, name: "Name", first_air_date:"2015-04-10", poster_path: "/3wx3EAMtqnbSLhGG8NrqXriCUIQ.jpg", vote_average: 7.6)
        
        return RowTvView(tv: tv)
        
    }
}
