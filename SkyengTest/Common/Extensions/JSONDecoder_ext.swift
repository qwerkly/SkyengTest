//
//  JSONDecoder.swift
//  SkyengTest
//
//  Created by Бабич Иван Юрьевич on 14.03.2020.
//  Copyright © 2020 Babich Ivan. All rights reserved.
//

import Alamofire

private enum BackendError: Error {
    case emptyData
    
    var description: String {
        switch self {
        case .emptyData:
            return "Empty data in response"
        }
    }
}

extension JSONDecoder {
    func decodeResponse<T: Decodable>(from response: DataResponse<Data>) -> Result<T> {
        if let error = response.error {
            return .failure(error)
        }
        
        guard let responseData = response.data else {
            return .failure(BackendError.emptyData)
        }
        
        do {
            let item = try decode(T.self, from: responseData)
            return .success(item)
        } catch {
            return .failure(error)
        }
    }
}
