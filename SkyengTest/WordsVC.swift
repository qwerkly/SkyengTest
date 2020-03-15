//
//  ViewController.swift
//  SkyengTest
//
//  Created by Бабич Иван Юрьевич on 13.03.2020.
//  Copyright © 2020 Babich Ivan. All rights reserved.
//

import UIKit

class WordsVC: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    private let pageSize = 20
    private lazy var wordsService: WordsService = WordsServiceImpl(pageSize: pageSize)
    
    private var currentSearch: String?
    private var currentPage = 0
    private var isAllLoaded = true
    private var words = [Word]() {
        didSet {
            tableView.reloadData()
        }
    }
    
    private func searchNext(_ search: String) {
        guard !isAllLoaded else { return }
        
        currentPage += 1
        wordsService.searchWords(search, currentPage: currentPage) { [weak self] words, error in
            guard let self = self, self.currentSearch == search else { return }
            
            let words = words ?? []
            self.words += words
            
            if words.count < self.pageSize {
                self.isAllLoaded = true
                
                if words.isEmpty {
                    self.tableView.reloadData()
                }
            }
            
            error?.present()
        }
    }
}

// MARK: - UITableViewDataSource
extension WordsVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return words.count + (isAllLoaded ? 0 : 1)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let search = searchBar.text, indexPath.row == words.count {
            searchNext(search)
            
            return Bundle.main.loadNibNamed("LoadingCell", owner: self, options: nil)?.first as! LoadingCell
        }
        
        return UITableViewCell()
    }
}

// MARK: - UITableViewDelegate
extension WordsVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard indexPath.row != words.count else { return }
        
        present(DetailVC(word: words[indexPath.row]), animated: true)
        tableView.deselectRow(at: indexPath, animated: false)
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        guard indexPath.row != words.count else { return }
        
        cell.textLabel?.text = words[indexPath.row].text
    }
}

// MARK: - UISearchBarDelegate
extension WordsVC: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        currentSearch = searchBar.text
        words.removeAll()
        currentPage = 0
        isAllLoaded = false
        guard let search = searchBar.text, !search.isEmpty else { return }
        
        searchNext(search)
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        view.endEditing(true)
    }
}
