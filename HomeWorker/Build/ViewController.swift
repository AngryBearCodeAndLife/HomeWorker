//
//  ViewController.swift
//  HomeWorker
//
//  Created by Ryan Topham on 12/10/18.
//  Copyright © 2018 Ryan Topham. All rights reserved.
//

import UIKit

class HWViewController: UIViewController {
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }

    var topBar: TopBar!
    var bottomBar: BottomBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.view.backgroundColor = UIColor.white
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        self.setupTopBar()
        self.setupBottomBar()
    }

    //MARK: TopBar
    private func setupTopBar() {
        //This function is used to setup the top bar. Things such as setting the delegate and actions will be done here.
        
        let topHeight = self.view.safeAreaInsets.top
        print(topHeight)
        topBar = TopBar(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: 60 + topHeight), with: [])
        self.view.addSubview(topBar)
        
    }
    
    //MARK: BottomBar

    private func setupBottomBar() {
        //This will do the work for the bottom bar. This controls the navigation.
        
        let bottomHeight = self.view.safeAreaInsets.bottom
        bottomBar = BottomBar(frame: CGRect(x: 0, y: self.view.frame.height - (bottomHeight + 60), width: self.view.frame.width, height: 60 + bottomHeight), for: self)
        self.view.addSubview(bottomBar)
        
    }
    
}

class BottomBar: UIView {
    
    //MARK: Overall
    var homeButton: BottomIcon!
    var calcButton: BottomIcon!
    var calndrButton: BottomIcon!
    var gearButton: BottomIcon!
    
    var controller: UIViewController!
    
    //MARK: Initialization
    
    init(frame: CGRect, for newController: UIViewController) {
        super.init(frame: frame)
        
        self.controller = newController
        
        self.backgroundColor = UIColor.retrieveMainColor()
        self.makeButtons()
        
    }
    
    private func makeButtons() {
        
        //Home Button
        homeButton = BottomIcon(frame: CGRect(x: 5, y: 5, width: 50, height: 50))
        self.addSubview(homeButton)
        
        //This is the amount of space between the icons. Still going to need to add in the area between the other icons from 0
        let middleSpace = (self.frame.width - 210) / 3
        
        calcButton = BottomIcon(frame: CGRect(x: (55 + middleSpace), y: 5, width: 50, height: 50), isMain: false)
        self.addSubview(calcButton)
        
        calndrButton = BottomIcon(frame: CGRect(x: (105 + (middleSpace * 2)), y: 5, width: 50, height: 50), isMain: false)
        self.addSubview(calndrButton)
        
        gearButton = BottomIcon(frame: CGRect(x: self.frame.width - 55, y: 5, width: 50, height: 50), isMain: false)
        self.addSubview(gearButton)
        
    }
    
    //MARK: Required
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

class BottomIcon: UIButton {
    
    //MARK: Overall
    
    var destinationHWV: HWViewController!
    
    var isOn: Bool = false
    
    init(frame: CGRect, isMain on: Bool = true) {
        super.init(frame: frame)
        
        self.destinationHWV = WorkView()
        self.isOn = on
        if self.isOn {
            self.select(withAnimation: false)
        } else {
            self.unselect(withAnimation: false)
        }
        
        self.layer.cornerRadius = 25
        self.layer.masksToBounds = true
        
    }
    
    func select(withAnimation animate: Bool = true) {
        //TODO: Add animation of icon
        if animate {
            UIView.animate(withDuration: 0.5) {
                self.backgroundColor = .white
            }
        } else {
            self.backgroundColor = .white
        }
    
    }
    
    func unselect(withAnimation animate: Bool = true) {
        
        if animate {
            UIView.animate(withDuration: 0.5) {
                self.backgroundColor = UIColor.white.withAlphaComponent(0.2)
//                self.backgroundColor = UIColor.retrieveMainColor()
            }
        } else {
            self.backgroundColor = UIColor.white.withAlphaComponent(0.2)
//            self.backgroundColor = UIColor.retrieveMainColor()
        }
        
    }
    
    //MARK: Required
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
