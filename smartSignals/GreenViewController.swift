//
//  GreenViewController.swift
//  smartSignals
//
//  Created by michelle nonato on 9/4/21.
//

import UIKit

class GreenViewController: UIViewController {

    @IBOutlet var subMainTextLabel: UILabel!
    @IBOutlet var mainTextLabel: UILabel!
    @IBOutlet var bottomTextLabel: UILabel!
    
    @IBOutlet var prevButton: UIImageView!
    @IBOutlet var homeButton: UIImageView!
    @IBOutlet var nextButton: UIImageView!
    @IBOutlet var greenHexaShape: UIImageView!
    @IBOutlet var amberHexaShape: UIImageView!
    @IBOutlet var redHexaShape: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        //Note: Fonts and Colors for Label Texts
        view.backgroundColor = #colorLiteral(red: 0.2097705901, green: 0.6767386198, blue: 0.3332916498, alpha: 1)
        amberHexaShape.tintColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0.25)
        redHexaShape.tintColor = #colorLiteral(red: 0.9019607843, green: 0, blue: 0, alpha: 0.25)
        greenHexaShape.tintColor = #colorLiteral(red: 0.2549019608, green: 0.8509803922, blue: 0.4039215686, alpha: 1)
        mainTextLabel.font = UIFont(name: "Orbitron-ExtraBold", size: 42)
        subMainTextLabel.font = UIFont(name: "Orbitron-Bold", size: 30)
        bottomTextLabel.font = UIFont(name: "Raleway-Black", size: 30)
        
        //Note: When arrow prev button image is tapped
        let tapPrevButton = UITapGestureRecognizer(target: self, action: #selector(self.imagePrevTapped))
        prevButton.addGestureRecognizer(tapPrevButton)
        prevButton.isUserInteractionEnabled = true
        
        //Note: When arrow next button image is tapped
        let tapNextButton = UITapGestureRecognizer(target: self, action: #selector(self.imageNextTapped))
        nextButton.addGestureRecognizer(tapNextButton)
        nextButton.isUserInteractionEnabled = true
        
        //Note: When home button is tapped it goes back to the root controller
        let tapHomeButton = UITapGestureRecognizer(target: self, action: #selector(self.homeButtonTapped))
        homeButton.addGestureRecognizer(tapHomeButton)
        homeButton.isUserInteractionEnabled = true
        
        //Note: For Swiping prev it will go to the prev page which is the home view controller
        let gesturePrevSwipeRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(gesturePrevSwipe(_:)))
        gesturePrevSwipeRecognizer.direction = .right
        gesturePrevSwipeRecognizer.numberOfTouchesRequired = 1
        view.addGestureRecognizer(gesturePrevSwipeRecognizer)
        view.isUserInteractionEnabled = true
        
        //Note: For Swiping next it will go to the next page which is the amber view controller
        let gestureNextSwipeRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(gestureNextSwipe(_:)))
        gestureNextSwipeRecognizer.direction = .left
        gestureNextSwipeRecognizer.numberOfTouchesRequired = 1
        view.addGestureRecognizer(gestureNextSwipeRecognizer)
        view.isUserInteractionEnabled = true
        
        //Note: For tapping amber Light image which will call the enums sharelights to change the colors
        let tapAmberLights = UITapGestureRecognizer(target: self, action: #selector(self.amberTappedLights))
        amberHexaShape.addGestureRecognizer(tapAmberLights)
        amberHexaShape.isUserInteractionEnabled = true
        
        //Note: For tapping green Light image which will call the enums sharelights to change the colors
        let tapGreenLights = UITapGestureRecognizer(target: self, action: #selector(self.greenTappedLights))
        greenHexaShape.addGestureRecognizer(tapGreenLights)
        greenHexaShape.isUserInteractionEnabled = true
               
        //Note: For tapping red Light image which will call the enums sharelights to change the colors
        let tapRedLights = UITapGestureRecognizer(target: self, action: #selector(self.redLightsTapped))
        redHexaShape.addGestureRecognizer(tapRedLights)
        redHexaShape.isUserInteractionEnabled = true
        
    }
    
    //Note: Switch statement for enums TLights
    func shareLights(lights: TLights) {
        switch lights {
        case .Amber:
            amberHexaShape.tintColor = #colorLiteral(red: 0.9490196078, green: 0.6823529412, blue: 0.1882352941, alpha: 1)
            greenHexaShape.tintColor = #colorLiteral(red: 0.3038834035, green: 1, blue: 0.4982047677, alpha: 0.25)
            redHexaShape.tintColor = #colorLiteral(red: 0.9490196078, green: 0.3882352941, blue: 0.3882352941, alpha: 0.25)
        case .Green:
            greenHexaShape.tintColor = #colorLiteral(red: 0.2549019608, green: 0.8509803922, blue: 0.4039215686, alpha: 1)
            redHexaShape.tintColor = #colorLiteral(red: 0.9490196078, green: 0.3882352941, blue: 0.3882352941, alpha: 0.25)
            amberHexaShape.tintColor = #colorLiteral(red: 0.9490196078, green: 0.6823529412, blue: 0.1882352941, alpha: 0.25)
        case .Red:
            redHexaShape.tintColor = #colorLiteral(red: 0.9490196078, green: 0.3882352941, blue: 0.3882352941, alpha: 1)
            amberHexaShape.tintColor = #colorLiteral(red: 0.9490196078, green: 0.6823529412, blue: 0.1882352941, alpha: 0.25)
            greenHexaShape.tintColor = #colorLiteral(red: 0.3038834035, green: 1, blue: 0.4982047677, alpha: 0.25)
        case .None:
            redHexaShape.tintColor = #colorLiteral(red: 0.9490196078, green: 0.3882352941, blue: 0.3882352941, alpha: 1)
            amberHexaShape.tintColor = #colorLiteral(red: 0.9490196078, green: 0.7764705882, blue: 0.2549019608, alpha: 1)
            greenHexaShape.tintColor = #colorLiteral(red: 0.2549019608, green: 0.8509803922, blue: 0.4039215686, alpha: 1)
        }
    }
    
    //Note: Function that will call the switch case statement when red light image button tapped and redirect to the red view controller
    @objc func redLightsTapped(sender: UITapGestureRecognizer) {
        if sender.state == .ended {
            shareLights(lights: .Red)
            redVC()
        }
    }
    
    //Note: Function that will call the switch case statement when red light image button tapped and redirect to the amber view controller
    @objc func amberTappedLights(sender: UITapGestureRecognizer) {
        if sender.state == .ended {
            shareLights(lights: .Amber)
            amberVC()
        }
    }
    
    //Note: Function that will call the switch case statement when red light image button tapped
    @objc func greenTappedLights(sender: UITapGestureRecognizer) {
        if sender.state == .ended {
            shareLights(lights: .Green)
        }
    }
    
    //Note: Tap Function that will call the home view controller where the design and functions
    @objc func imagePrevTapped(_ gesture: UITapGestureRecognizer) {
        homeVC()
    }
    
    //Note: Tap Function that will call the amber view controller where the design and functions 
    @objc func imageNextTapped(_ gesture: UITapGestureRecognizer) {
        amberVC()
    }
    
    //Note: Tap Function that will go back to the root controller
    @objc func homeButtonTapped(_ gesture: UITapGestureRecognizer) {
        self.view.window?.rootViewController?.dismiss(animated: true, completion: nil)
    }
    
    //Note: Swipe Function that will call the home view controller where the design and functions
    @objc func gesturePrevSwipe(_ gesture: UISwipeGestureRecognizer) {
        homeVC()
    }
    
    //Note: Swipe Function that will call the amber view controller where the design and functions
    @objc func gestureNextSwipe(_ gesture: UISwipeGestureRecognizer) {
        amberVC()
    }
    
    //Note: A Function that will call the amber view controller where the design and functions
    func amberVC() {
        guard let amvc = storyboard?.instantiateViewController(identifier: "amber_vc") as? AmberViewController else {
            return
        }
        present(amvc, animated: true)
    }
    
    //Note: A Function that will call the red view Controller where the design and functions
    func redVC() {
        guard let rvc = storyboard?.instantiateViewController(identifier: "red_vc") as? RedViewController else {
            return
        }
        present(rvc, animated: true)
    }
    
    //Note: A Function that will call the home view controller where the design and functions
    func homeVC() {
        guard let hvc = storyboard?.instantiateViewController(identifier: "home_vc") as? HomeViewController else {
            return
        }
        present(hvc, animated: true)
    }


}
