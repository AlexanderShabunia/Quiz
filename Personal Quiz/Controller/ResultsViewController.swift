//
//  ResultsViewController.swift
//  Personal Quiz
//
//  Created by Alex on 10/25/21.
//  Copyright © 2021 AlexShab. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {
    @IBOutlet weak var resultAnswerLabel: UILabel!
    @IBOutlet weak var resultDefinitionLabel: UILabel!
    
    var responses: [Answer]!
}

extension ResultsViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.hidesBackButton = true
        
       updateResult()
    }
}

extension ResultsViewController {
    func updateResult() {
        var frequencyOfAnswers = [EmotionType: Int]()
        let responseTypes = responses.map { $0.type }
        
        for response in responseTypes {
            frequencyOfAnswers[response] = (frequencyOfAnswers[response] ?? 0) + 1
        }
        
        let frequencyOfAnswersSorted = frequencyOfAnswers.sorted {$0.value > $1.value}
        guard let mostFrequentAnswer = frequencyOfAnswersSorted.first?.key else { return }
        
        updateUI(with: mostFrequentAnswer )
    }
    func updateUI(with answer: EmotionType) {
        resultAnswerLabel.text = "Вы - \(answer.rawValue)!"
        resultDefinitionLabel.text = answer.definition
    }
}
