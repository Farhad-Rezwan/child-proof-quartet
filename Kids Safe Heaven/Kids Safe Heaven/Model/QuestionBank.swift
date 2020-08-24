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
        list.append(Question(questionImage: "flag1", question: "This British overseas territory is a popular tax haven.", optionA: "A. Haiti", optionB: "B. Suriname", optionC: "C. Puerto Rico", optionD: "D. Anguilla", answer: 4))
        
        list.append(Question(questionImage: "flag2", question: "The highest point on this island, Mount Obama was renamed in 2009 in honor of the president.", optionA: "A. Dominica", optionB: "B. Bahamas", optionC: "C. Antigua and Barbuda", optionD: "British Virgin Islands", answer: 3))
        
        list.append(Question(questionImage: "flag3", question: "This country produces its water from a desalination plant and the electricity on the island is a by-product of the desalination process.", optionA: "A. Cuba", optionB: "B. Aruba", optionC: "C. Gaudeloupe", optionD: "D. Cayman Islands", answer: 2))
        
        list.append(Question(questionImage: "flag4", question: "This country has a magnificent underwater cave system.", optionA: "A. The Bahamas", optionB: "B. Venezuela", optionC: "C. Matinique", optionD: "D. Dominican Republic", answer: 1))
        
        list.append(Question(questionImage: "flag5" , question: "This is the island of Cou-Cou and Flying Fish. The popular R&B singer Rihanna is from here.", optionA: "A. Trinidad and Tobago" , optionB: "B. Saint Kitts and Nevis" , optionC: "C. Grenada" , optionD: "D. Barbados", answer: 4))
        
        list.append(Question(questionImage: "flag15" , question: "Rum is the national drink of this country. The fastest man in the world Usain Bolt is from here.", optionA: "A. Jamaica" , optionB: "B. Saint Vincent and the Grenadines" , optionC: "C. St. Lucia" , optionD: "D. Guyana", answer: 1))
    }
}
