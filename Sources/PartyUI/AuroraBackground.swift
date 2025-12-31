//
//  AuroraBackground.swift
//  Thanks to https://www.cephalopod.studio/blog/swiftui-aurora-background-animation for much of the code required to achieve this.
//

import SwiftUI
import Combine

// .frame(maxWidth: .infinity, maxHeight: .infinity)
// .ignoresSafeArea()

public struct AuroraBackground: View {
    var color1: String = "90D08E"
    var color2: String = "37C2A7"
    var color3: String = "3ACD95"
    var color4: String = "65D4C6"
    
    init(color1: String = "90D08E", color2: String = "37C2A7", color3: String = "3ACD95", color4: String = "65D4C6") {
        self.color1 = color1
        self.color2 = color2
        self.color3 = color3
        self.color4 = color4
    }
    
    public var body: some View {
        GeometryReader { raysFrameMonitor in
            ZStack {
                ZStack {
                    FloatingRayItem(alignment: .topLeading, monitorData: raysFrameMonitor, color: Color(hex: "90D08E"), beginningRotation: 0, duration: 60)
                    FloatingRayItem(alignment: .topTrailing, monitorData: raysFrameMonitor, color: Color(hex: "37C2A7"), beginningRotation: 240, duration: 65)
                    FloatingRayItem(alignment: .bottomLeading, monitorData: raysFrameMonitor, color: Color(hex: "3ACD95"), beginningRotation: 120, duration: 80)
                    FloatingRayItem(alignment: .bottomTrailing, monitorData: raysFrameMonitor, color: Color(hex: "65D4C6"), beginningRotation: 180, duration: 70)
                }
                .blur(radius: 60)
            }
            .background(Color(hex: "40ABAF"))
            .ignoresSafeArea()
        }
    }
}

public struct FloatingRayItem: View {
    @StateObject var floatingRayData = FloatingRayDataModel()
    var alignment: Alignment
    var monitorData: GeometryProxy
    var color: Color
    var beginningRotation: Double
    var duration: Double
    
    init(floatingRayData: FloatingRayDataModel = FloatingRayDataModel(), alignment: Alignment, monitorData: GeometryProxy, color: Color, beginningRotation: Double, duration: Double) {
        self.alignment = alignment
        self.monitorData = monitorData
        self.color = color
        self.beginningRotation = beginningRotation
        self.duration = duration
    }
    
    public var body: some View {
        Circle()
            .fill(color)
            .frame(height: monitorData.size.height / floatingRayData.raySize)
            .offset(floatingRayData.rayOffset)
            .rotationEffect(.init(degrees: beginningRotation))
            .animation(Animation.linear(duration: duration * 0.5).repeatForever(autoreverses: true))
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: alignment)
            .opacity(0.8)
    }
}

public class FloatingRayDataModel: ObservableObject {
    var rayOffset: CGSize
    var raySize: CGFloat
    
    init() {
        raySize = CGFloat.random(in: 1.0 ..< 1.8)
        rayOffset = CGSize(width: CGFloat.random(in: -150 ..< 150),
                           height: CGFloat.random(in: -150 ..< 500))
    }
}

