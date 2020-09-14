//
//  DatabaseProtocol.swift
//  Kids Safe Heaven
//
//  Created by Farhad Ullah Rezwan on 14/9/20.
//  Copyright © 2020 Farhad Ullah Rezwan. All rights reserved.
//

import Foundation

enum DatabaseChange {
    case add
    case remove
    case update
}

enum ListenerType {
    case userScore
    case user
    case all
}

protocol DatabaseListener: AnyObject {
    var listenerType: ListenerType {get set}
    
    func onUserScoreChange(change: DatabaseChange, userScore: [Score])
    func onUserListChange(change: DatabaseChange, users: [User])
}

protocol DatabaseProtocol: AnyObject {

    func cleanup()
    func addScore(score: Double, quizType: String) -> Score
    func addUser(name: String, avatarName: String) -> User
    func addScoreToUser(score: Score, user: User) -> Bool
    func deleteScore(score: Score)
    func deleteUser(user: User)
    func deleteScoreFromUser(score: Score, user: User)
    func addListener(listener: DatabaseListener)
    func removeListener(listener: DatabaseListener)
}
