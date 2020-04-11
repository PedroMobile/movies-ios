//
//  DetailView.swift
//  Movies
//
//  Created by MacBook Pro 2016 15" .
//  Copyright © 2020 Pedro MKT. All rights reserved.
//

import SwiftUI
import URLImage
import Cosmos

struct DetailView: View {
    
    var mTv:TV!
    
    var scale:Double = 0.5
    
    @ObservedObject var tvVM = TvViewModel()
    @ObservedObject var tvsSimilarVM = TvsSimilarViewModel()
    
    init(tv: TV){
        self.mTv = tv
    }
    
    
    var body: some View {
        
        GeometryReader { geometry in
            ZStack (alignment: .top){
                ZStack(alignment: .top){
                    
                    /// BANNER
                    URLImage( URL(string: "https://image.tmdb.org/t/p/original\(self.mTv.poster_path ?? "")")!,
                              placeholder: {
                                ProgressView($0) { progress in
                                    ZStack {
                                        if progress > 0.0 {
                                            CircleProgressView(progress).stroke(lineWidth: 8.0)
                                        }
                                        else {
                                            CircleActivityView().stroke(lineWidth: 50.0)
                                        }
                                    }
                                }
                                .frame(width: 50.0, height: 50.0)
                    },
                              content: {
                                $0.image
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
                                    .clipped(antialiased: true)
                                
                                
                                
                    }).padding(.bottom, geometry.size.height*0.2)
                    
                    /// Gradient Black
                    Rectangle()
                        .fill( LinearGradient(
                            gradient: .init(colors: [Colors.blackAlpha, Colors.black]),
                            startPoint: .init(x: 0.0, y: 0.6),
                            endPoint: .init(x: 0.0, y: 1.0)
                        ))
                        .frame(height: geometry.size.height - geometry.size.height*0.2).frame(maxWidth: .infinity)
                    
                    
                }
                
                ScrollView{
                    VStack(alignment: .leading, spacing: 0.0){
                        
                        /// TITLE
                        ZStack(alignment: .bottom){
                            Rectangle()
                                .fill(LinearGradient(
                                    gradient: .init(colors: [Colors.blackAlpha, Colors.black]),
                                    startPoint: .init(x: 0.0, y: 0.7),
                                    endPoint: .init(x: 0.0, y: 1.0)
                                ))
                                .frame(height: geometry.size.height - geometry.size.height*0.2).frame(maxWidth: .infinity)
                            
                            Text(self.mTv.name).font(.largeTitle)
                                .foregroundColor(Colors.white)
                                .fontWeight(.bold)
                                .frame(maxWidth: .infinity, alignment: .leading).padding()
                            
                        }
                        
                        /// CONTENT
                        ZStack{
                            Colors.black
                            
                            VStack (alignment: .leading, spacing: 30){
                                
                                VStack(alignment: .leading, spacing: 10){
                                    /// RATING
                                    HStack{
                                        RatingView(rating: 5*(self.mTv.vote_average/10)).frame(height: 20)
                                        Spacer()
                                        Text(DateUtil.convertDateFormat(inputDate: self.mTv.first_air_date)).font(.caption)
                                        
                                    }.padding(.bottom)
                                    
                                    /// GENRES
                                    ForEach(self.tvVM.tvModel.genres) { genre in
                                        Text(genre.name).font(.callout)
                                    }
                                    
                                    
                                    
                                    /// OVERVIEW
                                    Text(self.tvVM.tvModel.overview).font(.body).frame(maxWidth: .infinity, alignment: .leading).padding(.top)
                                }
                                
                                
                                /// NETWORKS
                                VStack(alignment: .leading, spacing: 10){
                                    Text("Network:").font(.title).fontWeight(.bold).frame(maxWidth: .infinity, alignment: .leading)
                                    
                                    
                                    HStack(spacing: 10) {
                                        ForEach(self.tvVM.tvModel.networks){ network in
                                            LogoView(company: network)
                                        }
                                    }
                                }
                                
                                
                                /// PRODUCTION
                                VStack(alignment: .leading, spacing: 10){
                                    Text("Production:").font(.title).fontWeight(.bold).frame(maxWidth: .infinity, alignment: .leading)
                                    
                                    ForEach(self.tvVM.tvModel.production_companies){ company in
                                        Text(company.name)
                                    }
                                }
                                
                                
                                
                                /// SIMILAR
                                VStack(alignment: .leading){
                                    
                                    Text("Similar:").font(.title).fontWeight(.bold)
                                    
                                    ScrollView(.horizontal, content: {
                                        HStack(spacing: 10) {
                                            ForEach(self.tvsSimilarVM.tvs){ tv in
                                                
                                                
                                                NavigationLink(destination: DetailView(tv:tv)) {
                                                    LogoTvView(tv: tv)
                                                }.buttonStyle(PlainButtonStyle())
                                            }
                                            
                                        }
                                    })
                                    
                                }.padding(.bottom)
                                
                            }.padding()
                            
                            
                        }
                        
                        
                    }
                    
                }.edgesIgnoringSafeArea(.all)
                
            }
        }.navigationBarTitle("\(self.mTv.name)", displayMode: .inline)
            .onAppear(){
                self.tvVM.fetchTV(tv: self.mTv)
                self.tvsSimilarVM.fetchTvsBy(tv: self.mTv)
        }
        
        
    }
    
}


struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        
        let tv = TV(id: 12, name: "Name", first_air_date:"2015-04-10", poster_path: "/3wx3EAMtqnbSLhGG8NrqXriCUIQ.jpg", vote_average: 7.6)
        
        return DetailView(tv: tv)
        
    }
}

