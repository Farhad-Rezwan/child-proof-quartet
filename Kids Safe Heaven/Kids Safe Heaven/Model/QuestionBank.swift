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
    
    init(type: String) {
        if type == "general" {
            //  MARK: - 1
            list.append(Question(question: "What is more important to wear before going to play park?", questionSound: "q1sound", optionAImage: "q1o1", optionBImage: "q1o2", correctAnswer: 2, section: "general" , optionATips: "q1t1", optionBTips: "q1t2"))
            // MARK: - 2 implement correct tips screen 1
            list.append(Question(question: "What will you do if the play equipment is busy?", questionSound: "q2sound", optionAImage: "q2o1", optionBImage: "q2o2", correctAnswer: 1, section: "general", optionATips: "q2t1", optionBTips: "q2t2"))
            // MARK: - 3 Done
            list.append(Question(question: "What should I drink more before going to play park?", questionSound: "q3sound", optionAImage: "q3o1", optionBImage: "q3o2", correctAnswer: 1, section: "general", optionATips: "q3t1", optionBTips: "q3t2"))
            // MARK: - 4 Done
            list.append(Question(question: "How do you prefer going to a park?", questionSound: "q4sound", optionAImage: "q4o1", optionBImage: "q4o2", correctAnswer: 2, section: "general", optionATips: "q4t1", optionBTips: "q4t2"))
            // MARK: - 5 Done
            list.append(Question(question: "What will you eat before going to the park for playing?", questionSound: "q5sound", optionAImage: "q5o1", optionBImage: "q5o2", correctAnswer: 1, section: "general", optionATips: "q5t1", optionBTips: "q5t2"))
            //  MARK: - 20 done
            list.append(Question(question: "How to safely use the swing?", questionSound: "q20sound", optionAImage: "q20o1", optionBImage: "q20o2", correctAnswer: 1, section: "safetySigns", optionATips: "q20t1", optionBTips: "q20t2"))
            //  MARK: - 21 done
            list.append(Question(question: "Which picture below is the correct way of riding a bike?", questionSound: "q21sound", optionAImage: "q21o1", optionBImage: "q21o2", correctAnswer: 1, section: "safetySigns", optionATips: "q21t1", optionBTips: "q21t2"))
        } else if type == "weather" {
            // MARK: - 7 change tips screen
            list.append(Question(question: "Which is safe and cool under the hot sun?", questionSound: "q7sound", optionAImage: "q7o1", optionBImage: "q7o2", correctAnswer: 2, section: "weather", optionATips: "q7t1", optionBTips: "q7t2"))
            // MARK: - 8
            list.append(Question(question: "If it is a sunny day for play time, what should I do first?", questionSound: "q8sound", optionAImage: "q8o1", optionBImage: "q8o2", correctAnswer: 1, section: "weather", optionATips: "q8t1", optionBTips: "q8t2"))
            // MARK: - 9 change tips screen
            list.append(Question(question: "What would I like to wear before going out to play on a sunny day?", questionSound: "q9sound", optionAImage: "q9o1", optionBImage: "q9o2", correctAnswer: 2, section: "weather", optionATips: "q9t1", optionBTips: "q9t2"))
            // MARK: - 10
            list.append(Question(question: "What do you wear for a cold day in play at a park?", questionSound: "q10sound", optionAImage: "q10o1", optionBImage: "q10o2", correctAnswer: 2, section: "weather", optionATips: "q10t1", optionBTips: "q10t2"))
            // MARK: - 11
            list.append(Question(question: "What would you rather wear when going out to play on a cold day?", questionSound: "q11sound", optionAImage: "q11o1", optionBImage: "q11o2", correctAnswer: 1, section: "weather", optionATips: "q11t1", optionBTips: "q11t2"))
            // MARK: - 13
            list.append(Question(question: "What do you prefer drinking during winter before going out to play?", questionSound: "q13sound", optionAImage: "q13o1", optionBImage: "q13o2", correctAnswer: 1, section: "weather", optionATips: "q13t1", optionBTips: "q13t2"))
        } else if type == "safetySigns" {
            // MARK: - 14
            list.append(Question(question: "What would you do when go out with parents?", questionSound: "q14sound", optionAImage: "q14o1", optionBImage: "q14o2", correctAnswer: 1, section: "safetySigns", optionATips: "q14t1", optionBTips: "q14t2"))

            // MARK: - 15
            list.append(Question(question: "Which sign show no running in the playground?", questionSound: "q15sound", optionAImage: "q15o1", optionBImage: "q15o2", correctAnswer: 1, section: "safetySigns", optionATips: "q15t1", optionBTips: "q15t2"))

            // MARK: - 16 done
            list.append(Question(question: "Which sign tells us that the floor is slippery and wet?", questionSound: "q16sound", optionAImage: "q16o1", optionBImage: "q16o2", correctAnswer: 2, section: "safetySigns", optionATips: "q16t1", optionBTips: "q16t2"))
            // MARK: - 17 safety tips done
            list.append(Question(question: "When you see empty bottles on the park road, what would you do?", questionSound: "q17sound", optionAImage: "q17o1", optionBImage: "q17o2", correctAnswer: 2, section: "safetySigns", optionATips: "q17t1", optionBTips: "q17t2"))
        }
    }
}
