//
//  ViewController.swift
//  SampleForAppIcon
//
//  Created by Lahiru Chathuranga on 2022-10-15.
//

import UIKit
import RxSwift
import RxCocoa

class ViewController: UIViewController, UIScrollViewDelegate {
    
    @IBOutlet weak var tableView: UITableView! {
        didSet {
            tableView.rx.setDelegate(self).disposed(by: bag)
        }
    }
    
    let viewModel = ViewModel(service: MovieService())
    let bag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        bindTableView()
    }
    
    // Using RX
    func bindTableView() {
        viewModel.topRatedItems.bind(
            to: tableView.rx.items(
                cellIdentifier: "cell", cellType: TVCell.self)
        ) { row, model, cell in
            cell.infoLabel.text = model.title
        }.disposed(by: bag)
        
        tableView.rx.modelSelected(Movie.self).bind { movie in
            self.showInfo(movie.overview)
        }
        .disposed(by: bag)
        
        fetchMovies()
    }
    
    func showInfo(_ info: String?) {
        let alert = UIAlertController(title: "Info", message: info, preferredStyle: .alert)
        let dismissButton = UIAlertAction(title: "Dismiss", style: .cancel)
        alert.addAction(dismissButton)
        self.present(alert, animated: true)
    }
    
    func fecthAlbums() {
        // Start an async task
        Task {
            do {
                let albums = try await NetworkManager().fetchAlbum()
                print(albums)
            } catch {
                print("Request failed with error: \(error)")
            }
        }
    }
    
    func fetchMovies() {
        viewModel.fetchTopRatedMovies()
    }
    
    
}

// MARK: - CORE IDEA IMPLEMENTATION
protocol NetworkManagerProtocol {
    func fetchAlbum() async throws -> [Album]
}

class NetworkManager: NetworkManagerProtocol {
    
    enum AlbumsFetcherError: Error {
        case invalidURL
        case missingData
    }
    
    func fetchAlbum() async throws -> [Album] {
        
        guard let url = URL(string: "https://itunes.apple.com/search?term=taylor+swift&entity=album") else {
            throw AlbumsFetcherError.invalidURL
        }
        
        // Use the async variant of URLSession to fetch data
        // Code might suspend here
        let (data, _) = try await URLSession.shared.data(from: url)
        
        // Parse the JSON data
        let iTunesResult = try JSONDecoder().decode(ITunesResult.self, from: data)
        return iTunesResult.results!
    }
}
