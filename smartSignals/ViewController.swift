//
//  ViewController.swift
//  smartSignals
//
//  Created by michelle nonato on 9/3/21.
//

import UIKit

enum TLights {
  case Green, Amber, Red, None
}

class ViewController: UIViewController {

    @IBOutlet var mainTextLabel: UILabel!
    @IBOutlet var subtTextLabel: UILabel!
    @IBOutlet var subLabel: UILabel!
    @IBOutlet var subMainText: UILabel!
    
    @IBOutlet var middleTLights: UIView!
    @IBOutlet var redLights: UIImageView!
    @IBOutlet var yellowLights: UIImageView!
    @IBOutlet var greenLights: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

        //Note: Fonts and Colors for Label Texts
        view.backgroundColor = #colorLiteral(red: 0.2481690943, green: 0.5815317035, blue: 0.6352035999, alpha: 1)
        mainTextLabel.font = UIFont(name: "Orbitron-ExtraBold", size: 90)
        mainTextLabel.textColor = #colorLiteral(red: 0.9490196078, green: 0.7764705882, blue: 0.2549019608, alpha: 1)
        subtTextLabel.font = UIFont(name: "Orbitron-Bold", size: 29)
        subtTextLabel.textColor = #colorLiteral(red: 0.2549019608, green: 0.8509803922, blue: 0.4039215686, alpha: 1)
        subLabel.font = UIFont(name: "Orbitron-Bold", size: 40)
        subLabel.textColor = #colorLiteral(red: 0.2549019608, green: 0.8509803922, blue: 0.4039215686, alpha: 1)
        subMainText.font = UIFont(name: "Raleway-Medium", size: 18)
        subMainText.textColor = #colorLiteral(red: 0.9490196078, green: 0.6823529412, blue: 0.1882352941, alpha: 1)
        
        //Note: For Swiping UP it will go to the next page which is the home view / home view controller
        let gestureSwipeRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(gestureSwipe(_:)))
        gestureSwipeRecognizer.direction = .up
        gestureSwipeRecognizer.numberOfTouchesRequired = 1
        view.addGestureRecognizer(gestureSwipeRecognizer)
        view.isUserInteractionEnabled = true
        
        //Note: For tapping yellow Light image which will call the enums sharelights to change the colors
        let tapYellowLights = UITapGestureRecognizer(target: self, action: #selector(self.yellowTappedLights))
        yellowLights.addGestureRecognizer(tapYellowLights)
        yellowLights.isUserInteractionEnabled = true
        
        //Note: For tapping green Light image which will call the enums sharelights to change the colors
        let tapGreenLights = UITapGestureRecognizer(target: self, action: #selector(self.greenTappedLights))
        greenLights.addGestureRecognizer(tapGreenLights)
        greenLights.isUserInteractionEnabled = true
        
        //Note: For tapping red Light image which will call the enums sharelights to change the colors
        let tapRedLights = UITapGestureRecognizer(target: self, action: #selector(self.redLightsTapped))
        redLights.addGestureRecognizer(tapRedLights)
        redLights.isUserInteractionEnabled = true
        
        //Note: For tapping the background and black container image which will call the enums sharelights to change the colors
        let tapLights = UITapGestureRecognizer(target: self, action: #selector(self.lightsTapped))
        view.addGestureRecognizer(tapLights)
        view.isUserInteractionEnabled = true
    
    }

    //Note: Switch statement for enums TLights
    func shareLights(lights: TLights) {
        switch lights {
        case .Amber:
            yellowLights.tintColor = #colorLiteral(red: 0.9490196078, green: 0.6823529412, blue: 0.1882352941, alpha: 1)
            greenLights.tintColor = #colorLiteral(red: 0.3038834035, green: 1, blue: 0.4982047677, alpha: 0.25)
            redLights.tintColor = #colorLiteral(red: 0.9490196078, green: 0.3882352941, blue: 0.3882352941, alpha: 0.25)
        case .Green:
            greenLights.tintColor = #colorLiteral(red: 0.2549019608, green: 0.8509803922, blue: 0.4039215686, alpha: 1)
            redLights.tintColor = #colorLiteral(red: 0.9490196078, green: 0.3882352941, blue: 0.3882352941, alpha: 0.25)
            yellowLights.tintColor = #colorLiteral(red: 0.9490196078, green: 0.6823529412, blue: 0.1882352941, alpha: 0.25)
        case .Red:
            redLights.tintColor = #colorLiteral(red: 0.9490196078, green: 0.3882352941, blue: 0.3882352941, alpha: 1)
            yellowLights.tintColor = #colorLiteral(red: 0.9490196078, green: 0.6823529412, blue: 0.1882352941, alpha: 0.25)
            greenLights.tintColor = #colorLiteral(red: 0.3038834035, green: 1, blue: 0.4982047677, alpha: 0.25)
        case .None:
            redLights.tintColor = #colorLiteral(red: 0.9490196078, green: 0.3882352941, blue: 0.3882352941, alpha: 1)
            yellowLights.tintColor = #colorLiteral(red: 0.9490196078, green: 0.7764705882, blue: 0.2549019608, alpha: 1)
            greenLights.tintColor = #colorLiteral(red: 0.2549019608, green: 0.8509803922, blue: 0.4039215686, alpha: 1)
        }
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
    
    //Note: Function that will call the switch case statement when background view color tapped
    @objc func lightsTapped(sender: UITapGestureRecognizer) {
        if sender.state == .ended {
            shareLights(lights: .None)
        }
    }
    
    
    //Note: A Function that will call the home view Controller: Calls the home view controller where the design and functions of the second page is
    func homeVC() {
        guard let hvc = storyboard?.instantiateViewController(identifier: "home_vc") as? HomeViewController else {
            return
        }
        present(hvc, animated: true)
    }
    
    //Note: Gesture Function that will call the home view controller where the design and functions of the second page is
    @objc func gestureSwipe(_ gesture: UISwipeGestureRecognizer) {
        homeVC()
    }
    
    //Note: Start Guide Button is tap redirect to the home view Controller : Calls the home view controller where the design and functions of the second page is
    @IBAction func startGuideButton(_ sender: Any) {
        homeVC()
    }

}

