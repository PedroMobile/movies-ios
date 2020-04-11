//
//  ContentView.swift
//  Movies
//
//  Copyright © 2020 Pedro MKT. All rights reserved.
//

import SwiftUI

struct TvsView: View {
    
    @ObservedObject var tvsVM = TVsViewModel()
    
    init(){
        
        UITableView.appearance().separatorStyle = .none
        UITableView.appearance().backgroundColor = Colors.backgroundui
        UITableViewCell.appearance().backgroundColor = Colors.backgroundui
    }
    
    var body: some View {
        ZStack {
            
            NavigationView () {
                List (self.tvsVM.tvs.enumerated().map({ $0 }), id: \.1.self.id) { (index, tv) in
                    ZStack {
                        RowTvView(tv: tv).animation(.spring())
                            
                            .onAppear(perform: {
                        
                            let count = self.tvsVM.tvs.count

                            if index == count-1 {
                                
                              self.tvsVM.fetchTVs()
                            }
                            
                        }).padding(0)
                        
                        NavigationLink(destination: DetailView(tv:tv)) {
                                EmptyView()
                        }.buttonStyle(PlainButtonStyle())
                        
                    }
                    
                    
                }.navigationBarTitle("Discover TV")
                
                }.navigationViewStyle(StackNavigationViewStyle()).accentColor( .white)
            .onAppear(){
                self.tvsVM.fetchTVs()
            }

            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        TvsView()
    }
}
