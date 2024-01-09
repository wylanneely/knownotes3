//
//  GameCenterController.swift
//  KnowNotes3
//
//  Created by Wylan L Neely on 1/3/24.
//

import Foundation
import GameKit


final class GameCenterManager: NSObject, GKGameCenterControllerDelegate, GKLocalPlayerListener {
    
    static let manager = GameCenterManager()
    
    typealias CompletionBlock = (Error?) -> Void
    typealias SuccessHandler = (Bool) -> Void

    override init() {
        super.init()
        authenticateGKLocalPlayer { (success) in
            if success {
                achievementsManager.loadAchievements()
            }
        }
    }
    
    func authenticateGKLocalPlayer(completion: SuccessHandler) {
        GKLocalPlayer.local.authenticateHandler = { gcAuthVC, error in
            if GKLocalPlayer.local.isAuthenticated {
                self.getSetLocalPlayerPhoto()
                NotificationCenter.default.post(name: .authenticationChanged, object: GKLocalPlayer.local.isAuthenticated)
                GKLocalPlayer.local.register(self)
            } else if let vc = gcAuthVC {
                self.viewController?.present(vc, animated: true)
            } else {
                print("Error authentication to GameCenter: " +
                        "\(error?.localizedDescription ?? "none")") }
        }
        completion(true)
    }
    
    
    //MARK: Authentication

    static var isAuthenticated: Bool {
            return GKLocalPlayer.local.isAuthenticated
        }
    enum GameCenterHelperError: Error {
           case matchNotFound
       }
       


    var localPlayerPhoto: UIImage?
    func getSetLocalPlayerPhoto(){
        GKLocalPlayer.local.loadPhoto(for: .normal) { (image, error) in
            if let image = image {
                self.localPlayerPhoto = image }
        } }
    
    

    var viewController: UIViewController?
    var currentMatchmakerVC: GKTurnBasedMatchmakerViewController?
    var currentMatch: GKTurnBasedMatch?
    


    var leaderboardsManager = LeaderboardsManager()
    var achievementsManager = AchievementsManager()
    
    //MARK: View GameCenter dashboards
    var gameCenterDashboardVC = GKGameCenterViewController(state: .default)
    
    func presentGameCenterDashboard(){
        let vc = gameCenterDashboardVC
        gameCenterDashboardVC.gameCenterDelegate = self
        viewController?.present(vc, animated: true, completion: nil)
    }
    
    var gameCenterPlayerProfileVC = GKGameCenterViewController(
        state: .localPlayerProfile)
    
    func presentGameCenterProfile(){
        let vc = gameCenterPlayerProfileVC
        gameCenterPlayerProfileVC.gameCenterDelegate = self
        viewController?.present(vc, animated: true, completion: nil)
    }
    
      
    //MARK: Delegate
    
    func gameCenterViewControllerDidFinish(_ gameCenterViewController: GKGameCenterViewController) {
        gameCenterDashboardVC.dismiss(animated: true, completion: nil)
    }
        

}

extension Notification.Name {
  static let presentGame = Notification.Name(rawValue: "presentGame")
  static let authenticationChanged = Notification.Name(rawValue: "authenticationChanged")
}


class AchievementsManager {
   
   
   var playerAchievements: [GKAchievement]?
   //MARK: Achievements
   let acousticGuitarAchievement = GKAchievement(identifier: AchievementsBundleIDs.unlockAcousticGuitar.rawValue)
   
   var isAcousticGuitarUnlocked: Bool = false
   
   func loadAchievements() {
       GKAchievement.loadAchievements { (achievements, error) in
           if let achievements = achievements {
               self.playerAchievements = achievements
               self.sortCompletedAchievements()
           }
       }
   }
   
  func sortCompletedAchievements(){
       if let pAchievements = playerAchievements {
           for achievement in pAchievements {
               switch achievement.identifier {
               case AchievementsBundleIDs.unlockAcousticGuitar.rawValue :
                   self.isAcousticGuitarUnlocked = achievement.isCompleted
             default:
                   return
               }
           }
       }
  }
   
   

   
   func reportUnlockAcousticGuitarProgress(with score: Int) {
       if score >= 20 {
           acousticGuitarAchievement.percentComplete = 100.00
           reportAchievement(acousticGuitarAchievement)
       } else {
          let completePercent =  Double(score) / 20
           acousticGuitarAchievement.percentComplete = completePercent
           reportAchievement(acousticGuitarAchievement)
       }
   }
   
   
   func reportAchievement(_ achievement: GKAchievement) {
       GKAchievement.report([achievement]) {  error in
           if let error = error {
           print("\(error)") }
       }
   }

}
enum AchievementsBundleIDs: String {
   case unlockAcousticGuitar = "com.wylan.KnowYourNote2020.Achievements.AcousticGuitar"
}



struct LeaderboardsManager {
    
    func submit(score: Int, to leaderboard: LeaderboardBundleIDs){
        GKLeaderboard.submitScore(score, context: 0,
                                  player: GKLocalPlayer.local,
                                  leaderboardIDs: [leaderboard.rawValue]) { (error) in
            if let error = error {
                print(error.localizedDescription) } }
    }
    
    
}

enum LeaderboardBundleIDs: String {
    case regularGrandPiano = "com.wylan.KnowYourNote2020.leaderboards.GPNHS"
    case regularAcousticGuitar = "com.wylan.KnowYourNote2020.leaderboards.AGRHS"
    case advancedGrandPiano = "com.wylan.KnowYourNote2020.leaderboards.GPAHS"
    case advancedAcousticGuitar = "com.wylan.KnowYourNote2020.leaderboards.AGAHS"
}
