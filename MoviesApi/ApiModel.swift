//
//  ApiModel.swift
//  MoviesApi
//
//  Created by Dhananjay on 31/01/22.
//

import SwiftUI

struct ApiModel : Hashable ,Codable{

    var results : [MovieData]
}

struct MovieData : Hashable, Codable{

    var backdrop_path : String?
    var original_title : String
    var poster_path : String?
    var overview : String
    var vote_average : Float
}
