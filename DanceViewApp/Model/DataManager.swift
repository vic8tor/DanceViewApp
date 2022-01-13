//
//  DataManager.swift
//  DanceViewApp
//
//  Created by Victor on 13.01.2022.
//

import Spring

class DataManager {
    
    static let shared = DataManager()
    
    let animation: [Spring.AnimationPreset] = [
        .slideLeft,
        .slideRight,
        .slideDown,
        .slideUp,
        .squeezeLeft,
        .squeezeRight,
        .squeezeDown,
        .squeezeUp,
        .fadeIn,
        .fadeOut,
        .fadeOutIn,
        .fadeInLeft,
        .fadeInRight,
        .fadeInDown,
        .fadeInUp,
        .zoomIn,
        .zoomOut,
        .fall,
        .shake,
        .pop,
        .flipX,
        .flipY,
        .morph,
        .squeeze,
        .flash,
        .wobble,
        .swing
    ]
    
    let curves = Spring.AnimationCurve.allCases
    
    private init() {
    }
}
