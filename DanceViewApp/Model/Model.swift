//
//  Model.swift
//  DanceViewApp
//
//  Created by Victor on 13.01.2022.
//
import CoreGraphics

struct Animimation {
    let name: String
    let curve: String
    let duration: CGFloat
    let force: CGFloat
    let delay: CGFloat
    let damping: CGFloat
    let velocity: CGFloat
    
    var description: String {
        """
        name: \(name)
        curve: \(curve)
        duration: \(String(format: "%.1f", Double(duration)))
        force: \(String(format: "%.1f", Double(force)))
        delay: \(String(format: "%.1f", Double(delay)))
        damping: \(String(format: "%.1f", Double(damping)))
        velocity: \(String(format: "%.1f", Double(velocity)))
        
        """
    }
}
