//
//  MoviesData.swift
//  Movies
//
//  Created by Gabriel Aragao on 28/04/22.
//

import Foundation

struct MoviesData: Decodable {
    
    let results: [Result]
}
    struct Result: Decodable {
    let title: String
    let popularity: Double 
    let overview: String
    let poster_path: String
    let id: Int
}
