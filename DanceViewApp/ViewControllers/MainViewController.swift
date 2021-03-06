//
//  ViewController.swift
//  DanceViewApp
//
//  Created by Victor on 11.01.2022.
//
import Spring

class MainViewController: UIViewController {
    // MARK: - @IBOutlets

    @IBOutlet weak var springAnimationView: SpringView!
    
    @IBOutlet weak var nameAnimationLabel: SpringLabel!
    @IBOutlet weak var curveAnimationLabel: SpringLabel!
    @IBOutlet weak var forceAnimationLabel: SpringLabel!
    @IBOutlet weak var durationAnimationLabel: SpringLabel!
    @IBOutlet weak var delayAnimationLabel: SpringLabel!
    @IBOutlet weak var dampingAnimationLabel: SpringLabel!
    @IBOutlet weak var velocityAnimationLabel: SpringLabel!
    
    // MARK: - Private Properties
    private var currentIndexCount = 0
    private let animations = Spring.AnimationPreset.allCases
    private let animationCurves = Spring.AnimationCurve.allCases
    
    private var force: CGFloat = 1
    private var duration: CGFloat = 1
    private var delay: CGFloat = 0
    private var damping: CGFloat = 0.7
    private var velocity: CGFloat = 0.7
    
    private var currentIndex = 0
    
    // MARK: - Override Methods
   
    override func viewDidLoad() {
        super.viewDidLoad()
        setGradient()
    }
    
    // MARK: - @IBActions
    
    @IBAction func springRunAnimation(_ sender: SpringButton) {
        changedAnimationWithRandom(
            for: springAnimationView,
               animation: animations[currentIndex].rawValue)
        sender.setTitle("Run \(animations[getNextIndex(for: animations)].rawValue)", for: .normal)
        currentIndex = animations.indices.contains(currentIndex + 1) == true ? currentIndex + 1 : 0
        sender.titleLabel?.font = UIFont(name: "Avenir Next Condensed", size: 40)
        
        sender.animation = "pop"
        sender.animate()
        
        changeAnimation(for: durationAnimationLabel)
        changeAnimation(for: velocityAnimationLabel)
        
        setValue()
}
    //MARK: - Public Methods
    
    func randomValue(from: CGFloat, to: CGFloat) -> CGFloat {
        let value = CGFloat.random(in: from...to)
        return value
    }
    
    // MARK: - Private Methods
    
    private func changedAnimationWithRandom(for view: SpringView, animation: String) {
        view.animation = animation
        view.curve = animationCurves.randomElement()?.rawValue ?? "easyIn"
        
        force = randomValue(from: 0, to: 1)
        view.force = force
        
        duration = randomValue(from: 0, to: 1)
        view.duration = duration
        
        delay = randomValue(from: 0, to: 0.2)
        view.delay = delay
        
        view.scaleX = randomValue(from: 0, to: 5)
        view.scaleY = randomValue(from: 0, to: 2)
        
        damping = randomValue(from: 0, to: 1)
        view.damping = damping
        
        velocity = randomValue(from: 0, to: 2)
        view.velocity = velocity

        view.animate()
    }
    
    private func getNextIndex(for array: [Spring.AnimationPreset]) -> Int {
        var nextIndex = currentIndex + 1
        nextIndex = array.indices.contains(nextIndex) == true ? currentIndex + 1 : 0
        return nextIndex
    }
    
    private func setValue() {
        nameAnimationLabel.text = "Name: \(springAnimationView.animation)"
        curveAnimationLabel.text = "Curve: \(springAnimationView.curve)"
        durationAnimationLabel.text = String(format: "Duration: %.1f", Double(duration))
        forceAnimationLabel.text = String(format: "Force: %.1f", Double(force))
        delayAnimationLabel.text = String(format: "Delay: %.1f", Double(delay))
        dampingAnimationLabel.text = String(format: "Damping: %.1f", Double(damping))
        velocityAnimationLabel.text = String(format: "Velocity: %.1f", Double(velocity))
    }
    
    private func changeAnimation(for label: SpringLabel) {
        label.animation = animations.randomElement()?.rawValue ?? "pop"
        label.curve = "easyIn"
        label.velocity = randomValue(from: 0, to: 0.5)
        label.force = randomValue(from: 0, to: 1)
        label.damping = randomValue(from: 0, to: 0.6)
        label.animate()
        }
}

extension MainViewController {
        func setGradient() {
        let gradient = CAGradientLayer()
        gradient.frame = view.bounds
        gradient.colors = [
            UIColor.systemBlue.cgColor,
            UIColor.systemGray.cgColor
        ]
            view.layer.insertSublayer(gradient, at: 0)
    }
}


