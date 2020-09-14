//
//  CoreDataController.swift
//  Kids Safe Heaven
//
//  Created by Farhad Ullah Rezwan on 14/9/20.
//  Copyright © 2020 Farhad Ullah Rezwan. All rights reserved.
//

import UIKit
import CoreData


class CoreDataController: NSObject, NSFetchedResultsControllerDelegate, DatabaseProtocol {
   
    
    
    var DEFAULT_USER_NAME = "Default User"
    var listeners = MulticastDelegate<DatabaseListener>()
    var persistentContainer: NSPersistentContainer
   
    var allScoresOfUserResultsController: NSFetchedResultsController<Score>?
    var allUserFetchResultsController: NSFetchedResultsController<User>?
    
    override init() {
        persistentContainer = NSPersistentContainer(name: "UserDataModel")
        persistentContainer.loadPersistentStores { (description, error) in
            if let error = error {
                fatalError("Failed to load Core data stack: \(error)")
            }
        }
        
        
        super.init()

        if fetchAllUser().count == 0 {
            createDefaultUsers()
        }
    }
    
    func saveContext() {
        if persistentContainer.viewContext.hasChanges {
            do {
                try persistentContainer.viewContext.save()
            } catch {
                fatalError("Failed to save to CoreData: \(error)")
            }
        }
    }
    
    //MARK: - Database Protocol Functions
    
    
    func cleanup() {
        saveContext()
    }
    
    func addScore(score: Double, quizType: String) -> Score {
        let ascore = NSEntityDescription.insertNewObject(forEntityName: "Score", into: persistentContainer.viewContext) as! Score
        
        ascore.score = score
        ascore.quizType = quizType

        return ascore
    }
    
    func addUser(name: String, avatarName: String) -> User {
        let user = NSEntityDescription.insertNewObject(forEntityName: "User", into: persistentContainer.viewContext) as! User
        
        user.name = name
        user.avatarName = avatarName
        
        return user
       }
    
    func addScoreToUser(score: Score, user: User) -> Bool {
        
        // can do validation here
        user.addToScores(score)
        
        return true
    }
    
    func deleteScore(score: Score) {
        persistentContainer.viewContext.delete(score)
    }
    
    func deleteUser(user: User) {
        persistentContainer.viewContext.delete(user)
    }
    
    func deleteScoreFromUser(score: Score, user: User) {
        user.removeFromScores(score)
    }
    
    func addListener(listener: DatabaseListener) {
        listeners.addDelegate(listener)
        
        if listener.listenerType == .userScore || listener.listenerType == .all {
            listener.onUserScoreChange(change: .update, userScore: fetchFromUserScores())
        }
        
        if listener.listenerType == .user || listener.listenerType == .all {
            listener.onUserListChange(change: .update, users: fetchAllUser())
        }
        
    }
    

    
    
    func removeListener(listener: DatabaseListener) {
        saveContext()
        listeners.removeDelegate(listener)
    }
    
    /// Sets default exhibit to be shown in the exhibition detals page.
    /// Helps to get the values of exhibitions table view data
    /// - Parameter name: name of the exhibition
    func setDefaultExhibit(name: String) {
        DEFAULT_USER_NAME = name
    }
    
    func controllerDidChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        
        if controller == allUserFetchResultsController {
            listeners.invoke { (listener) in
                if listener.listenerType == .user || listener.listenerType == .all {
                    listener.onUserListChange(change: .update, users: fetchAllUser())
                }
            }
        } else if controller == allScoresOfUserResultsController {
            listeners.invoke { (listener) in
                if listener.listenerType == .userScore  || listener.listenerType == .all {
                    listener.onUserScoreChange(change: .update, userScore: fetchFromUserScores())
                }
            }
        }
    }
    
    // MARK: - Core data fetch request
    
    func fetchFromUserScores() -> [Score] {
        if allScoresOfUserResultsController == nil {
            let fetchRequest: NSFetchRequest<Score> = Score.fetchRequest()
            
            let nameSortDescriptor = NSSortDescriptor(key: "name", ascending: true)
            let predicate = NSPredicate(format: "ANY user.name == %@", DEFAULT_USER_NAME)
            fetchRequest.sortDescriptors = [nameSortDescriptor]
            fetchRequest.predicate = predicate
            
            allScoresOfUserResultsController = NSFetchedResultsController<Score>(fetchRequest: fetchRequest, managedObjectContext: persistentContainer.viewContext, sectionNameKeyPath: nil, cacheName: nil)
            
            allScoresOfUserResultsController?.delegate = self
            
            do {
                try allScoresOfUserResultsController?.performFetch()
            } catch {
                print("Fetch Requst Failed: \(error)")
            }
        }
        
        var scores = [Score]()
        
        if allScoresOfUserResultsController?.fetchedObjects != nil {
            scores = (allScoresOfUserResultsController?.fetchedObjects)!
        }
        return scores
    }
    
    func fetchAllUser() -> [User] {
        
        if allUserFetchResultsController == nil {
            let fetchRequest: NSFetchRequest<User> = User.fetchRequest()
            
            let nameSortDescriptor = NSSortDescriptor(key: "name", ascending: true)
            fetchRequest.sortDescriptors = [nameSortDescriptor]

            allUserFetchResultsController = NSFetchedResultsController<User>(fetchRequest: fetchRequest, managedObjectContext: persistentContainer.viewContext, sectionNameKeyPath: nil, cacheName: nil)
            
            allUserFetchResultsController?.delegate = self
            
            do {
                try allUserFetchResultsController?.performFetch()
            } catch {
                print("Fetch Requst Failed: \(error)")
            }
        }
        
        var users = [User]()
        
        if allUserFetchResultsController?.fetchedObjects != nil {
            users = (allUserFetchResultsController?.fetchedObjects)!
        }
        return users
    }
    
    func createDefaultUsers() {
        let score1 = addScore(score: 3.7, quizType: "weatherQuiz")
        let score2 = addScore(score: 4.1, quizType: "weatherQuiz")
        let score3 = addScore(score: 5.1, quizType: "weatherQuiz")
//        let score4 = addScore(score: 4.2, quizType: "generalQuiz")
//        let score5 = addScore(score: 6.1, quizType: "generalQuiz")
//        let score6 = addScore(score: 5.2, quizType: "generalQuiz")
//        let score7 = addScore(score: 10.3, quizType: "safetyQuiz")
//        let score8 = addScore(score: 7.3, quizType: "safetyQuiz")
//        let score9 = addScore(score: 9.0, quizType: "safetyQuiz")
//
        var scores: [Score] = []
        scores.append(contentsOf: [score1, score2, score3 ]) //score4, score5, score6, score7, score8, score9
//
        let us1 = addUser(name: "Farhad", avatarName: "q7o2")
//        let us2 = addUser(name: "Kishan", avatarName: "Opener")
//        let us3 = addUser(name: "Zac", avatarName: "q10o1")
//        let us4 = addUser(name: "Kris", avatarName: "opener")
//
//
        let _ = addScoreToUser(score: score1, user: us1)
        let _ = addScoreToUser(score: score2, user: us1)
        let _ = addScoreToUser(score: score3, user: us1)
//
//
//        let _ = addScoreToUser(score: score4, user: us2)
//        let _ = addScoreToUser(score: score5, user: us2)
//        let _ = addScoreToUser(score: score6, user: us2)
//
//        let _ = addScoreToUser(score: score7, user: us3)
//        let _ = addScoreToUser(score: score8, user: us3)
//        let _ = addScoreToUser(score: score9, user: us3)
//
//        let _ = addScoreToUser(score: score1, user: us4)
//        let _ = addScoreToUser(score: score2, user: us4)
//        let _ = addScoreToUser(score: score3, user: us4)
        
        saveContext()
    }

}
