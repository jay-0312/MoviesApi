//
//  MovieDetailView.swift
//  MoviesApi
//
//  Created by Dhananjay on 31/01/22.
//

import SwiftUI
import Kingfisher

struct MovieDetailView: View {
    
    var imageName = ""
    var movieTitle = ""
    var releaseDate = ""
    var description = ""
    
    @Binding var isLiked : Bool
    
    var body: some View {
        VStack{
            KFImage(URL(string: imageName))
                .resizable()
                .scaledToFill()
                .clipped()
                .frame(width: 350, height: 200)
                .cornerRadius(20)
                
            HStack {
                VStack(alignment: .leading,spacing: 20){
                    Text(movieTitle)
                        .font(.system(size: 20, weight: .bold))
                    
                    HStack{
                        ForEach(0..<5){_ in
                            Button(action: {isLiked.toggle()}, label: {
                                if isLiked{
                                    Image(systemName: "star.fill")
                                        .foregroundColor(.yellow)
                                }
                                
                                else{
                                    Image(systemName: "star")
                                }
                            })
                                
                        }
                    }
                    
                    Text(description)
                        .font(.system(size: 15))
                }.padding()
                
                Spacer()
            }
            Spacer()
        }
    }
}

//struct MovieDetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        MovieDetailView(isLiked: .constant(true))
//    }
//}
