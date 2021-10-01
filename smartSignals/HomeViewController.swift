//
//  HomeViewController.swift
//  smartSignals
//
//  Created by michelle nonato on 9/4/21.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet var homeSubtTextLabel: UILabel!
    @IBOutlet var homeTextLabel: UILabel!
    @IBOutlet var stopLabel: UILabel!
    @IBOutlet var warningLabel: UILabel!
    @IBOutlet var goLabel: UILabel!
    
    @IBOutlet var redHexaShape: UIImageView!
    @IBOutlet var greenHexaShape: UIImageView!
    @IBOutlet var yellowHexaShape: UIImageView!
    @IBOutlet var nextButton: UIImageView!
    @IBOutlet var homeButton: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //Note: Fonts and Colors for Label Texts
        view.backgroundColor =  #colorLiteral(red: 0.2481690943, green: 0.5815317035, blue: 0.6352035999, alpha: 1)
        homeTextLabel.font = UIFont(name: "Orbitron-ExtraBold", size: 42)
        homeTextLabel.textColor = #colorLiteral(red: 0.2549019608, green: 0.8509803922, blue: 0.4039215686, alpha: 1)
        homeSubtTextLabel.font = UIFont(name: "Orbitron-Bold", size: 18)
        homeSubtTextLabel.textColor = #colorLiteral(red: 0.2549019608, green: 0.8509803922, blue: 0.4039215686, alpha: 1)
        
        //Note: Stop Label custom fonts and color, will be shown only when red hexagon is tapped
        stopLabel.font = UIFont(name: "Orbitron-ExtraBold", size: 40)
        stopLabel.textColor = #colorLiteral(red: 0.9490196078, green: 0.3882352941, blue: 0.3882352941, alpha: 1)
        stopLabel.isHidden = true
        
        //Note: warning Label custom fonts and color, will be shown only when red hexagon is tapped
        warningLabel.font = UIFont(name: "Orbitron-ExtraBold", size: 40)
        warningLabel.textColor = #colorLiteral(red: 0.9490196078, green: 0.6823529412, blue: 0.1882352941, alpha: 1)
        warningLabel.isHidden = true
        
        //Note: go Label custom fonts and color, will be shown only when red hexagon is tapped
        goLabel.font = UIFont(name: "Orbitron-ExtraBold", size: 40)
        goLabel.textColor = #colorLiteral(red: 0.2549019608, green: 0.8509803922, blue: 0.4039215686, alpha: 1)
        goLabel.isHidden = true
        
        //Note: For Swiping it will go to the next page which is the red view controller
        let gestureNextSwipeRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(gestureNextSwipe(_:)))
        gestureNextSwipeRecognizer.direction = .left
        gestureNextSwipeRecognizer.numberOfTouchesRequired = 1
        view.addGestureRecognizer(gestureNextSwipeRecognizer)
        view.isUserInteractionEnabled = true
        
        //Note: When arrow next button image is tapped
        let tapNextButton = UITapGestureRecognizer(target: self, action: #selector(self.imageNextTapped))
        nextButton.addGestureRecognizer(tapNextButton)
        nextButton.isUserInteractionEnabled = true
        
        //Note: When home button is tapped it goes back to the root controller
        let tapHomeButton = UITapGestureRecognizer(target: self, action: #selector(self.homeButtonTapped))
        homeButton.addGestureRecognizer(tapHomeButton)
        homeButton.isUserInteractionEnabled = true
        
        //Note: For tapping yellow Light image which will call the enums sharelights to change the colors
        let tapYellowLights = UITapGestureRecognizer(target: self, action: #selector(self.yellowTappedLights))
        yellowHexaShape.addGestureRecognizer(tapYellowLights)
        yellowHexaShape.isUserInteractionEnabled = true
        
        //Note: For tapping green Light image which will call the enums sharelights to change the colors
        let tapGreenLights = UITapGestureRecognizer(target: self, action: #selector(self.greenTappedLights))
        greenHexaShape.addGestureRecognizer(tapGreenLights)
        greenHexaShape.isUserInteractionEnabled = true
        
        //Note: For tapping red Light image which will call the enums sharelights to change the colors
        let tapRedLights = UITapGestureRecognizer(target: self, action: #selector(self.redLightsTapped))
        redHexaShape.addGestureRecognizer(tapRedLights)
        redHexaShape.isUserInteractionEnabled = true
        
        //Note: For Red Hexagon when double tapped or click
        let gestureRecognizerRed = UITapGestureRecognizer(target: self, action: #selector(gestureFiredRed(_:)))
        gestureRecognizerRed.numberOfTapsRequired = 2
        gestureRecognizerRed.numberOfTouchesRequired = 1
        redHexaShape.addGestureRecognizer(gestureRecognizerRed)
        redHexaShape.isUserInteractionEnabled = true
        
        //Note: For Yellow Hexagon when double tapped or click
        let gestureRecognizerYellow = UITapGestureRecognizer(target: self, action: #selector(gestureFiredYellow(_:)))
        gestureRecognizerYellow.numberOfTapsRequired = 2
        gestureRecognizerYellow.numberOfTouchesRequired = 1
        yellowHexaShape.addGestureRecognizer(gestureRecognizerYellow)
        yellowHexaShape.isUserInteractionEnabled = true
        
        //Note: For Green Hexagon when double tapped or click
        let gestureRecognizerGreen = UITapGestureRecognizer(target: self, action: #selector(gestureFiredGreen(_:)))
        gestureRecognizerGreen.numberOfTapsRequired = 2
        gestureRecognizerGreen.numberOfTouchesRequired = 1
        greenHexaShape.addGestureRecognizer(gestureRecognizerGreen)
        greenHexaShape.isUserInteractionEnabled = true
        
    }
    
    //Note: Switch statement for enums TLights
    func shareLights(lights: TLights) {
        switch lights {
        case .Amber:
            yellowHexaShape.tintColor = #colorLiteral(red: 0.9490196078, green: 0.6823529412, blue: 0.1882352941, alpha: 1)
            greenHexaShape.tintColor = #colorLiteral(red: 0.3038834035, green: 1, blue: 0.4982047677, alpha: 0.25)
            redHexaShape.tintColor = #colorLiteral(red: 0.9490196078, green: 0.3882352941, blue: 0.3882352941, alpha: 0.25)
            warningLabel.isHidden = false
            stopLabel.isHidden = true
            goLabel.isHidden = true
        case .Green:
            greenHexaShape.tintColor = #colorLiteral(red: 0.2549019608, green: 0.8509803922, blue: 0.4039215686, alpha: 1)
            redHexaShape.tintColor = #colorLiteral(red: 0.9490196078, green: 0.3882352941, blue: 0.3882352941, alpha: 0.25)
            yellowHexaShape.tintColor = #colorLiteral(red: 0.9490196078, green: 0.6823529412, blue: 0.1882352941, alpha: 0.25)
            stopLabel.isHidden = true
            warningLabel.isHidden = true
            goLabel.isHidden = false
        case .Red:
            redHexaShape.tintColor = #colorLiteral(red: 0.9490196078, green: 0.3882352941, blue: 0.3882352941, alpha: 1)
            yellowHexaShape.tintColor = #colorLiteral(red: 0.9490196078, green: 0.6823529412, blue: 0.1882352941, alpha: 0.25)
            greenHexaShape.tintColor = #colorLiteral(red: 0.3038834035, green: 1, blue: 0.4982047677, alpha: 0.25)
            stopLabel.isHidden = false
            warningLabel.isHidden = true
            goLabel.isHidden = true
        case .None:
            redHexaShape.tintColor = #colorLiteral(red: 0.9490196078, green: 0.3882352941, blue: 0.3882352941, alpha: 1)
            yellowHexaShape.tintColor = #colorLiteral(red: 0.9490196078, green: 0.7764705882, blue: 0.2549019608, alpha: 1)
            greenHexaShape.tintColor = #colorLiteral(red: 0.2549019608, green: 0.8509803922, blue: 0.4039215686, alpha: 1)
        }
    }
    
    //Note: Tap Function that will go back to the root controller
    @objc func homeButtonTapped(_ gesture: UITapGestureRecognizer) {
        self.view.window?.rootViewController?.dismiss(animated: true, completion: nil)
    }
    
    //Note: red Hexagon shape double tapped it will lead to red view controller
    @objc func gestureFiredRed(_ gesture: UITapGestureRecognizer) {
       redVC()
    }
    
    //Note: yellow Hexagon shape double tapped it will lead to red view controller
    @objc func gestureFiredYellow(_ gesture: UITapGestureRecognizer) {
        amberVC()
    }
    
    //Note: green Hexagon shape double tapped it will lead to red view controller
    @objc func gestureFiredGreen(_ gesture: UITapGestureRecognizer) {
        greenVC()
    }
    
    //Note: Function that will call the switch case statement when red light image button tapped
    @objc func redLightsTapped(sender: UITapGestureRecognizer) {
        if sender.state == .ended {
            shareLights(lights: .Red)
        }
    }
    
    //Note: Function that will call the switch case statement when yellow light image button tapped
    @objc func yellowTappedLights(sender: UITapGestureRecognizer) {
        if sender.state == .ended {
            shareLights(lights: .Amber)
        }
    }
    
    //Note: Function that will call the switch case statement when green light image button tapped
    @objc func greenTappedLights(sender: UITapGestureRecognizer) {
        if sender.state == .ended {
            shareLights(lights: .Green)
        }
    }
    
    //Note: A Function that will call the red view Controller where the design and functions
    func redVC() {
        guard let rvc = storyboard?.instantiateViewController(identifier: "red_vc") as? RedViewController else {
            return
        }
        present(rvc, animated: true)
    }
    
    //Note: A Function that will call the amber view Controller where the design and functions
    func amberVC() {
        guard let ambvc = storyboard?.instantiateViewController(identifier: "amber_vc") as? AmberViewController else {
            return
        }
        present(ambvc, animated: true)
    }
    
    //Note: A Function that will call the amber view Controller where the design and functions
    func greenVC() {
        guard let greenvc = storyboard?.instantiateViewController(identifier: "green_vc") as? GreenViewController else {
            return
        }
        present(greenvc, animated: true)
    }
    
    //Note: Swipe Function that will call the red view controller where the design and functions
    @objc func gestureNextSwipe(_ gesture: UISwipeGestureRecognizer) {
        greenVC()
    }
    
    //Note: Next Button tapped redirect to next page and go to view Controller
    @objc func imageNextTapped(sender: UITapGestureRecognizer) {
        greenVC()
    }

}
