//
//  RatingView.swift
//  Movies
//
//  Created by MacBook Pro 2016 15".
//  Copyright © 2020 Pedro MKT. All rights reserved.
//

import SwiftUI
import Cosmos

struct RatingView: UIViewRepresentable {
    var rating: Double

    func makeUIView(context: Context) -> CosmosView {
        return CosmosView()
    }

    func updateUIView(_ uiView: CosmosView, context: Context) {
        var settings = CosmosSettings()
        settings.fillMode = .precise
        
        uiView.settings.filledImage = UIImage(named: "StarFilled")?.withRenderingMode(.alwaysOriginal)
        uiView.settings.emptyImage = UIImage(named: "StarEmpty")?.withRenderingMode(.alwaysOriginal)
        uiView.settings.totalStars = 5
        uiView.settings.starMargin = 3
        uiView.settings.starSize = 17
        uiView.settings.textColor = Colors.starts
        uiView.settings.textMargin = 10
        uiView.settings.textFont = UIFont.systemFont(ofSize: 17.0)
        uiView.settings.updateOnTouch = false
        
        
        //uiView.frame = CGRect(x: uiView.frame.origin.x, y: uiView.frame.origin.y, width: 200, height: 20)
        
        uiView.text = String(format: "%.1f", rating)
        uiView.rating = rating
        
    }
}
