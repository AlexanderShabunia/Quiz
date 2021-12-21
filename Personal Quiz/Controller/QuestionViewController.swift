//
//  QuestionViewController.swift
//  Personal Quiz
//
//  Created by Alex on 10/21/21.
//  Copyright © 2021 AlexShab. All rights reserved.
//

import UIKit

// MARK: - Question Screen
class QuestionViewController: UIViewController {
    
    @IBOutlet weak var questionLabel: UILabel!
    
    @IBOutlet weak var singleStackView: UIStackView!
    @IBOutlet var singleButtons: [UIButton]!
    
    @IBOutlet weak var multipleStackView: UIStackView!
    @IBOutlet var multiLabels: [UILabel]!
    @IBOutlet var multiSwitches: [UISwitch]!
    
    @IBOutlet weak var rangeStackView: UIStackView!
    @IBOutlet var rangeLabels: [UILabel]!
    @IBOutlet weak var rangedSlider: UISlider!
    
    @IBOutlet weak var questionProgressView: UIProgressView!
        
    // MARK: - Stored Properties
    /// Answers chosen by user
    var answersChosen = [Answer]()
    
    /// Index of current question
    var questionIndex = 0
    
    /// List of question
    var questions = Question.loadData()
}
// MARK: - IB Actions
extension QuestionViewController {
    @IBAction func SingleAnwsersButtonPressed(_ sender: UIButton) {
        let currentAnswers = questions[questionIndex].answers
        guard let buttonIndex = singleButtons.firstIndex(of: sender) else { return }
        let answer = currentAnswers[buttonIndex]
        answersChosen.append(answer)
        
        nextQuestion()
    }
    @IBAction func multiAnswerButtonPressed() {
        let currentAnswers = questions[questionIndex].answers
        for (multiSwitch, answer) in zip(multiSwitches, currentAnswers) {
            if multiSwitch.isOn {
                answersChosen.append(answer)
            }
        }
        nextQuestion()
    }
    
    @IBAction func rangedAnswerButtonPassed() {
        let currentAnswers = questions[questionIndex].answers
        let index = Int(round(rangedSlider.value * Float(currentAnswers.count - 1)))
        answersChosen.append(currentAnswers[index])
        
        nextQuestion()
    }
}

// MARK: - State
extension QuestionViewController {
    func nextQuestion() {
        questionIndex += 1
        
        if questionIndex < questions.count {
            upDateUI()
        } else {
            performSegue(withIdentifier: "ResultSegue", sender: nil)
        }
    }
    override func prepare(for Segue: UIStoryboardSegue, sender: Any?) {
        guard Segue.identifier == "ResultSegue" else { return }
        guard let destination = Segue.destination as? ResultsViewController else { return }
        destination.responses = answersChosen
    }
}

// MARK: - UIViewController Methods
extension QuestionViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        // update user interface
        upDateUI()
    }
}

// MARK: - User Interface
extension QuestionViewController {
    /// Updates user interface
    func upDateUI() {
        // hide everything
        for stackView in [singleStackView, multipleStackView, rangeStackView] {
            stackView?.isHidden = true
        }
        // get current question
        let currentQuestion = questions[questionIndex]
        
        questionLabel.text = currentQuestion.text
        
        // get current answers
        let currentAnswers =  currentQuestion.answers
        
        // calculate progress
        let totalProgress = Float(questionIndex) / Float(questions.count)
        
        // set progress for questionProgressView
        questionProgressView.setProgress(totalProgress, animated: true)
        
        // set navigation title
        navigationItem.title = "Вопрос № \(questionIndex + 1) из \(questions.count)"
        
        // show stack view corresponding to question type
        switch currentQuestion.type {
        case .multiple:
            upDateMultipleleStack(using: currentAnswers)
        case .ranged:
            upDateRangeStack(using: currentAnswers)
        case .single:
            upDateSingleStack(using: currentAnswers)
        }
    }
    
    /// Setup single stack view
    ///
    /// - Parametranswers: [Answer] with answers
    func upDateSingleStack(using answers: [Answer]) {
        // show single stack view
        singleStackView.isHidden = false
        
        for (button, answer) in zip(singleButtons, answers) {
            button.setTitle(answer.text, for: [])
        }
    }
    /// Setup range stack view
    ///
    /// - Parametranswers: [Answer] with answers
    func upDateRangeStack(using answers: [Answer]) {
        // show range stack view
        rangeStackView.isHidden = false
        
        rangeLabels.first?.text = answers.first?.text
        rangeLabels.last?.text = answers.last?.text
    }
    /// Setup multiple stack view
    /// - Parametranswers: [Answer] with answers
    func upDateMultipleleStack(using answers: [Answer]) {
        // show multiple stack view
        multipleStackView.isHidden = false
        
        for (label, answer) in zip(multiLabels, answers) {
            label.text = answer.text
        }
    }
}


