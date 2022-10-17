//
//  HTTPClient.swift
//  SampleForAppIcon
//
//  Created by Lahiru Chathuranga on 2022-10-16.
//

import Foundation

protocol HTTPClient {
    func sendRequest<T: Decodable>(endpoint: Endpoint, responseModel: T.Type) async throws -> T
}
extension HTTPClient {
    func sendRequest<T: Decodable>(
        endpoint: Endpoint,
        responseModel: T.Type
    ) async throws -> T {
        var urlComponents = URLComponents()
        urlComponents.scheme = endpoint.scheme
        urlComponents.host = endpoint.host
        urlComponents.path = endpoint.path
        urlComponents.queryItems = [
             URLQueryItem(name: "api_key", value: "c999071c962960ed6f011732d2a81952")
        ]
        
        
        guard let url = urlComponents.url else {
            throw RequestError.invalidURL
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = endpoint.method.rawValue
        request.allHTTPHeaderFields = endpoint.header
        print(request)
        
        if let body = endpoint.body {
            request.httpBody = try? JSONSerialization.data(withJSONObject: body, options: [])
        }
        
        do {
            let (data, response) = try await URLSession.shared.data(for: request, delegate: nil)
            guard let response = response as? HTTPURLResponse else {
                throw RequestError.noResponse
            }
            
            switch response.statusCode {
            case 200...299:
                guard let decodedResponse = try? JSONDecoder().decode(responseModel, from: data) else {
                    throw RequestError.decode
                }
                return decodedResponse
            case 401:
                throw RequestError.unauthorized
            default:
                throw RequestError.unexpectedStatusCode
            }
        } catch {
            throw RequestError.unknown
        }
    }
}
