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
        list.append(Question(question: "What is more important to take before going to play park?", optionA: "First Aid Kit", optionB: "Chocolate Bar", optionAImage: "q1o1", optionBImage: "q1o2", correctAnswer: 1, section: "general" , optionATips: "Helps you keep safe, Helps you treat your friends if they have an injury", optionBTips: "Eating chocolate"))
        list.append(Question(question: "I want to go to play park because", optionA: "I want to be active", optionB: "I want to be lazy", optionAImage: "q2o1", optionBImage: "q2o2", correctAnswer: 1, section: "general", optionATips: "Playing keeps you active and smart", optionBTips: "No one wants to be lazy, laziness is unhealthy"))
        list.append(Question(question: "What should I drink more before going to play park?", optionA: "Water", optionB: "Soft Drink", optionAImage: "q3o1", optionBImage: "q3o2", correctAnswer: 1, section: "general", optionATips: "Keeps you hydrated and healthy", optionBTips: "Soft-drinks makes you dehydrated and unhealthy"))
        list.append(Question(question: "Is it okay to go to the park all alone?", optionA: "Yes", optionB: "No", optionAImage: "q4o1", optionBImage: "q4o2", correctAnswer: 2, section: "general", optionATips: "It is dangerous to go alone, Chances are you might get hurt", optionBTips: "It is safe to go with someone older than you, You will be supervised and have less injuries during play time"))
        list.append(Question(question: "What will you eat before going to the park for playing?", optionA: "Fruits and Veggies", optionB: "Chocolate Bar", optionAImage: "q5o1", optionBImage: "q5o2", correctAnswer: 1, section: "general", optionATips: "Fruits and veggies give you a lot of energy to play", optionBTips: "Eating lot of chocolate is bad for health and hurts your stomach"))
        list.append(Question(question: "Which is best for going out on a sunny day?", optionA: "Sun-screen lotion", optionB: "Swim suit", optionAImage: "q6o1", optionBImage: "q6o2", correctAnswer: 1, section: "whether", optionATips: "It protects you from the sun", optionBTips: "It is not used for hot weather and parks"))
        list.append(Question(question: "Which is safe and cool under the hot sun?", optionA: "Swimming Goggles", optionB: "Sun Glasses", optionAImage: "q7o1", optionBImage: "q7o2", correctAnswer: 2, section: "whether", optionATips: "It is used for swimming only", optionBTips: "It is used for protecting your eyes under the sun"))
        list.append(Question(question: "If it is a sunny day for play time, what should I do first?", optionA: "Drink Loads of water and carry a water bottle", optionB: "Eat a heavy meal and fill my tummy", optionAImage: "q3o1", optionBImage: "q8o2", correctAnswer: 1, section: "whether", optionATips: "Keeps you hydrated and active", optionBTips: "Makes you lazy and less active"))
        list.append(Question(question: "What would I like to wear before going out to play on a sunny day?", optionA: "Do not wear anything to protect your head ", optionB: "Wear a broad-brimmed hat", optionAImage: "q9o1", optionBImage: "q9o2", correctAnswer: 2, section: "whether", optionATips: "You might get sunburn because of the sun", optionBTips: "It protects you from the sun rays and keeps you safe at play"))
        list.append(Question(question: "What do you wear for a cold day in play at a park?", optionA: "Cooking apron", optionB: "Winter Jacket", optionAImage: "q10o1", optionBImage: "q10o2", correctAnswer: 2, section: "whether", optionATips: "Not used for outdoor play time", optionBTips: "It is safe to stay warm during winter at play time"))
        list.append(Question(question: "What would you rather wear when going out to play on a cold day?", optionA: "Winter Gloves ", optionB: "Cooking Gloves", optionAImage: "q11o1", optionBImage: "q11o2", correctAnswer: 1, section: "whether", optionATips: "Will keep your hands warm and safe", optionBTips: "Will not help your hands to keep warm and safe"))
        list.append(Question(question: "What do you want to carry with you before going out to play in a park?", optionA: "Warm Scarf made of wool", optionB: "Umbrella", optionAImage: "q12o1", optionBImage: "q12o2", correctAnswer: 1, section: "whether", optionATips: "Keeps you warm and comfortable when you are playing", optionBTips: "No use as there is no sun and rain"))
        list.append(Question(question: "What do you prefer?", optionA: "A bottle of Hot water", optionB: "A cold drink", optionAImage: "q13o1", optionBImage: "q13o2", correctAnswer: 1, section: "whether", optionATips: "Hot water keeps you warm and hydrated during winter play time", optionBTips: "Cold drinks make you unhealthy and gives you running nose"))
        
        list.append(Question(question: "Which of the following signs prohibits wearing roller skates?", optionA: "Sign 1", optionB: "Sign 2", optionAImage: "q14o1", optionBImage: "q14o2", correctAnswer: 1, section: "safetySigns", optionATips: "Hot water keeps you warm and hydrated during winter play time", optionBTips: "Cold drinks make you unhealthy and gives you running nose"))
        list.append(Question(question: "Which of the following signs prohibits beverages?", optionA: "Sign 1", optionB: "Sign 2", optionAImage: "q15o1", optionBImage: "q15o2", correctAnswer: 1, section: "safetySigns", optionATips: "Hot water keeps you warm and hydrated during winter play time", optionBTips: "Cold drinks make you unhealthy and gives you running nose"))
        list.append(Question(question: "Which of the following signs prohibits cycling?", optionA: "Sign 1", optionB: "Sign 2", optionAImage: "q16o1", optionBImage: "q16o2", correctAnswer: 1, section: "safetySigns", optionATips: "Hot water keeps you warm and hydrated during winter play time", optionBTips: "Cold drinks make you unhealthy and gives you running nose"))
        list.append(Question(question: "Which of the following signs prohibits swimming?", optionA: "Sign 1", optionB: "Sign 2", optionAImage: "q17o1", optionBImage: "q17o2", correctAnswer: 1, section: "safetySigns", optionATips: "Hot water keeps you warm and hydrated during winter play time", optionBTips: "Cold drinks make you unhealthy and gives you running nose"))
        list.append(Question(question: "Which of the following signs shows that this area has CCTV monitoring?", optionA: "Sign 1", optionB: "Sign 2", optionAImage: "q17o1", optionBImage: "q17o2", correctAnswer: 1, section: "safetySigns", optionATips: "Hot water keeps you warm and hydrated during winter play time", optionBTips: "Cold drinks make you unhealthy and gives you running nose"))
    }
}
