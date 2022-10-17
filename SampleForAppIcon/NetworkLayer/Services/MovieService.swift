//
//  MovieService.swift
//  SampleForAppIcon
//
//  Created by Lahiru Chathuranga on 2022-10-17.
//

import Foundation

protocol MovieServiceable {
    func getTopRated() async throws -> TopRated
    func getMovieDetail(id: Int) async throws -> Movie
}

struct MovieService: HTTPClient, MovieServiceable {

    func getTopRated() async throws -> TopRated {
        return try await sendRequest(endpoint: MoviesEndpoint.topRated, responseModel: TopRated.self)
    }
    
    func getMovieDetail(id: Int) async throws -> Movie {
        return try await sendRequest(endpoint: MoviesEndpoint.movieDetail(id: id), responseModel: Movie.self)
    }
}
