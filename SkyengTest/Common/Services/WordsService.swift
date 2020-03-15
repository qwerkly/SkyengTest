//
//  WordsService.swift
//  SkyengTest
//
//  Created by Бабич Иван Юрьевич on 13.03.2020.
//  Copyright © 2020 Babich Ivan. All rights reserved.
//

import Foundation

protocol WordsService {
    var pageSize: Int { get }
    
    func searchWords(_ search: String, currentPage: Int, completion: @escaping ([Word]?, Error?) -> Void)
    func getMeanings(for id: Int, completion: @escaping (Meaning?, Error?) -> Void)
}

struct WordsServiceImpl: WordsService {
    let pageSize: Int
    
    init(pageSize: Int) {
        self.pageSize = pageSize
    }
    
    func searchWords(_ search: String, currentPage: Int, completion: @escaping ([Word]?, Error?) -> Void) {
        guard !search.isEmpty else {
            completion(nil, nil)
            return
        }
        
        APIClient.searchWords(search, pageSize: pageSize, currentPage: currentPage) {
            switch $0 {
            case .success(let words):
                completion(words, nil)
            case .failure(let error):
                completion(nil, error)
            }
        }
    }
    
    func getMeanings(for id: Int, completion: @escaping (Meaning?, Error?) -> Void) {
        APIClient.getMeanings(for: id) {
            switch $0 {
            case .success(let meaning):
                completion(meaning, nil)
            case .failure(let error):
                completion(nil, error)
            }
        }
    }
}
