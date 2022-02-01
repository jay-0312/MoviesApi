//
//  ContentView.swift
//  MoviesApi
//
//  Created by Dhananjay on 31/01/22.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var viewModel = ApiViewModel()
    
    @State var isLiked = false
    
    @State var searchText = ""
    
    var backdrop = ""
    
    var poster = ""
    
    var body: some View {
        
        NavigationView {
            
            VStack {
                
                SearchBarView(text: $searchText)
                
                List{
                    
                    ForEach(searchText .isEmpty ? viewModel.movieData : viewModel.filteredUsers(searchText) ,id:\.self) {  movie in
                      
                        NavigationLink(destination: MovieDetailView(imageName: "\(LinkBackdrop)" + "\(movie.backdrop_path ?? "")", movieTitle: movie.original_title, description: movie.overview, isLiked: $isLiked),
                                       label: {
                            if movie.vote_average > 7{
                                TopRatedMoviesView(imageName: "\(LinkBackdrop)" + "\(movie.backdrop_path ?? "person")")
                            
                            }

                            else{
                                LowRatedMoviesView(imageName: "\(LinkPoster)" + "\(movie.poster_path ?? "person")", movieTitle: movie.original_title, movieDescription: movie.overview)
                            }

                        })
                    
                        
                    }.onDelete(perform: deleteRows)
                    
                }
                
                .onAppear{
                    viewModel.fetchData()
            }
                
                .toolbar{
                    EditButton()
            }
            }
        }
        

    }
        
    
    func deleteRows(at offsets: IndexSet){
                
        viewModel.movieData.remove(atOffsets: offsets)
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
