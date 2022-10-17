//
//  MoviesEndPoint.swift
//  SampleForAppIcon
//
//  Created by Lahiru Chathuranga on 2022-10-17.
//

import Foundation

enum MoviesEndpoint {
    case topRated
    case movieDetail(id: Int)
}
extension MoviesEndpoint: Endpoint {
    var path: String {
           switch self {
           case .topRated:
               return "/3/movie/top_rated"
           case .movieDetail(let id):
               return "/3/movie/\(id)"
           }
       }

       var method: RequestMethod {
           switch self {
           case .topRated, .movieDetail:
               return .get
           }
       }

       var header: [String: String]? {
           // Access Token to use in Bearer header
           let accessToken = "eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJjOTk5MDcxYzk2Mjk2MGVkNmYwMTE3MzJkMmE4MTk1MiIsInN1YiI6IjYzNGNmMWI1ZTI2M2JiMDA5YzRmZjM3OCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.KXPRNwVYJEj91itTch0aXV9-78wDYoDHdIafQZ7ZCNI"
           switch self {
           case .topRated, .movieDetail:
               return [
                   "Authorization": "Bearer \(accessToken)",
                   "Content-Type": "application/json;charset=utf-8",

               ]
           }
       }
       
       var body: [String: String]? {
           switch self {
           case .topRated, .movieDetail:
               return nil
           }
       }
}

//c999071c962960ed6f011732d2a81952
