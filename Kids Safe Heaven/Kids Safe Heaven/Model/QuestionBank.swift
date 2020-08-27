//
//  QuestionBank.swift
//  Kids Safe Heaven
//
//  Created by Farhad Ullah Rezwan on 24/8/20.
//  Copyright © 2020 Farhad Ullah Rezwan. All rights reserved.
//

import Foundation

class QuestionBank {
    var list = [Question] ()
    
    init() {
        list.append(Question(question: "What is more important to take before going to play park?", optionA: "First Aid Kit", optionB: "Chocolate Bar", optionAImage: "q1o1", optionBImage: "q1o2", correctAnswer: 1))
        list.append(Question(question: "I want to go to play park because", optionA: "I want to be active", optionB: "I want to be lazy", optionAImage: "active", optionBImage: "lazy", correctAnswer: 1))
        list.append(Question(question: "What should I drink more before going to play park?", optionA: "Water", optionB: "Soft Drink", optionAImage: "q3o1", optionBImage: "q3o2", correctAnswer: 1))
        list.append(Question(question: "Is it okay to go to the park all alone?", optionA: "Yes", optionB: "No", optionAImage: "q4o1", optionBImage: "q4o2", correctAnswer: 2))
        list.append(Question(question: "What will you eat before going to the park for playing?", optionA: "Fruits and Veggies", optionB: "Chocolate Bar", optionAImage: "q5o1", optionBImage: "q5o2", correctAnswer: 1))
    }
}
