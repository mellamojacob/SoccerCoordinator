//Problem: Soccer teams in the past have been unfairly matched
//Solution: Sort kids into teams based on their experience level and average Height

//Create an array of dictionaries for the players to hold all the necessary data
var players = [
    [
        "name": "Joe Smith",
        "Height": 42,
        "Experience": true,
        "Guardians": "Jim and Jan Smith",
        "Guardian letter" : ""
    ],
    [
        "name": "Jill Tanner",
        "Height": 36,
        "Experience": true,
        "Guardians": "Ciara Tanner",
        "Guardian letter" : ""
    ],
    [
        "name": "Bill Bon",
        "Height": 43,
        "Experience": true,
        "Guardians": "Sara and Jenny Bon",
        "Guardian letter" : ""
    ],
    [
        "name": "Eva Gordon",
        "Height": 45,
        "Experience": false,
        "Guardians": "Wendy and Mike Gordon",
        "Guardian letter" : ""
    ],
    [
        "name": "Matt Gill",
        "Height": 40,
        "Experience": false,
        "Guardians": "Charles and Sylvia Gill",
        "Guardian letter" : ""
    ],
    [
        "name": "Kimmy Stein",
        "Height": 41,
        "Experience": false,
        "Guardians": "Bill and Hillary Stein",
        "Guardian letter" : ""
    ],
    [
        "name": "Sammy Adams",
        "Height": 45,
        "Experience": false,
        "Guardians": "Jeff Adams",
        "Guardian letter" : ""
    ],
    [
        "name": "Karl Saygan",
        "Height": 42,
        "Experience": true,
        "Guardians": "Heather Bledsoe",
        "Guardian letter" : ""
    ],
    [
        "name": "Suzanne Greenberg",
        "Height": 44,
        "Experience": true,
        "Guardians": "Henrietta Dumas",
        "Guardian letter" : ""
    ],
    [
        "name": "Sal Dali",
        "Height": 41,
        "Experience": false,
        "Guardians": "Gala Dali",
        "Guardian letter" : ""
    ],
    [
        "name": "Joe Kavalier",
        "Height": 39,
        "Experience": false,
        "Guardians": "Sam and Elain Kavalier",
        "Guardian letter" : ""
    ],
    [
        "name": "Ben Finkelstein",
        "Height": 44,
        "Experience": false,
        "Guardians": "Aaron and Jill Finkelstein",
        "Guardian letter" : ""
    ],
    [
        "name": "Diego Soto",
        "Height": 41,
        "Experience": true,
        "Guardians": "Robin and Sarika Soto",
        "Guardian letter" : ""
    ],
    [
        "name": "Chloe Alaska",
        "Height": 47,
        "Experience": false,
        "Guardians": "David and Jamie Alaska",
        "Guardian letter" : ""
    ],
    [
        "name": "Arnold Willis",
        "Height": 43,
        "Experience": false,
        "Guardians": "Claire Willis",
        "Guardian letter" : ""
    ],
    [
        "name": "Phillip Helm",
        "Height": 44,
        "Experience": true,
        "Guardians": "Thomas Helm and Eva Jones",
        "Guardian letter" : ""
    ],
    [
        "name": "Les Clay",
        "Height": 42,
        "Experience": true,
        "Guardians": "Wynonna Brown",
        "Guardian letter" : ""
    ],
    [
        "name": "Herschel Krustofski",
        "Height": 45,
        "Experience": true,
        "Guardians": "Hyman and Rachel Krustofski",
        "Guardian letter" : ""
    ]
]

//Create arrays of dictionaries to sort the experienced and unexperienced players seperately

var experiencedPlayers : [Dictionary<String, AnyObject>]
var otherPlayers : [Dictionary<String, AnyObject>]
var playerAvgHeight : Double

for var player in players {
    
    if player["Experienced"] == true {
        experiencedPlayers.append(player)
    } else {
        otherPlayers.append(player)
    }
    
    playerAvgHeight += player["height"]
    
}

playerAvgHeight /= players.count

//Save values of the team practice times
let dragonsPracticeTime = "March 17, at 1 PM"
let sharksPracticeTime = "March 17, at 3 PM"
let raptorsPracticeTime = "March 18, at 1 PM"

//Create arrays of dictionaries to hold the three seperate teams
var teamDragons : [Dictionary<String, AnyObject>]
var teamSharks: [Dictionary<String, AnyObject>]
var teamRaptors: [Dictionary<String, AnyObject>]

//create a base of the average heights for every team
var dragonAvgHeight : Double = playerAvgHeight
var sharkAvgHeight : Double = playerAvgHeight
var raptorAvgHeight : Double = playerAvgHeight

//Player limit is based off of the number of experienced players divided by the number of teams.
let playerLimit = experiencedPlayers.count / 3


//Cycle through every experienced player and sort them into a team
for player in experiencedPlayers {
    //player average height for every team calculated with the current player.
    var newDragonAvgHeight = dragonAvgHeight += player["height"] / teamDragons.count
    var newSharkAvgHeight = sharkAvgHeight += player["height"] / teamSharks.count
    var newRaptorAvgHeight = raptorAvgHeight += player["height"] / teamRaptors.count
    
    //Logic to see if the new average height would be more or less than 1.5 in away from current average height for all the other teams
    if (newDragonAvgHeight >= sharkAvgHeight - 1.5 || newDragonAvgHeight <= sharkAvgHeight + 1.5) && (newDragonAvgHeight >= raptorAvgHeight - 1.5 || newDragonAvgHeight <= raptorAvgHeight + 1.5) && teamDragons.count <= playerLimit {
        teamDragons.append(player)
        dragonAvgHeight += player["height"]
    } else if (newSharkAvgHeight >= raptorAvgHeight - 1.5 || newSharkAvgHeight <= raptorAvgHeight + 1.5) && teamSharks.count <= playerLimit  {
        teamSharks.append(player)
        sharkAvgHeight += player["height"]
    } else {
        teamRaptors.append(player)
        raptorAvgHeight += player["height"]
    }
    
}

//Same logic as before, but using the unexperienced players numbers instead of experienced players
for player in otherPlayers {
    let playerLimit = otherPlayers.count / 3
    var newDragonAvgHeight = dragonAvgHeight += player["height"] / teamDragons.count
    var newSharkAvgHeight = sharkAvgHeight += player["height"] / teamSharks.count
    var newRaptorAvgHeight = raptorAvgHeight += player["height"] / teamRaptors.count
    
    if (newDragonAvgHeight >= sharkAvgHeight - 1.5 || newDragonAvgHeight <= sharkAvgHeight + 1.5) && (newDragonAvgHeight >= raptorAvgHeight - 1.5 || newDragonAvgHeight <= raptorAvgHeight + 1.5) && teamDragons.count < playerLimit {
        teamDragons.append(player)
        dragonAvgHeight += player["height"]
    } else if (newSharkAvgHeight >= raptorAvgHeight - 1.5 || newSharkAvgHeight <= raptorAvgHeight + 1.5) && teamSharks.count < playerLimit  {
        teamSharks.append(player)
        sharkAvgHeight += player["height"]
    } else {
        teamRaptors.append(player)
        raptorAvgHeight += player["height"]
    }
}

dragonAvgHeight /= teamDragons.count
sharkAvgHeight /= teamSharks.count
raptorAvgHeight /= teamRaptors.count
    


//Create the letter to send to every guardian, and save it to the players' "guardian letter" variable in their dictionary.
for var player in teamDragons {
    player["Guardian letter"] = "Dear " + (player["Guardians"])! + ", your child " + (player["name"]) + " has been included into the Dragon team!"
    player["Guardian letter"] += "Our very first practice is on " + dragonsPracticeTime + ". Can't wait to see you then!"
}

for var player in teamSharks {
    player["Guardian letter"] = "Dear " + (player["Guardians"])! + ", your child " + (player["name"]) + " has been included into the Shark team!"
    player["Guardian letter"] += "Our very first practice is on " + sharksPracticeTime + ". Can't wait to see you then!"
}

for var player in teamRaptors {
    player["Guardian letter"] = "Dear " + (player["Guardians"])! + ", your child " + (player["name"]) + " has been included into the Raptors team!"
    player["Guardian letter"] += "Our very first practice is on " + raptorsPracticeTime + ". Can't wait to see you then!"
}










