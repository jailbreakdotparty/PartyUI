//
//  PrimaryButtonStyle.swift
//  PartyUI
//
//  Created by lunginspector on 3/3/26.
//
//  probably would help to explain why i'm using PrimitiveButtonStyle in the first place. we all love List and ScrollView, right? however, these view options have one major issue: animations tend to be kinda busted with them. if i wanted to create a custom animation that scales the button by a bit and fades then springs back to normal apperance, i would usually use a regular ButtonStyle and the property "configuration.isPressed." this property works great for VStacks and other plain views, but is super bugged with List and ScrollView specifically (which is not optimal).
//  what exactly is the bug? on normal taps, the button animates as you'd expect on plain views. but with List and ScrollView, it just doesn't. if you press really hard on the button or hold it, then the animation will actually appear.
//  how do i combat this bullshit swift "behavior"? i used a PrimitiveButtonStyle, and threw the animation code into a seperate modifier. the animation code has it's own gesture, and the gesture flips a boolean called "shouldAnimate" to true as soon as it taps. when it detects that the button is no longer being touched, then it delays changing the state for 0.1s and then flips it back to false. withAnimation is used to make sure the animation isn't choppy. this is neccessary because the behavior of List and ScrollView causes the true/false state to flip too quickly for the animation to even play in the first place with a normal tap (this is the issue that configuration.isPressed had). this is why even defualt button animations are lost with the usage of List or ScrollView. such stupid behavior!
//  oh also, i used a sepearte gesture for the buttons because i want the trigger to behave similarly to a normal ButtonStyle (where you can hold the button, the animation plays, but then you let go and the actual button actions never run).

import SwiftUI

public struct PrimaryButtonStyle: PrimitiveButtonStyle {
    var color: Color
    var foregroundStyle: Color
    var shape: AnyShape
    var useFullWidth: Bool
    @Environment(\.isEnabled) private var isEnabled
    
    public init(color: Color = .accentColor, foregroundStyle: Color = .primary, shape: AnyShape = AnyShape(.rect(cornerRadius: DesignStyle.defaultComponentRadius)), useFullWidth: Bool = true) {
        self.color = color
        self.foregroundStyle = foregroundStyle
        self.shape = shape
        self.useFullWidth = useFullWidth
    }
    
    public func makeBody(configuration: Configuration) -> some View {
        if #available(iOS 19.0, *) {
            configuration.label
                .buttonStyle(.plain)
                .fontWeight(.medium)
                .foregroundStyle(isEnabled ? foregroundStyle : .gray)
                .padding()
                .frame(maxWidth: useFullWidth ? .infinity : nil)
                .glassEffect(.regular.interactive().tint(isEnabled ? color : Color(.systemGray5)), in: shape)
                .contentShape(shape)
        } else {
            configuration.label
                .buttonStyle(.plain)
                .fontWeight(.medium)
                .foregroundStyle(isEnabled ? foregroundStyle : .gray)
                .padding()
                .frame(maxWidth: useFullWidth ? .infinity : nil)
                .background(isEnabled ? color : Color(.systemGray5), in: shape)
                .contentShape(shape)
                .modifier(FadeScaleAnimation())
                .simultaneousGesture(TapGesture().onEnded{
                    configuration.trigger()
                })
        }
    }
}
