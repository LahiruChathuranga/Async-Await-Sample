//
//  ViewMOdel.swift
//  SampleForAppIcon
//
//  Created by Lahiru Chathuranga on 2022-10-17.
//

import Foundation
import RxCocoa
import RxSwift

class ViewModel {
    
    var topRatedItems = PublishSubject<[Movie]>()
    
    var service: MovieServiceable
    
    init(service: MovieServiceable) {
        self.service = service
    }
    
    func fetchTopRatedMovies() {
        Task {
            do {
                let movies = try await service.getTopRated()
                topRatedItems.onNext(movies.results)
                topRatedItems.onCompleted()
            } catch {
                print(error)
            }
        }
    }
}
