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
                    // MARK: - 1
                    list.append(Question(question: "What is more important to wear before going to play park?", optionA: " Flip Flops", optionB: " Shoes", optionAImage: "q1o1", optionBImage: "q1o2", correctAnswer: 2, section: "general" , optionATips: "q1t1", optionBTips: "q1t2"))
                    
                    // MARK: - 2
                    list.append(Question(question: "I want to go to play park because", optionA: " To be active", optionB: " I want to be lazy", optionAImage: "q2o1", optionBImage: "q2o2", correctAnswer: 1, section: "general", optionATips: "q2t1", optionBTips: "q2t2"))
                    
                    // MARK: - 3
                    list.append(Question(question: "What should I drink more before going to play park?", optionA: " Water", optionB: " Soft Drink", optionAImage: "q3o1", optionBImage: "q3o2", correctAnswer: 1, section: "general", optionATips: "q3t1", optionBTips: "q3t2"))
                    
                    // MARK: - 4
                    list.append(Question(question: "Is it okay to go to the park all alone?", optionA: " Yes", optionB: " No", optionAImage: "q4o1", optionBImage: "q4o2", correctAnswer: 2, section: "general", optionATips: "q4t1", optionBTips: "q4t2"))
                    
                    // MARK: - 5
                    list.append(Question(question: "What will you eat before going to the park for playing?", optionA: " Fruits and Veggies", optionB: " Chocolate Bar", optionAImage: "q5o1", optionBImage: "q5o2", correctAnswer: 1, section: "general", optionATips: "q5t1", optionBTips: "q5t2"))
                    
                    
                    
        //            // MARK: - 17
        //            list.append(Question(question: "Which sign shows that the ground is slippery?", optionA: "", optionB: "", optionAImage: "q17o1", optionBImage: "q17o2", correctAnswer: 1, section: "safetySigns", optionATips: "", optionBTips: ""))
        //
        //            // MARK: - 18
        //            list.append(Question(question: "Which of the following signs shows that this area has CCTV monitoring?", optionA: " Sign 1", optionB: " Sign 2", optionAImage: "q18o1", optionBImage: "q18o2", correctAnswer: 1, section: "safetySigns", optionATips: "", optionBTips: ""))
                    
                } else if type == "weather" {
                    // MARK: - 6
                    list.append(Question(question: "Which is best for going out on a sunny day?", optionA: "Apply Sun-screen", optionB: "Wear a swim suit", optionAImage: "q6o1", optionBImage: "q6o2", correctAnswer: 1, section: "whether", optionATips: "q6t1", optionBTips: "q6t2"))
                    
                    // MARK: - 7
                    list.append(Question(question: "Which is safe and cool under the hot sun?", optionA: " Swimming Goggles", optionB: " Sun Glasses", optionAImage: "q7o1", optionBImage: "q7o2", correctAnswer: 2, section: "whether", optionATips: "q7t1", optionBTips: "q7t2"))
                    
                    // MARK: - 8
                    list.append(Question(question: "If it is a sunny day for play time, what should I do first?", optionA: " Drink Water", optionB: " Eat Chips", optionAImage: "q3o1", optionBImage: "q8o2", correctAnswer: 1, section: "whether", optionATips: "q8t1", optionBTips: "q8t2"))
                    
                    // MARK: - 9
                    list.append(Question(question: "What would I like to wear before going out to play on a sunny day?", optionA: "Empty head", optionB: " Wear a hat", optionAImage: "q9o1", optionBImage: "q9o2", correctAnswer: 2, section: "whether", optionATips: "q9t1", optionBTips: "q9t2"))
                    
                    // MARK: - 10
                    list.append(Question(question: "What do you wear for a cold day in play at a park?", optionA: " Cooking apron", optionB: " Winter Jacket", optionAImage: "q10o1", optionBImage: "q10o2", correctAnswer: 2, section: "whether", optionATips: "q10t1", optionBTips: "q10t2"))
                    
                    // MARK: - 11
                    list.append(Question(question: "What would you rather wear when going out to play on a cold day?", optionA: " Winter Gloves ", optionB: " Cooking Gloves", optionAImage: "q11o1", optionBImage: "q11o2", correctAnswer: 1, section: "whether", optionATips: "q11t1", optionBTips: "q11t2"))
                    
                    // MARK: - 12
                    list.append(Question(question: "What do you want to carry with you before going out to play in a park?", optionA: " Warm Scarf", optionB: " Umbrella", optionAImage: "q12o1", optionBImage: "q12o2", correctAnswer: 1, section: "whether", optionATips: "q12t1", optionBTips: "q12t2"))
                    
                    // MARK: - 13
                    list.append(Question(question: "What do you prefer during winter?", optionA: " A bottle of Hot water", optionB: " A cold drink", optionAImage: "q13o1", optionBImage: "q13o2", correctAnswer: 1, section: "whether", optionATips: "q13t1", optionBTips: "q13t2"))
                    
                    
                } else if type == "safety" {
                    // MARK: - 14
                    list.append(Question(question: "What would you do when go out with parents?", optionA: " Hold hand with them", optionB: " Walk alone", optionAImage: "q14o1", optionBImage: "q14o2", correctAnswer: 1, section: "safetySigns", optionATips: "q14t1", optionBTips: "q14t2"))
                    
                    // MARK: - 15
//                    list.append(Question(question: "Which sign show no running in the playground?", optionA: " Sign 1", optionB: " Sign 2", optionAImage: "q15o1", optionBImage: "q15o2", correctAnswer: 2, section: "safetySigns", optionATips: "q15t1", optionBTips: "q15t2"))
                    
//                     MARK: - 16
                        list.append(Question(question: "Which sign tells us that the floor is slippery and wet?", optionA: " Sign 1", optionB: " Sign 2", optionAImage: "q16o1", optionBImage: "q16o2", correctAnswer: 2, section: "safetySigns", optionATips: "q16t1", optionBTips: "q16t2"))
                }

    }
}
