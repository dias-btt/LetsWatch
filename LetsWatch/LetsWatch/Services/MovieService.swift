//
//  MovieService.swift
//  LetsWatch
//
//  Created by Диас Сайынов on 21.05.2024.
//

import Foundation
import Alamofire

enum MovieEndpoint: String, CaseIterable {
    case nowPlaying = "now_playing"
    case topRated = "top_rated"
    case popular
    
    var description: String {
        switch self{
        case .nowPlaying:
            return "Now Playing"
        case .popular:
            return "Popular"
        case.topRated:
            return "Top Rated"
        }
    }
}

enum MovieError: Error, CustomNSError{
    case apiError
    case invalidEndpoint
    case invalidResponse
    case noData
    case serializationError
    
    var localizedDescription: String {
        switch self{
        case .apiError:
            return "Failed to fetch data"
        case .invalidEndpoint:
            return "Invalid endpoint"
        case .invalidResponse:
            return "Invalid response"
        case .noData:
            return "No data"
        case .serializationError:
            return "Failed to decode data"
        }
    }
}

struct MovieService {
    let apiKey = "496d85be9769f76e1417193ee7f81dea"
    
    func fetchMovies(selectedGenres: [Int], releaseYear: Int, minVoteAverage: Double, maxVoteAverage: Double, language: String, releaseYearRange: [Int], completion: @escaping ([Movie]?, Error?) -> Void) {
        var urlComponents = URLComponents(string: "https://api.themoviedb.org/3/discover/movie")!
        
        var queryItems = [
            URLQueryItem(name: "api_key", value: apiKey),
            URLQueryItem(name: "vote_average.gte", value: String(minVoteAverage)),
            URLQueryItem(name: "vote_average.lte", value: String(maxVoteAverage)),
            URLQueryItem(name: "language", value: language),
            URLQueryItem(name: "sort_by", value: "popularity.desc"),
        ]
        
        let genresString = selectedGenres.map(String.init).joined(separator: ",")
        queryItems.append(URLQueryItem(name: "with_genres", value: genresString))
        
        let yearsString = releaseYearRange.map(String.init).joined(separator: ",")
        queryItems.append(URLQueryItem(name: "primary_release_year", value: yearsString))
        
        urlComponents.queryItems = queryItems
        
        guard let url = urlComponents.url else {
            print("Invalid URL")
            completion(nil, NSError(domain: "InvalidURL", code: 0, userInfo: nil))
            return
        }
        
        AF.request(url).validate().responseJSON { response in
            switch response.result {
            case .success:
                if let data = response.data {
                    do {
                        let decodedResponse = try JSONDecoder().decode(MovieResponse.self, from: data)
                        completion(decodedResponse.results, nil)
                    } catch {
                        print("Error decoding JSON: \(error)")
                        completion(nil, error)
                    }
                } else {
                    completion(nil, MovieError.noData)
                }
            case .failure(let error):
                print("Request failed with error: \(error)")
                completion(nil, error)
            }
        }
    }
        
    func loadMovies(from endpoint: MovieEndpoint, completion: @escaping ([Movie]?, MovieError?) -> Void) {
        guard let url = URL(string: "https://api.themoviedb.org/3/movie/\(endpoint.rawValue)") else {
            completion(nil, .invalidEndpoint)
            return
        }
        
        let parameters: [String: String] = [
            "language": "en-US",
            "api_key": apiKey
        ]
        
        AF.request(url, parameters: parameters).validate().responseJSON { response in
            switch response.result {
            case .success:
                if let data = response.data {
                    do {
                        let decodedResponse = try JSONDecoder().decode(MovieResponse.self, from: data)
                        completion(decodedResponse.results, nil)
                    } catch {
                        print("Error decoding JSON: \(error)")
                        completion(nil, .serializationError)
                    }
                } else {
                    completion(nil, .noData)
                }
            case .failure(let error):
                print("Request failed with error: \(error)")
                completion(nil, .apiError)
            }
        }
    }
}
