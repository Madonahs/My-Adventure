//
//  MyAdventureModel.swift
//  Project 4
//
//  Created by Madona Syombua on 2/10/23.
//

import Foundation

//my model class for the adventure
struct MyAdventureMode{

        init(_ sugt: String, _ one: String, _ two: String, _ my_image: String) {
           suggest = sugt
            option_one = one
            option_two = two
            image = my_image
        }
        
        var suggest : String
        var option_one : String
        var option_two : String
        var image : String
    }
