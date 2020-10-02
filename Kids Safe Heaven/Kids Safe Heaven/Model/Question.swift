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
    let questionSound: String
    let optionAImage: String
    let optionBImage: String
    let corretAnswer: Int
    let section: String
    let optionATips: String
    let optionBTips: String
    
    init(question: String, questionSound: String, optionAImage: String, optionBImage: String, correctAnswer: Int, section: String, optionATips: String, optionBTips: String) {
        self.question = question
        self.questionSound = questionSound
        self.optionAImage = optionAImage
        self.optionBImage = optionBImage
        self.optionATips = optionATips
        self.optionBTips = optionBTips
        self.corretAnswer = correctAnswer
        self.section = section
        
    }

}
