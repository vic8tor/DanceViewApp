//
//  Model.swift
//  DanceViewApp
//
//  Created by Victor on 13.01.2022.
//
import Spring

struct Animation {
    let name: String
    let curve: String
    let duration: Double
    let force: Double
    let delay: Double
    let damping: Double
    let velocity: Double
    
    var description: String {
        """
        preset: \(name)
        curve: \(curve)
        duration: \(String(format: "%.1f", Double(duration)))
        force: \(String(format: "%.1f", Double(force)))
        delay: \(String(format: "%.1f", Double(delay)))
        damping: \(String(format: "%.1f", Double(damping)))
        velocity: \(String(format: "%.1f", Double(velocity)))
        """
    }
    static func getRandomAnimation() -> Animation {
        Animation(
            name: DataManager.shared.animation.randomElement()?.rawValue ?? "slideLeft",
            curve: DataManager.shared.curves.randomElement()?.rawValue ?? "easyIn",
            duration: Double.random(in: 1...2),
            force: Double.random(in: 0...1),
            delay: 0.3,
            damping: Double.random(in: 0...1),
            velocity: Double.random(in: 0...1)
        )
    }
}


