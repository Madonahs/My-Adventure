//
//  MyAdentureImplementation.swift
//  Project 4
//
//  Created by Madona Syombua on 2/10/23.
//

import Foundation

struct MyAdentureImplementation{
    
    let SIZE_PUZZLE = 3
    var currentCoordinates : String = "0,0" // start from 0
    
    let myAdventureModel = [
        "0,0" : MyAdventureMode(
            "You found the map of The Treasure on Pirate Island",
            "Hire Captain",
            "Hire Pilot",
            "treasure-map"
        ),
        
        "1,0" : MyAdventureMode(
            "Hello you hired a captain",
            "Ahoy",
            "Take Treasure",
            "hire-boat-captain"
        ),
        "2,0" : MyAdventureMode(
            "Hello You hired a Pilot",
            "Welcome onboard",
            "Get Pilot",
            "pilot"
        ),
        "3,0" : MyAdventureMode(
            "You are at the edge of the island ooh ooh let's go back",
            "Restart",
            "Restart",
            "treasure-map"
        ),
        "3,1" : MyAdventureMode(
            "You've found a room filled with gold coins, hooray! Unfortunately, it's all a dream and you wake up in your Tesla sponsored prison cell in Muskburgh, Mars.",
            "Restart",
            "Restart",
            "3-1"
        ),
        "2,1" : MyAdventureMode(
            "You have found a tresure box, what will you do?",
            "Take treasure",
            "Run for your life",
            "treasure"
        ),
        "3,2" : MyAdventureMode(
            "Sadly you can not take it as it is guarded by the pirate",
            "Restart",
            "Restart",
            "pirate"
        ),
        "1,1" : MyAdventureMode(
            "You have been taken by the pilot",
            "Fly Away",
            "Go back",
            "pilot"
        ),
        "2,2" : MyAdventureMode(
            "You've been bamboozlled",
            "Go to island",
            "Run away",
            "pirate"
        ),
        "3,4" : MyAdventureMode(
            "You can still get the treasure",
            "Take",
            "Run",
            "treasure"
        ),
        "3,5" : MyAdventureMode(
            "Sorry that was a trick",
            "Restart",
            "Restart",
            "pirate"
        ),
        "2,3" : MyAdventureMode(
            "Sorry you got played go back to the map and find a new direction",
            "Yes",
            "No",
            "treasure-map"
        ),
        "2,4" : MyAdventureMode(
            "Sorry you got played go back to the map and find a new direction",
            "Yes",
            "No",
            "treasure-map"
        )
    ]
    
    func getCoordinates() -> String {
        return currentCoordinates
    }
    
    func getBackgroundImage() -> String {
        guard let retImageName = myAdventureModel[currentCoordinates]?.image else { return ""}
        return retImageName
    }
    
    mutating func userChoice(_ key: String, _ choice: String) {
        var newCoordinates : String = ""
        let x : Int? = Int(currentCoordinates.components(separatedBy: ",")[0])
        let y : Int? = Int(currentCoordinates.components(separatedBy: ",")[1])
        var newX : Int
        var newY : Int
        
        if choice == myAdventureModel[key]?.option_one {
            newX = x! + 1
            newY = y! * 2
            newCoordinates = String(newX) + "," + String(newY)
        } else {
            newX = x! + 1
            newY = (y! * 2) + 1
            newCoordinates = String(newX) + "," + String(newY)
        }
        
        if newX > SIZE_PUZZLE {
            currentCoordinates = "0,0"
        } else {
            currentCoordinates = newCoordinates
        }
    }
    
    func getPrompt(_ key: String) -> String? {
        guard let adventure = myAdventureModel[key]?.suggest else { return ""}
        return adventure
    }
    
    func getSpecifiedOption(_ key: String, _ option: Int) -> String? {
        guard let retOption = option == 0 ? myAdventureModel[key]?.option_one : myAdventureModel[key]?.option_two else { return "" }
        return retOption
    }
    
    
}
