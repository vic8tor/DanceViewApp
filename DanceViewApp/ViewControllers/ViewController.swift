//
//  ViewController.swift
//  DanceViewApp
//
//  Created by Victor on 11.01.2022.
//
import Spring

class ViewController: UIViewController {

    @IBOutlet weak var springAnimationView: SpringView!
    @IBOutlet weak var nameAnimationLabel: UILabel!
    @IBOutlet weak var curveAnimationLabel: UILabel!
    @IBOutlet weak var forceAnimationLabel: UILabel!
    @IBOutlet weak var durationAnimationLabel: UILabel!
    @IBOutlet weak var delayAnimationLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func springRunAnimation(_ sender: SpringButton) {
    }
    
}

