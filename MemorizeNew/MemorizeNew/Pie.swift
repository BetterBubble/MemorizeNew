//
//  Pie.swift
//  MemorizeNew
//
//  Created by Александр Шульга on 29.03.2025.
//

import SwiftUI
import CoreGraphics

struct Pie: Shape {
    var startAngle: Angle = Angle.degrees(0)
    let endAngle: Angle = Angle.degrees(360)
    var clockwise = true
    
    func path(in rect: CGRect) -> Path {
        let startAngle = startAngle - .degrees(90)
        let endAngle = endAngle - .degrees(90)
        
        let center = CGPoint(x: rect.midX, y: rect.midY)
        let radius = min(rect.width, rect.height) / 2
        let start = CGPoint(
            x: center.x + radius * cos(startAngle.radians),
            y: center.y + radius * sin(startAngle.radians)
        )
        
        var p =  Path()
        p.move(to: center)
        p.addLine(to: start)
        p.addArc(
            center: center,
            radius: radius,
            startAngle: startAngle,
            endAngle: endAngle,
            clockwise: clockwise
        )
        p.move(to: center)
        
        
        return p
    }
    
    
}
