//
//  Screen2ViewController.swift
//  HallwayFinder1
//
//  Created by Benjamin Weissman on 9/3/18.
//  Copyright © 2018 Benjamin Weissman. All rights reserved.
//

import UIKit

class Screen2ViewController: UIViewController {

    @IBOutlet weak var start: UITextField!
    @IBOutlet weak var end: UITextField!
    @IBOutlet weak var twoButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        var sroom = ""
        sroom = start.text!
        var eroom = ""
        eroom = end.text!
        let test : Screen3 = segue.destination as! Screen3;
        test.idk = "\(sroom) this is the starting room\n\(eroom) this is the ending room"
        if errorX == true
        {
            test.labelText = "Error"
        }
        else
        {
            test.labelText = "Direction: From \(now) to \(dest)"
        }
        test.idk = finalAnswer
    }
    
    //this is the code from pathfinder in code.org
    
    //variable that might change
    var now = ""
    var hallnow:String!
    var dest = ""
    var halldest:String!
    var temp:String!
    var errorX = false
    var hallsidetext:String!
    var leftorright:String!
    var reverse:String!
    var used = false
    var finalAnswer = "There is an error with your directions. Please try again. \nPossible Errors:\n -App currently only works for rooms with numbers and the cafeteria (not auditorium, gym, research, etc.) \n -Mistyped Room Numbers \n -Typed in a room that doesn't exist\n-Cannot type lobby as a destination"
    //variables that won't change
    let upperLangToMath = "\n-Face the math study center. \n-Move forward to the end of the hallway. \n-Turn Left."
    let mathToUpperLang = "\n-Face the math study center \n-Move forward to the end of the hallway. \n- Turn Right."
    let lowerLangToUpperLang = "\n-Go to the nearest staircase and go up."
    let upperLangToLowerLang = "\n-Go to the nearest staircase and go down."
    let mathToScience = "\n-Go down the nearest staircase."
    let scienceToMath = "\n-Go up the nearest staircase."
    let artToEnglish = "\n-With the guidance office on your left, go down to the end of the hall and turn right."
    let englishToArt = "\n-With the English Study Center to your right, go to the end of the hallway and make a left before the stairs."
    let mathToSS = "\n-Face the skywalk and go all the way through the it. Don't go down any stairs in the middle of the skywalk."
    let ssToMath = "\n-Face the skywalk and go all the way through the it. Don't go down any stairs in the middle of the skywalk."// code could be shorted but don't know how at the time
    let ssToEnglish = "\n-Find the nearest staircase and go down."
    let englishToSS = "\n-Find the nearest staircase and go up."
    let scienceToBusiness = "\n-Face opposite the foreign language center and walk towards the end of the hallway. \n-Make a left."
    let businessToScience = "\n-Face away from the lobby and make a right at the end of the hallway."
    let lowerLangToScience = "\n-Face the foreign language study center and make a left at the end of the hall."
    let scienceToLowerLang = "\n-Face the foreign language study center and make a right at the end of the hall."
    let lowerLangToBusiness = "\n-Go straight through the cafeteria and exit by the library."
    let businessToLowerLang = "\n-Go straight through the cafeteria and exit by the computer lab."
    let businessToArt = "\n-Walk to the lobby and make a right. \n-Go to the end of the hallway and make a left. Then, make a right."
    let artToBusiness = "\n-Face the attendance office and walk to the end of the hallway. Make a left, and the first right. Then make a left in the lobby."
    let businessToEnglish = "\n-Face the lobby, and make the first right (before you reach the lobby). \n-Make a right, and then a left. \n-Walk through the hallway with all the lockers, and make a left at the end."
    let englishToBusiness = "\n-With the english study center on your left, make the first right ahead of you. \n-Walk through the hallway and make a right, then the first left up the baby stairs. \n-Make a left."
    let lowerLangToCafe = "\n-If you are near the language study center, walk towards the end of the hallway to your right (the language hallway) and make a right into the cafeteria. \nIf not, you should see the cafeteria in front of you to the right."
    let businessToCafe = "\n-The cafeteria is on the side of the hallway across from the lockers."
    let artToCafe = "\n-Face the attendance office and walk to the end of the hallway. Make a left, and the first right. Walk straight through the lobby."
    let cafeToArt = "\n-Exit the cafeteria through the exit near the front windows, and take the stairs down into the lobby. \n-Walk through the lobby to the end of the hallway and make a left, then make a right."
    let cafeToLowerLang = "\n-Exit the cafeteria through the exit near the computer lab and the back windows."
    let cafeToBusiness = "\n-Exit the cafeteria through the exit near the library."
    let inCafe = "\n\nYou are in the Cafeteria! Thank you for using PathFinder!"
    let lobbyToCafe = "\n-Go into the cafeteria."
    let lobbyToBusiness = "\n-Go straight up the small staircase directly across from the front door."
    let lobbyToArt = "\n-Facing away from the front door, go to your left towards the windows, and make a left when you reach them.\n-Make a right at the end of the short hall."
    let functionalInputCafe = ["cafe", "Cafe", "Cafeteria", "cafeteria", "lunch room", "Lunch Room", "Lunch room", "Lunchroom", "lunchroom", "caf", "Caf", "lunch"]
    let functionalInputUpperLang = ["234", "235", "236", "237", "238", "239", "240", "241", "242", "243"]
    let functionalInputMath = ["224", "225", "226", "227", "227", "228", "229", "230", "231", "232"]
    let functionalInputSS = ["201","202","203","204","205","206","207","208","209","210","211","212","213","214"]
    let functionalInputEnglish = ["100","101","102","103","104","105","106","107","108","109","110"]
    let functionalInputArt = ["112"," 113", "114", "115"]
    let functionalInputLowerLang = ["133","134","135","136","137","138","139","140","141","142"]
    let functionalInputScience = ["126","127","128","129","130","131","132"]
    let functionalInputBusiness = ["123","121"]
    let functionalInputLobby = ["Lobby", "lobby"]
    let onNorth = ["112", "113", "114", "115", "126", "127", "128", "133", "224", "225", "227", "228", "229"]
    let onWest = ["107", "108", "109", "140"," 141", "142", "121", "123", "210", "211", "213", "214", "241", "242", "243"]
    
    //check function -
    func check(room : String, hallway : Array<String>) -> Bool {
        for hall in hallway
        {
            if room == hall
            {
                return true
            }
        }
        return false
    }
    
    func side() {
        if check(room: dest, hallway: onNorth) {
            leftorright = "left. "
            reverse = "right.) "
        } else if check(room: dest, hallway: onWest) {
            leftorright = "left. "
            reverse = "right.) "
        } else {
            leftorright = "right. "
            reverse = "left.) "
        }
    }
    func assign(nowordest: String) {
        if check(room: nowordest, hallway: functionalInputUpperLang)
        {
            temp = "Upper Lang"
        }
            
        else if check(room: nowordest, hallway: functionalInputMath)
        {
            temp = "Math"
        }
            
        else if check(room: nowordest, hallway: functionalInputSS) {
            temp = "SS"
        }
            
        else if check(room: nowordest, hallway: functionalInputEnglish) {
            temp = "English"
        }
            
        else if check(room: nowordest, hallway: functionalInputArt) {
            temp = "Art"
        }
        else if check(room: nowordest, hallway: functionalInputLowerLang){
            temp = "Lower Lang"
        }
            
        else if check(room: nowordest, hallway: functionalInputScience){
            temp = "Science"
        }
            
        else if check(room: nowordest, hallway: functionalInputBusiness){
            temp = "Business"
        }
        else if check(room: nowordest, hallway: functionalInputCafe){
            temp = "Cafeteria"
        }
        else if check(room:nowordest, hallway:functionalInputLobby) {
            temp = "Lobby"
        }
        else
        {
        errorX = true
        }
    }//assign
    
    @IBAction func findPathButtonClicked(_ sender: UIButton) {
        hallsidetext = ""
        now = start.text!
        dest = end.text!
        temp = ""
        errorX = false
        assign(nowordest: now)
        hallnow = temp
        temp = ""
        assign(nowordest: dest)
        halldest = temp
        if halldest == "Lobby"
        {
            errorX = true
        }
        
        if hallnow == "Cafeteria"
        {
            now = "Cafeteria"
        }
        
        if halldest == "Cafeteria"
        {
            dest = "Cafeteria"
        }
        
        if hallnow == "Lobby"
        {
            now = "Lobby"
        }
        
        side()
        
        
        
        makePath(location1: hallnow, location2: halldest)
        
    }//button clicked
    
    
    
    func makePath(location1: String, location2: String) {
        let endText = "(So facing away from it, the room will be on the " + reverse
        if location2 == "Upper Lang" {
            hallsidetext = "Facing the math study center, your room will be on the " + leftorright + endText
        }
        if location2 == "Math" {
            hallsidetext = "Facing the math study center, your room will be on the " + leftorright + endText
        }
        if location2 == "SS" {
            hallsidetext = "With the social studies study center on your left, your room will be on the " + leftorright + "(So with it on your right, your room will be on the " + reverse
        }
        if location2 == "Lower Lang" {
            hallsidetext = "Facing the foreign language study center, your room will be on the " + leftorright + endText
        }
        if location2 == "Science" {
            hallsidetext = "Facing the foreign language study center, your room will be on the " + leftorright + endText
        }
        if location2 == "Business"  {
            hallsidetext = "Facing the lobby, your room will be on the right. (So facing away from the lobby, your room will be on the left). "
        }
        if location2 == "Art" {
            hallsidetext = "Your room will be across from the guidance office. "
        }
        if location2 == "English" {
            hallsidetext = "With the english study center on your left, your room will be on the " + leftorright + "(So with the study center on your right, the room will be on the " + reverse
        }
        let inHall = "\n\nYou are in your hallway! " + hallsidetext + "\nThanks for using PathFinder!"
        
        if location1 == location2 && !errorX  {
            finalAnswer =  inHall
        }
        if (location1 == "Upper Lang")
        {
            if (location2 == "Math")
            {
                finalAnswer = upperLangToMath + inHall
            }
            if(location2 == "SS") {
                finalAnswer = upperLangToMath + mathToSS + inHall
            }
            if(location2 == "Lower Lang") {
                finalAnswer = upperLangToLowerLang + inHall
            }
            if(location2 == "Science") {
                finalAnswer  = upperLangToMath + mathToScience + inHall
            }
            if(location2 == "Business") {
                finalAnswer = upperLangToMath + mathToScience + scienceToBusiness + inHall
            }
            if(location2 == "Art") {
                finalAnswer =  upperLangToLowerLang + lowerLangToBusiness + businessToArt + inHall
            }
            if(location2 == "English") {
                finalAnswer = upperLangToLowerLang + lowerLangToBusiness + businessToEnglish + inHall
            }
            if(location2 == "Cafeteria") {
                
                finalAnswer =  upperLangToLowerLang + lowerLangToCafe + inCafe
            }
        }
        if(location1 == "Math") {
            if(location2 == "Upper Lang") {
                finalAnswer =  mathToUpperLang + inHall
            }
            if(location2 == "SS") {
                finalAnswer =  mathToSS+inHall
            }
            if(location2 == "Science") {
                finalAnswer = mathToScience+inHall
            }
            if(location2 == "Lower Lang") {
                finalAnswer =  mathToScience+scienceToLowerLang+inHall
            }
            if(location2 == "Business") {
                finalAnswer =  mathToScience+scienceToBusiness+inHall
            }
            if(location2 == "English") {
                finalAnswer =  mathToSS+ssToEnglish+inHall
            }
            if(location2 == "Art") {
                finalAnswer =  mathToScience+scienceToBusiness+businessToArt+inHall
            }
            if(location2 == "Cafeteria") {
                
                finalAnswer =  mathToScience+scienceToBusiness+businessToCafe+inCafe
            }
            
        }
        
        
        if(location1 == "SS") {
            if(location2 == "Upper Lang") {
                finalAnswer =  ssToMath+mathToUpperLang + inHall
            }
            if(location2 == "Math") {
                finalAnswer = ssToMath+inHall
            }
            if(location2 == "Science") {
                finalAnswer =  ssToMath+mathToScience+inHall
            }
            if(location2 == "Lower Lang") {
                finalAnswer =  ssToMath+mathToScience+scienceToLowerLang+inHall
            }
            if(location2 == "Business") {
                finalAnswer =  ssToMath+mathToScience+scienceToBusiness+inHall
            }
            if(location2 == "English") {
                finalAnswer = ssToEnglish+inHall
            }
            if(location2 == "Art") {
                finalAnswer = ssToEnglish+englishToArt+inHall
            }
            if(location2 == "Cafeteria") {
                
                finalAnswer =  ssToMath+mathToScience+scienceToBusiness + businessToCafe+inCafe
            }
            
        }
        
        
        if(location1 == "Science") {
            if(location2 == "Upper Lang") {
                finalAnswer =  scienceToMath+mathToUpperLang + inHall
            }
            if(location2 == "SS") {
                finalAnswer = scienceToMath+mathToSS+inHall
            }
            if(location2 == "Math") {
                finalAnswer = scienceToMath+inHall
            }
            if(location2 == "Lower Lang") {
                finalAnswer =  scienceToLowerLang+inHall
            }
            if(location2 == "Business") {
                finalAnswer =  scienceToBusiness+inHall
            }
            if(location2 == "English") {
                finalAnswer=scienceToBusiness+businessToEnglish+inHall
            }
            if(location2 == "Art") {
                finalAnswer =  scienceToBusiness+businessToArt+inHall
            }
            if(location2 == "Cafeteria") {
                
                finalAnswer = scienceToBusiness+businessToCafe+inCafe
            }
        }
        
        if(location1 == "Lower Lang") {
            if(location2 == "Upper Lang") {
                finalAnswer =  lowerLangToUpperLang + inHall
            }
            if(location2 == "Math") {
                finalAnswer = lowerLangToScience+scienceToMath+inHall
            }
            if(location2 == "Science") {
                finalAnswer = lowerLangToScience+inHall
            }
            if(location2 == "SS") {
                finalAnswer =  lowerLangToScience+scienceToMath+mathToSS+inHall
                //console.log("YES")
            }
            if(location2 == "Business") {
                finalAnswer =  lowerLangToScience+scienceToBusiness+inHall
            }
            if(location2 == "English") {
                finalAnswer = lowerLangToBusiness+businessToEnglish+inHall
            }
            if(location2 == "Art") {
               finalAnswer = lowerLangToBusiness+businessToArt+inHall
            }
            if(location2 == "Cafeteria") {
                
                finalAnswer =  lowerLangToCafe+inCafe
            }
        }
        
        
        if(location1 == "Business") {
            if(location2 == "Upper Lang") {
                finalAnswer =  businessToLowerLang + lowerLangToUpperLang+inHall
            }
            if(location2 == "Math") {
               finalAnswer = businessToScience+scienceToMath+inHall
            }
            if(location2 == "Science") {
                finalAnswer =  businessToScience+inHall
            }
            if(location2 == "Lower Lang") {
                finalAnswer = businessToLowerLang+inHall
            }
            if(location2 == "SS") {
                finalAnswer =  businessToEnglish+englishToSS+inHall
            }
            if(location2 == "English") {
                finalAnswer = businessToEnglish+inHall
            }
            if(location2 == "Art") {
                finalAnswer =  businessToArt+inHall
            }
            if(location2 == "Cafeteria") {
                
                finalAnswer =  businessToCafe + inCafe
            }
        }
        
        if(location1 == "English") {
            if(location2 == "Upper Lang") {
                finalAnswer =  englishToBusiness+businessToLowerLang+lowerLangToUpperLang + inHall
            }
            if(location2 == "Math") {
                finalAnswer =  englishToBusiness+businessToScience+scienceToMath+inHall
            }
            if(location2 == "Science") {
                finalAnswer =  englishToBusiness+businessToScience+inHall
            }
            if(location2 == "Lower Lang") {
                finalAnswer =  englishToBusiness+businessToLowerLang+inHall
            }
            if(location2 == "Business") {
                finalAnswer =  englishToBusiness+inHall
            }
            if(location2 == "SS") {
                finalAnswer =   englishToSS+inHall
            }
            if(location2 == "Art") {
                finalAnswer =   englishToArt+inHall
            }
            if(location2 == "Cafeteria") {
                
                finalAnswer =   englishToArt + artToCafe+inCafe
            }
        }
        
        if(location1 == "Art") {
            if(location2 == "Upper Lang") {
                finalAnswer =   artToBusiness+businessToLowerLang + lowerLangToUpperLang + inHall
            }
            if(location2 == "Math") {
                finalAnswer =   artToBusiness+businessToScience+scienceToMath+inHall
            }
            if(location2 == "Science") {
               finalAnswer =   artToBusiness+businessToScience+inHall
            }
            if(location2 == "Lower Lang") {
                finalAnswer =   artToBusiness+businessToLowerLang+inHall
            }
            if(location2 == "Business") {
                finalAnswer =   artToBusiness+inHall
            }
            if(location2 == "English") {
                finalAnswer =   artToEnglish+inHall
            }
            if(location2 == "SS") {
                finalAnswer =   artToEnglish+englishToSS+inHall
            }
            if(location2 == "Cafeteria") {
                
                finalAnswer =   artToCafe + inCafe
            }
        }
        if(location1 == "Cafeteria") {
            if(location2 == "Art") {
                finalAnswer =   cafeToArt + inHall
            }
            if(location2 == "Upper Lang") {
                finalAnswer =  cafeToLowerLang + lowerLangToUpperLang + inHall
            }
            if(location2 == "Math") {
                finalAnswer =  cafeToBusiness + businessToScience + scienceToMath + inHall
            }
            if(location2 == "Lower Lang") {
                finalAnswer =   cafeToLowerLang + inHall
            }
            if(location2 == "Science") {
                finalAnswer =  cafeToBusiness + businessToScience + inHall
            }
            if(location2 == "Business") {
                finalAnswer =   cafeToBusiness + inHall
            }
            if(location2 == "English") {
                finalAnswer =   cafeToArt + artToEnglish + inHall
            }
            if(location2 == "SS") {
                finalAnswer =   cafeToArt + artToEnglish + englishToSS + inHall
            }
        }
        if(location1 == "Lobby") {
            if(location2 == "Cafeteria") {
                finalAnswer =   lobbyToCafe + inCafe
            }
            if(location2 == "Art") {
                finalAnswer =   lobbyToArt + inHall
            }
            if(location2 ==  "Upper Lang") {
                finalAnswer =   lobbyToCafe + cafeToLowerLang + lowerLangToUpperLang + inHall
            }
            if(location2 == "Math") {
                finalAnswer =   lobbyToBusiness + businessToScience + scienceToMath + inHall
            }
            if(location2 == "Lower Lang") {
                finalAnswer =   lobbyToCafe + cafeToLowerLang + inHall
            }
            if(location2 == "Science") {
                finalAnswer =   lobbyToBusiness + businessToScience + inHall
            }
            if(location2 == "Business") {
                finalAnswer =   lobbyToBusiness + inHall
            }
            if(location2 == "English") {
                finalAnswer =   lobbyToArt + artToEnglish + inHall
            }
            if(location2 == "SS") {
                finalAnswer =  lobbyToArt + artToEnglish + inHall
            }
        }
    }
    
    
}
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */


