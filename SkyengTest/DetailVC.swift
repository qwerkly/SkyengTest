//
//  DetailVC.swift
//  SkyengTest
//
//  Created by Бабич Иван Юрьевич on 13.03.2020.
//  Copyright © 2020 Babich Ivan. All rights reserved.
//

import UIKit

class DetailVC: UIViewController {
    @IBOutlet weak var wordLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    private let word: Word
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    required init(word: Word) {
        self.word = word
        super.init(nibName: nil, bundle: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        wordLabel.text = word.text
    }
    
    @IBAction func closeClicked() {
        dismiss(animated: true)
    }
}

// MARK: - UITableViewDataSource
extension DetailVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return word.meanings.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return Bundle.main.loadNibNamed("MeaningCell", owner: self, options: nil)?.first as! MeaningCell
    }
}

// MARK: - UITableViewDelegate
extension DetailVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        guard let cell = cell as? MeaningCell else { return }
        
        let meaning = word.meanings[indexPath.row]

        cell.translationLabel?.text = meaning.translation.text
        cell.meaningImageView?.setAsync(meaning.imageConvertedUrl, cacheKey: "\(meaning.id)") {
            cell.setNeedsLayout()
        }
    }
}
