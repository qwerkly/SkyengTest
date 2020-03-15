//
//  APIClient.swift
//  SkyengTest
//
//  Created by Бабич Иван Юрьевич on 14.03.2020.
//  Copyright © 2020 Babich Ivan. All rights reserved.
//

import Alamofire

class APIClient {
    @discardableResult
    private static func performRequest<T: Decodable>(route: APIRouter, decoder: JSONDecoder = JSONDecoder(), completion: @escaping (Result<T>) -> Void) -> DataRequest {
        Alamofire
            .request(route)
            .validate(statusCode: 200..<300)
            .responseData {
                let decoded: Result<T> = decoder.decodeResponse(from: $0)
                completion(decoded)
        }
    }
    
    @discardableResult
    static func searchWords(_ search: String, pageSize: Int, currentPage: Int, completion: @escaping (Result<[Word]>) -> Void) -> DataRequest {
        return performRequest(route: .words(search: search, pageSize: pageSize, currentPage: currentPage), completion: completion)
    }
    
    @discardableResult
    static func getMeanings(for id: Int, completion: @escaping (Result<Meaning>) -> Void) -> DataRequest {
        return performRequest(route: .meanings(id: id), completion: completion)
    }
}
