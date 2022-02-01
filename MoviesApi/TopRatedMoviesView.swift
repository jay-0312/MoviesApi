//
//  TopRatedMoviesView.swift
//  MoviesApi
//
//  Created by Dhananjay on 31/01/22.
//

import SwiftUI
import Kingfisher

struct TopRatedMoviesView: View {
    
    var imageName = ""
    
    var body: some View {
        ZStack(alignment:.center){
            KFImage(URL(string: imageName))
                .resizable()
                .scaledToFill()
                .clipped()
                .frame(width: 300, height: 250)
                .cornerRadius(20)
                .opacity(0.9)
            
            Image(systemName: "play.circle")
                .resizable()
                .scaledToFill()
                .clipped()
                .frame(width: 50, height: 50)
                .foregroundColor(.white)
        }
        

    }
}

struct TopRatedMoviesView_Previews: PreviewProvider {
    static var previews: some View {
        TopRatedMoviesView()
    }
}
