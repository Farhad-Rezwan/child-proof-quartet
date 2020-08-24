//
//  Question.swift
//  Kids Safe Heaven
//
//  Created by Farhad Ullah Rezwan on 24/8/20.
//  Copyright © 2020 Farhad Ullah Rezwan. All rights reserved.
//

import Foundation

class Question {
    let questionImage: String
    let question: String
    let optionA: String
    let optionB: String
    let optionC: String
    let optionD: String
    let corretAnswer: Int
    
    init(questionImage: String, question: String, optionA: String, optionB: String, optionC: String, optionD: String, answer: Int) {
        self.questionImage = questionImage
        self.question = question
        self.optionA = optionA
        self.optionB = optionB
        self.optionC = optionC
        self.optionD = optionD
        self.corretAnswer = answer
    }

}
