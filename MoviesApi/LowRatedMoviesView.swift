//
//  LowRatedMoviesView.swift
//  MoviesApi
//
//  Created by Dhananjay on 31/01/22.
//

import SwiftUI
import Kingfisher

struct LowRatedMoviesView: View {
    
    var imageName = ""
    var movieTitle = ""
    var movieDescription = ""
    
    var body: some View {
        
        HStack{
            
            KFImage(URL(string: imageName))
                .resizable()
                .scaledToFill()
                .clipped()
                .frame(width: 150, height: 200)
                .cornerRadius(20)
                .opacity(0.9)
                .padding()
            
            VStack(alignment: .center){
                Text(movieTitle)
                    .font(.system(size: 12, weight: .bold))
                    .padding()
                
                Text(movieDescription)
                    .font(.system(size: 10))
                    
            }
            
            Spacer()

        }
        
    }
}


struct LowRatedMoviesView_Previews: PreviewProvider {
    static var previews: some View {
        LowRatedMoviesView()
    }
}
