//
//  ViewController.swift
//  SoccerCoordinator
//
//  Created by Gabriel Nadel on 3/29/16.
//  Copyright © 2016 Treehouse. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //Create an array of dictionaries for the players to hold all the necessary data
    var players = [
        [
            "name": "Joe Smith",
            "Height": "42",
            "Experience": "true",
            "Guardians": "Jim and Jan Smith",
            "Guardian letter" : ""
        ],
        [
            "name": "Jill Tanner",
            "Height": "36",
            "Experience": "true",
            "Guardians": "Ciara Tanner",
            "Guardian letter" : ""
        ],
        [
            "name": "Bill Bon",
            "Height": "43",
            "Experience": "true",
            "Guardians": "Sara and Jenny Bon",
            "Guardian letter" : ""
        ],
        [
            "name": "Eva Gordon",
            "Height": "45",
            "Experience": "false",
            "Guardians": "Wendy and Mike Gordon",
            "Guardian letter" : ""
        ],
        [
            "name": "Matt Gill",
            "Height": "40",
            "Experience": "false",
            "Guardians": "Charles and Sylvia Gill",
            "Guardian letter" : ""
        ],
        [
            "name": "Kimmy Stein",
            "Height": "41",
            "Experience": "false",
            "Guardians": "Bill and Hillary Stein",
            "Guardian letter" : ""
        ],
        [
            "name": "Sammy Adams",
            "Height": "45",
            "Experience": "false",
            "Guardians": "Jeff Adams",
            "Guardian letter" : ""
        ],
        [
            "name": "Karl Saygan",
            "Height": "42",
            "Experience": "true",
            "Guardians": "Heather Bledsoe",
            "Guardian letter" : ""
        ],
        [
            "name": "Suzanne Greenberg",
            "Height": "44",
            "Experience": "true",
            "Guardians": "Henrietta Dumas",
            "Guardian letter" : ""
        ],
        [
            "name": "Sal Dali",
            "Height": "41",
            "Experience": "false",
            "Guardians": "Gala Dali",
            "Guardian letter" : ""
        ],
        [
            "name": "Joe Kavalier",
            "Height": "39",
            "Experience": "false",
            "Guardians": "Sam and Elain Kavalier",
            "Guardian letter" : ""
        ],
        [
            "name": "Ben Finkelstein",
            "Height": "44",
            "Experience": "false",
            "Guardians": "Aaron and Jill Finkelstein",
            "Guardian letter" : ""
        ],
        [
            "name": "Diego Soto",
            "Height": "41",
            "Experience": "true",
            "Guardians": "Robin and Sarika Soto",
            "Guardian letter" : ""
        ],
        [
            "name": "Chloe Alaska",
            "Height": "47",
            "Experience": "false",
            "Guardians": "David and Jamie Alaska",
            "Guardian letter" : ""
        ],
        [
            "name": "Arnold Willis",
            "Height": "43",
            "Experience": "false",
            "Guardians": "Claire Willis",
            "Guardian letter" : ""
        ],
        [
            "name": "Phillip Helm",
            "Height": "44",
            "Experience": "true",
            "Guardians": "Thomas Helm and Eva Jones",
            "Guardian letter" : ""
        ],
        [
            "name": "Les Clay",
            "Height": "42",
            "Experience": "true",
            "Guardians": "Wynonna Brown",
            "Guardian letter" : ""
        ],
        [
            "name": "Herschel Krustofski",
            "Height": "45",
            "Experience": "true",
            "Guardians": "Hyman and Rachel Krustofski",
            "Guardian letter" : ""
        ]
    ]

    //Arrays of experienced and non-experienced players
    var experiencedPlayers : [Dictionary<String, String>] = []
    var otherPlayers: [Dictionary<String, String>] = []
    
    //Arrays of each team
    var teamDragons: [Dictionary<String, String>] = []
    var teamSharks: [Dictionary<String, String>] = []
    var teamRaptors: [Dictionary<String, String>] = []
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        createPlayerLists()
        organizePlayers()
        createLetters()
        
    }
    
    //MARK: Helper methods
    
    //Sort players into experienced and non-experienced teams
    func createPlayerLists () {
        for player in players {
            if player["Experience"]! == "true" {
                experiencedPlayers.append(player)
            } else {
                otherPlayers.append(player)
            }
        }
    }
    
    //Cycle through every player and sort them into a team

    func organizePlayers() {
        //Organize Experienced players first
        //set the player count to increment as players are added
        var dragonExpPlayerCount = 0
        var sharkExpPlayerCount = 0
        var playerLimit = experiencedPlayers.count / 3

        
        for player in experiencedPlayers {
            
            //Logic to add only the playerLimit amount of players to each team
            if dragonExpPlayerCount < playerLimit {
                teamDragons.append(player)
                dragonExpPlayerCount += 1
            } else if sharkExpPlayerCount < playerLimit {
                teamSharks.append(player)
                sharkExpPlayerCount += 1
            } else {
                teamRaptors.append(player)
            }
            
        }
        
        //Same logic as before, but using the unexperienced players numbers instead of experienced players
        
        
        var dragonPlayerCount = 0
        var sharkPlayerCount = 0
        playerLimit = otherPlayers.count / 3

        
        for player in otherPlayers {
            
            if dragonPlayerCount < playerLimit {
                teamDragons.append(player)
                dragonPlayerCount += 1
            } else if sharkPlayerCount < playerLimit {
                teamSharks.append(player)
                sharkPlayerCount += 1
            } else {
                teamRaptors.append(player)
            }
            
           
        }
    }
    
    
    func createLetters() {
        
        
        let dragonsPracticeTime = "March 17, at 1 PM"
        let sharksPracticeTime = "March 17, at 3 PM"
        let raptorsPracticeTime = "March 18, at 1 PM"

        
        //Create, save, and print the letter to send to every guardian
        for var player in teamDragons {
            player["Guardian letter"] = "Dear  \(player["Guardians"]!), your child \(player["name"]!) has been included into the Dragon team! Our very first practice is on \(dragonsPracticeTime). Can't wait to see you then!"
            print(player["Guardian letter"]!)
        }
        
        for var player in teamSharks {
            player["Guardian letter"] = "Dear  \(player["Guardians"]!), your child \(player["name"]!) has been included into the Sharks team! Our very first practice is on \(sharksPracticeTime). Can't wait to see you then!"
            print(player["Guardian letter"]!)
        }
        
        for var player in teamRaptors {
            player["Guardian letter"] = "Dear  \(player["Guardians"]!), your child \(player["name"]!) has been included into the Raptors team! Our very first practice is on \(raptorsPracticeTime). Can't wait to see you then!"
            print(player["Guardian letter"]!)
        }
        
    }
    
}

