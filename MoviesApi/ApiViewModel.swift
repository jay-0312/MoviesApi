//
//  ApiViewModel.swift
//  MoviesApi
//
//  Created by Dhananjay on 31/01/22.
//

import SwiftUI


class ApiViewModel: ObservableObject{
    
    @Published var movieData: [MovieData] = []
    
    func fetchData(){
        
        guard let url = URL(string: urlLink) else {return}
        
        URLSession.shared.dataTask(with: url) { data, response, error  in
            
            guard let data = data, error == nil else {return}
                                    
            do {
                
                let movies = try JSONDecoder().decode(ApiModel.self, from: data)
                DispatchQueue.main.async {
                    
                    self.movieData = movies.results
                    
                    print(self.movieData[0].original_title)
                }
            }
            
            catch{
                print("error found \(error)")
            }
 
            
        }.resume()
    
    }
    
    func filteredUsers(_ query: String) -> [MovieData]{
        
        let lowercasedQuery = query.lowercased()
        
        return movieData.filter({ $0.original_title.lowercased().contains(lowercasedQuery)})
    }

}



