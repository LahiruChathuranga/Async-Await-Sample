//
//  Models.swift
//  SampleForAppIcon
//
//  Created by Lahiru Chathuranga on 2022-10-16.
//

import Foundation

struct ITunesResult: Codable {
    let resultCount : Int?
    let results : [Album]?
    
    enum CodingKeys: String, CodingKey {
        
        case resultCount = "resultCount"
        case results = "results"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        resultCount = try values.decodeIfPresent(Int.self, forKey: .resultCount)
        results = try values.decodeIfPresent([Album].self, forKey: .results)
    }
}

struct Album : Codable {
    let wrapperType : String?
    let collectionType : String?
    let artistId : Int?
    let collectionId : Int?
    let amgArtistId : Int?
    let artistName : String?
    let collectionName : String?
    let collectionCensoredName : String?
    let artistViewUrl : String?
    let collectionViewUrl : String?
    let artworkUrl60 : String?
    let artworkUrl100 : String?
    let collectionPrice : Double?
    let collectionExplicitness : String?
    let trackCount : Int?
    let copyright : String?
    let country : String?
    let currency : String?
    let releaseDate : String?
    let primaryGenreName : String?
    
    enum CodingKeys: String, CodingKey {
        
        case wrapperType = "wrapperType"
        case collectionType = "collectionType"
        case artistId = "artistId"
        case collectionId = "collectionId"
        case amgArtistId = "amgArtistId"
        case artistName = "artistName"
        case collectionName = "collectionName"
        case collectionCensoredName = "collectionCensoredName"
        case artistViewUrl = "artistViewUrl"
        case collectionViewUrl = "collectionViewUrl"
        case artworkUrl60 = "artworkUrl60"
        case artworkUrl100 = "artworkUrl100"
        case collectionPrice = "collectionPrice"
        case collectionExplicitness = "collectionExplicitness"
        case trackCount = "trackCount"
        case copyright = "copyright"
        case country = "country"
        case currency = "currency"
        case releaseDate = "releaseDate"
        case primaryGenreName = "primaryGenreName"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        wrapperType = try values.decodeIfPresent(String.self, forKey: .wrapperType)
        collectionType = try values.decodeIfPresent(String.self, forKey: .collectionType)
        artistId = try values.decodeIfPresent(Int.self, forKey: .artistId)
        collectionId = try values.decodeIfPresent(Int.self, forKey: .collectionId)
        amgArtistId = try values.decodeIfPresent(Int.self, forKey: .amgArtistId)
        artistName = try values.decodeIfPresent(String.self, forKey: .artistName)
        collectionName = try values.decodeIfPresent(String.self, forKey: .collectionName)
        collectionCensoredName = try values.decodeIfPresent(String.self, forKey: .collectionCensoredName)
        artistViewUrl = try values.decodeIfPresent(String.self, forKey: .artistViewUrl)
        collectionViewUrl = try values.decodeIfPresent(String.self, forKey: .collectionViewUrl)
        artworkUrl60 = try values.decodeIfPresent(String.self, forKey: .artworkUrl60)
        artworkUrl100 = try values.decodeIfPresent(String.self, forKey: .artworkUrl100)
        collectionPrice = try values.decodeIfPresent(Double.self, forKey: .collectionPrice)
        collectionExplicitness = try values.decodeIfPresent(String.self, forKey: .collectionExplicitness)
        trackCount = try values.decodeIfPresent(Int.self, forKey: .trackCount)
        copyright = try values.decodeIfPresent(String.self, forKey: .copyright)
        country = try values.decodeIfPresent(String.self, forKey: .country)
        currency = try values.decodeIfPresent(String.self, forKey: .currency)
        releaseDate = try values.decodeIfPresent(String.self, forKey: .releaseDate)
        primaryGenreName = try values.decodeIfPresent(String.self, forKey: .primaryGenreName)
    }
    
}

struct TopRated: Codable {
    let page: Int
    let totalPages: Int
    let totalResults: Int
    let results: [Movie]
    
    enum CodingKeys: String, CodingKey {
        case page
        case results
        case totalPages = "total_pages"
        case totalResults = "total_results"
    }
}

struct Movie: Codable {
    let adult : Bool?
        let backdrop_path : String?
        let genre_ids : [Int]?
        let id : Int?
        let original_language : String?
        let original_title : String?
        let overview : String?
        let popularity : Double?
        let poster_path : String?
        let release_date : String?
        let title : String?
        let video : Bool?
        let vote_average : Double?
        let vote_count : Int?

        enum CodingKeys: String, CodingKey {

            case adult = "adult"
            case backdrop_path = "backdrop_path"
            case genre_ids = "genre_ids"
            case id = "id"
            case original_language = "original_language"
            case original_title = "original_title"
            case overview = "overview"
            case popularity = "popularity"
            case poster_path = "poster_path"
            case release_date = "release_date"
            case title = "title"
            case video = "video"
            case vote_average = "vote_average"
            case vote_count = "vote_count"
        }

        init(from decoder: Decoder) throws {
            let values = try decoder.container(keyedBy: CodingKeys.self)
            adult = try values.decodeIfPresent(Bool.self, forKey: .adult)
            backdrop_path = try values.decodeIfPresent(String.self, forKey: .backdrop_path)
            genre_ids = try values.decodeIfPresent([Int].self, forKey: .genre_ids)
            id = try values.decodeIfPresent(Int.self, forKey: .id)
            original_language = try values.decodeIfPresent(String.self, forKey: .original_language)
            original_title = try values.decodeIfPresent(String.self, forKey: .original_title)
            overview = try values.decodeIfPresent(String.self, forKey: .overview)
            popularity = try values.decodeIfPresent(Double.self, forKey: .popularity)
            poster_path = try values.decodeIfPresent(String.self, forKey: .poster_path)
            release_date = try values.decodeIfPresent(String.self, forKey: .release_date)
            title = try values.decodeIfPresent(String.self, forKey: .title)
            video = try values.decodeIfPresent(Bool.self, forKey: .video)
            vote_average = try values.decodeIfPresent(Double.self, forKey: .vote_average)
            vote_count = try values.decodeIfPresent(Int.self, forKey: .vote_count)
        }

}

struct Genre: Codable {
    let id: Int?
    let name: String?
}
struct Company: Codable {
    let name: String?
    let id: Int?
    let logo_path: String?
    let origin_country: Country?
}
struct Country: Codable {
    let iso_3166_1: String?
    let name: String?
}
struct Languages: Codable {
    let iso_639_1: String?
    let name: String?
}
