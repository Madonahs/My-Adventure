//
//  ViewController.swift
//  Project 4
//
//  Created by Madona Syombua on 2/10/23.
//

import UIKit

class ViewController: UIViewController {
    
   
    @IBOutlet weak var wordDisplay: UILabel!
    
    @IBOutlet weak var buttonOne: UIButton!
    
    @IBOutlet weak var buttonTwo: UIButton!
    
    @IBOutlet weak var image: UIImageView!
    
    var myAdventure = MyAdentureImplementation()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        wordDisplay.text = myAdventure.getPrompt(myAdventure.getCoordinates())
        buttonOne.setTitle(myAdventure.getSpecifiedOption(myAdventure.getCoordinates(), 0), for: .normal)
        buttonTwo.setTitle(myAdventure.getSpecifiedOption(myAdventure.getCoordinates(), 1), for: .normal)
        
    }
    
    @IBAction func sendOption(_ sender: UIButton) {
        let response = sender.titleLabel!.text!
        
        myAdventure.userChoice(myAdventure.getCoordinates(), response)
        
        Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
        
    }
    
    @objc func updateUI() {
            
        wordDisplay.text = myAdventure.getPrompt(myAdventure.getCoordinates())

        let one = myAdventure.getSpecifiedOption(myAdventure.getCoordinates(), 0)
        let two = myAdventure.getSpecifiedOption(myAdventure.getCoordinates(), 1)
        
        buttonOne.setTitle(one, for: .normal)
        buttonTwo.setTitle(two, for: .normal)
        
        image.image = UIImage(named: myAdventure.getBackgroundImage())
    }
}

