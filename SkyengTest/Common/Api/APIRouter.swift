//
//  ApiRouter.swift
//  SkyengTest
//
//  Created by Бабич Иван Юрьевич on 14.03.2020.
//  Copyright © 2020 Babich Ivan. All rights reserved.
//

import Alamofire

enum APIRouter: URLRequestConvertible {
    case meanings(id: Int)
    case words(search: String, pageSize: Int, currentPage: Int)
    
    private var method: HTTPMethod {
        switch self {
        case .meanings, .words:
            return .get
        }
    }
    
    private var path: String {
        switch self {
        case .meanings:
            return "/meanings"
        case .words:
            return "/words/search"
        }
    }
    
    private var queryItems: [URLQueryItem] {
        switch self {
        case .meanings(let id):
            return [URLQueryItem(name: "ids", value: "\(id)")]
        case .words(let search, let pageSize, let currentPage):
            return [
                URLQueryItem(name: "search", value: search),
                URLQueryItem(name: "pageSize", value: "\(pageSize)"),
                URLQueryItem(name: "page", value: "\(currentPage)")
            ]
        }
    }
    
    func asURLRequest() throws -> URLRequest {
        var urlComponents = URLComponents(string: Config.apiUrl + path)
        urlComponents?.queryItems = queryItems
        
        var urlRequest = URLRequest(url: try urlComponents!.asURL())
        urlRequest.httpMethod = method.rawValue
        
        urlRequest.setValue("application/json", forHTTPHeaderField: "Content-type")
        urlRequest.setValue("application/json", forHTTPHeaderField: "Accept")
        
        print(urlRequest)
        
        return urlRequest
    }
}
