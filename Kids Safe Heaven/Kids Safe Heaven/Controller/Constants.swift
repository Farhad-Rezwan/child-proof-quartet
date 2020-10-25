//
//  Constants.swift
//  Kids Safe Heaven
//
//  Created by Farhad Ullah Rezwan on 21/10/20.
//  Copyright © 2020 Farhad Ullah Rezwan. All rights reserved.
//

struct Constants {
    static var appName = "Kids Safe Heaven"
    
    struct Segue {
        static var homeToSearchPark = "homeToSearchParkCV"
        static var homeToGame = "homeToMainJourneyVC"
        static var journeyToThingsToCarry = "mainJourneyToThingsToCarrySegue"
        static var journeyToQuiz = "mainJourneyToQuizSegue"
        static var journeyToSpotTheD = "mainJourneyToSpotTheDSegue"
    }
    
    struct Design {
        static var navigationBack = "navigationBack"
        static var navigationBackTitle = ""
        static var spotTheDangerCorrectIcon = "spotTheDCorrectChoosen"
        static var navigationIconMenu = "navbarMenu"
        static var navigationLogoutIcon = "logoutMenu"
    }
    
    struct Mascot {
        static var saveMascotZac = "zac"
        static var saveMascotKris = "kris"
        static var saveMascotRez = "rez"
        static var saveMascotMia = "mia"
        static var saveMascotEmma = "emma"
    }
    
    struct Sound {
        static var homeScreenWelcomeMessage = "introductionAvatarMessage"
        static var welcomeQuizWelcomeMessage = "selectOneQuizCatagory"
        static var scoreBooardVCMessage = "scoreBoardViewMessage"
        static var searchLocationWelcomeMessage = "searchParkCVC"
        static var singleParkWelcomeMessage = "singleParkWelcomeMessage"
        static var safetyTipsWelcomeMessage = "welcomeToSafetyTips"
        static var mainJourneyWelcomeMessage = "mainJourneyIntroductionSound"
        static var hintButtonSound = "hintButtonPressed"
    }
    
    struct Identifier {
        static var eachParkCell = "eachParkCell"
        static var eachEquipmentCell = "eachEquipmentCell"
        static var thingsToCarryCollVC = "thingsToCarryItems"
        static var youtubeInstructionVC = "youtubeVideoViewController"
        static var safetyTipsVC = "safetyTipsViewController"
        static var itemFoundCollVC = "itemFoundCell"
        static var menuViewController = "menuViewController"
        static var journeyScooreBoardVC = "journeyScoreboradVC"

    }
    
    struct JourneyQuizLocked {
        static var quizTime = "quizTimeButton"
        static var thingsToCarry = "thingsToCarryButton"
        static var thingsToCarryLocked = "thingsToCarryButtonLocked"
        static var knowTheDangerLocied = "knowTheDangerButtonLocked"
        static var knowTheDanger = "knowTheDangerButton"
    }
    
    
}
