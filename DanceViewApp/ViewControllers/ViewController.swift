//
//  ViewController.swift
//  DanceViewApp
//
//  Created by Victor on 11.01.2022.
//
import Spring
import CoreGraphics
import UIKit

class ViewController: UIViewController {
    // MARK: - @IBOutlets

    @IBOutlet weak var springAnimationView: SpringView!
    @IBOutlet weak var nameAnimationLabel: UILabel!
    @IBOutlet weak var curveAnimationLabel: UILabel!
    @IBOutlet weak var forceAnimationLabel: UILabel!
    @IBOutlet weak var durationAnimationLabel: UILabel!
    @IBOutlet weak var delayAnimationLabel: UILabel!
    
    // MARK: - Public Properties
    
    // MARK: - Private Properties
    private var currentIndexCount = 0
    private let animations = Spring.AnimationPreset.allCases
    private let animationCurves = Spring.AnimationCurve.allCases
    
    private var force: CGFloat = 1
    private var duration: CGFloat = 1
    private var delay: CGFloat = 0
    private var damping: CGFloat = 0.7
    private var velocity: CGFloat = 0.7
    private var scaleX: CGFloat = 1
    private var scaleY: CGFloat = 0
    
    private var currentIndex = 0
    // MARK: - Override Methods
   
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    // MARK: - @IBActions
    
    @IBAction func springRunAnimation(_ sender: SpringButton) {
        changedAnimationWithRandom(
            for: springAnimationView,
               animation: animations[currentIndex].rawValue)
        sender.setTitle(animations[getNextIndex(for: animations)].rawValue, for: .normal)
        currentIndex = animations.indices.contains(currentIndex + 1) == true ? currentIndex + 1 : 0
        
        setValue()

}
        
    // MARK: - Private Methods

    private func changedAnimationWithRandom(for view: SpringView, animation: String) {
        view.animation = animation
        view.curve = animationCurves.randomElement()?.rawValue ?? "easyIn"

        duration = randomValue()
        view.duration = duration
        
        view.scaleX = randomValue()
        view.scaleY = randomValue()
        view.damping = randomValue()
        view.velocity = randomValue()

        view.animate()
    }
    
    func randomValue() -> CGFloat {
        let value = CGFloat.random(in: 0...2)
        return value
    }
    
    private func getNextIndex(for array: [Spring.AnimationPreset]) -> Int {
        var nextIndex = currentIndex + 1
        nextIndex = array.indices.contains(nextIndex) == true ? currentIndex + 1 : 0
        return nextIndex
    }
    
    private func setValue() {
        durationAnimationLabel.text = String(format: "Duration: %.1f", Double(duration))
        forceAnimationLabel.text = String(format: "Force: %.1f", Double(springAnimationView.force))
    }

    
}
    


