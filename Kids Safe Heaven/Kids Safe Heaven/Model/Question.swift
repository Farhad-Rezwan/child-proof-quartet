//
//  Question.swift
//  Kids Safe Heaven
//
//  Created by Farhad Ullah Rezwan on 24/8/20.
//  Copyright © 2020 Farhad Ullah Rezwan. All rights reserved.
//

import Foundation

class Question {
    let question: String
    let optionA: String
    let optionB: String
    let optionAImage: String
    let optionBImage: String
    let corretAnswer: Int
    
    init(question: String, optionA: String, optionB: String, optionAImage: String, optionBImage: String, correctAnswer: Int) {
        self.question = question
        self.optionA = optionA
        self.optionB = optionB
        self.optionAImage = optionAImage
        self.optionBImage = optionBImage
        self.corretAnswer = correctAnswer
    }

}
