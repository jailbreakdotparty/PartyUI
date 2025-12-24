// MARK: Details
// PartyUI: a collection of reusable UI elements used by jailbreak.party.
// Licensed under the MIT License.
// https://github.com/jailbreakdotparty/PartyUI
// https://jailbreak.party/

import SwiftUI

// MARK: Functions
public func conditionalCornerRadius() -> CGFloat {
    if #available(iOS 26.0, *) {
        return 18
    } else {
        return 12
    }
}

// MARK: Image Rendering
public struct ImageRenderingView: View {
    var imageName: String
    var cornerRadius: CGFloat = 24
    var capsuleImage: Bool = false
    var glassEffect: Bool = true
    var isInteractive: Bool = true
    var width: CGFloat = 40
    var height: CGFloat = 40
    var shouldImageFit: Bool = false
    var useBackground: Bool = false
    
    public init(imageName: String, cornerRadius: CGFloat = 14, capsuleImage: Bool = false, glassEffect: Bool = true, isInteractive: Bool = true, width: CGFloat = 40, height: CGFloat = 40, shouldImageFit: Bool = false, useBackground: Bool = false) {
        self.imageName = imageName
        self.cornerRadius = cornerRadius
        self.capsuleImage = capsuleImage
        self.glassEffect = glassEffect
        self.isInteractive = isInteractive
        self.width = width
        self.height = height
        self.shouldImageFit = shouldImageFit
        self.useBackground = useBackground
    }
    
    public var body: some View {
        let shape: AnyShape = capsuleImage ? AnyShape(.capsule) : AnyShape(.rect(cornerRadius: cornerRadius))
        
        if #available(iOS 26.0, *) {
            Group {
                if shouldImageFit {
                    Image(imageName)
                        .resizable()
                        .scaledToFit()
                } else {
                    Image(imageName)
                        .resizable()
                        .scaledToFill()
                }
            }
            .frame(width: width, height: height)
            .clipShape(shape)
            .modifier(DynamicGlassEffect(shape: shape, glassEffect: glassEffect, isInteractive: isInteractive, useBackground: useBackground))
        } else {
            Group {
                if shouldImageFit {
                    Image(imageName)
                        .resizable()
                        .scaledToFit()
                } else {
                    Image(imageName)
                        .resizable()
                        .scaledToFill()
                }
            }
            .frame(width: width, height: height)
            .clipShape(shape)
        }
    }
}

// MARK: Effects
public struct DynamicGlassEffect: ViewModifier {
    var color: Color = Color(.quaternaryLabel)
    var shape: AnyShape = AnyShape(.rect(cornerRadius: 18))
    var useFullWidth: Bool = true
    var glassEffect: Bool = true
    var isInteractive: Bool = true
    var useBackground: Bool = true
    
    public init(color: Color = Color(.quaternaryLabel), shape: AnyShape = AnyShape(.rect(cornerRadius: 18)), useFullWidth: Bool = true, glassEffect: Bool = true, isInteractive: Bool = true, useBackground: Bool = true) {
        self.color = color
        self.shape = shape
        self.useFullWidth = useFullWidth
        self.glassEffect = glassEffect
        self.isInteractive = isInteractive
        self.useBackground = useBackground
    }
    
    public func body(content: Content) -> some View {
        if #available(iOS 26.0, *) {
            if glassEffect {
                content
                    .background(useBackground ? color.opacity(0.2) : .clear)
                    .clipShape(shape)
                    .glassEffect(isInteractive ? .regular.interactive() : .regular, in: shape)
            } else {
                content
                    .background(useBackground ? color.opacity(0.2) : .clear)
                    .clipShape(shape)
            }
        } else {
            let shape: AnyShape = AnyShape(.rect(cornerRadius: 12))
            
            content
                .background(color.opacity(0.2))
                .clipShape(shape)
        }
    }
}

// MARK: Containers
public struct TerminalContainer<Content: View>: View {
    @ViewBuilder var content: Content
    
    public init(content: Content) {
        self.content = content
    }
    
    public var body: some View {
        ZStack(alignment: .top) {
            content
                .padding(.horizontal)
            VStack {
                VariableBlurView(maxBlurRadius: 1, direction: .blurredTopClearBottom)
                    .frame(maxHeight: 20)
                Spacer()
                VariableBlurView(maxBlurRadius: 1, direction: .blurredBottomClearTop)
                    .frame(maxHeight: 20)
            }
            .frame(alignment: .top)
        }
        .frame(height: 250)
        .modifier(DynamicGlassEffect())
    }
}

public struct OverlayButtonContainer<Content: View>: View {
    @ViewBuilder var content: Content
    @State private var keyboardShown: Bool = false
    
    public init(content: Content, keyboardShown: Bool = false) {
        self.content = content 
        self.keyboardShown = keyboardShown
    }
    
    public var body: some View {
        VStack {
            content
        }
        .padding(.horizontal, 25)
        .padding(.top, 30)
        .padding(.bottom, keyboardShown ? 20 : 0)
        .background {
            ZStack {
                VariableBlurView(maxBlurRadius: 8, direction: .blurredBottomClearTop)
                Rectangle()
                    .fill(Gradient(colors: [.clear, Color(.systemBackground)]))
                    .opacity(0.8)
            }
            .ignoresSafeArea()
        }
        .onReceive(NotificationCenter.default.publisher(for: UIResponder.keyboardWillShowNotification)) { _ in
            keyboardShown = true
        }
        .onReceive(NotificationCenter.default.publisher(for: UIResponder.keyboardWillHideNotification)) { _ in
            keyboardShown = false
        }
    }
}

// MARK: Headers, labels, and other views
public struct HeaderLabel: View {
    var text: String
    var icon: String
    
    public init(text: String, icon: String) {
        self.text = text
        self.icon = icon
    }
    
    public var body: some View {
        HStack {
            if #available(iOS 26.0, *) {
                Image(systemName: icon)
                    .frame(width: 24, alignment: .center)
                Text(text)
            } else {
                Image(systemName: icon)
                    .frame(alignment: .center)
                Text(text)
            }
        }
    }
}

public struct ButtonLabel: View {
    var text: String
    var icon: String
    var isRegularImage: Bool = false
    
    public init(text: String, icon: String, isRegularImage: Bool = false) {
        self.text = text
        self.icon = icon
        self.isRegularImage = isRegularImage
    }
    
    public var body: some View {
        HStack {
            if isRegularImage {
                ImageRenderingView(imageName: icon, cornerRadius: 0, glassEffect: false, isInteractive: false, width: 24, height: 24, shouldImageFit: true)
            } else {
                Image(systemName: icon)
            }
            Text(text)
        }
    }
}

public struct LinkCreditCell: View {
    @Environment(\.openURL) private var openURL
    var image: String = ""
    var name: String
    var text: String
    var link: String
    
    public init(image: String = "", name: String, text: String, link: String) {
        self.image = image
        self.name = name
        self.text = text
        self.link = link
    }
    
    public var body: some View {
        Button(action: {
            openURL(URL(string: link)!)
        }) {
            HStack(spacing: 12) {
                if !image.isEmpty {
                    ImageRenderingView(imageName: image, capsuleImage: true)
                }
                VStack(alignment: .leading) {
                    Text(name)
                        .fontWeight(.semibold)
                    Text(text)
                        .font(.subheadline)
                        .opacity(0.8)
                }
                Spacer()
                Image(systemName: "chevron.right")
                    .imageScale(.small)
                    .opacity(0.2)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
        }
        .foregroundStyle(.primary)
    }
}

// MARK: Buttons, Text Fields, Lists
public struct GlassyButtonStyle: ButtonStyle {
    var isDisabled: Bool = false
    var color: Color = .accentColor
    var useFullWidth: Bool = true
    var cornerRadius: CGFloat = 18
    var capsuleButton: Bool = false
    var isInteractive: Bool = true
    var isMaterialButton: Bool = false
    
    public init(isDisabled: Bool = false, color: Color = .accentColor, useFullWidth: Bool = true, cornerRadius: CGFloat = 18, capsuleButton: Bool = false, isInteractive: Bool = true, isMaterialButton: Bool = false) {
        self.isDisabled = isDisabled
        self.color = color
        self.useFullWidth = useFullWidth
        self.cornerRadius = cornerRadius
        self.capsuleButton = capsuleButton
        self.isInteractive = isInteractive
        self.isMaterialButton = isMaterialButton
    }
    
    public func makeBody(configuration: Configuration) -> some View {
        let color: Color = isDisabled ? .gray : color
        
        if #available(iOS 26.0, *) {
            let shape: AnyShape = capsuleButton ? AnyShape(.capsule) : AnyShape(.rect(cornerRadius: cornerRadius))
            let isInteractive: Bool = isDisabled ? false : true
            
            configuration.label
                .buttonStyle(.plain)
                .frame(maxWidth: useFullWidth ? .infinity : nil)
                .foregroundStyle(color)
                .padding()
                .background(color.opacity(0.2))
                .clipShape(shape)
                .glassEffect(isInteractive ? .regular.interactive() : .regular, in: shape)
                .allowsHitTesting(!isDisabled)
        } else {
            let shape: AnyShape = capsuleButton ? AnyShape(.capsule) : AnyShape(.rect(cornerRadius: 12))
            
            configuration.label
                .buttonStyle(.plain)
                .frame(maxWidth: useFullWidth ? .infinity : nil)
                .foregroundStyle(color)
                .padding()
                .background(color.opacity(0.2))
                .background {
                    if isMaterialButton {
                        Color.clear.background(.ultraThinMaterial)
                    }
                }
                .clipShape(shape)
                .allowsHitTesting(!isDisabled)
        }
    }
}

public struct GlassyTextFieldStyle: TextFieldStyle {
    var isDisabled: Bool = false
    var color: Color = Color(.quaternaryLabel)
    var cornerRadius: CGFloat = 18
    var capsuleField: Bool = false
    var isInteractive: Bool = true
    
    public init(isDisabled: Bool = false, color: Color = Color(.quaternaryLabel), cornerRadius: CGFloat = 18, capsuleField: Bool = false, isInteractive: Bool = true) {
        self.isDisabled = isDisabled
        self.color = color
        self.cornerRadius = cornerRadius
        self.capsuleField = capsuleField
        self.isInteractive = isInteractive
    }
    
    public func _body(configuration: TextField<Self._Label>) -> some View {
        let color: Color = isDisabled ? .gray : color
        let fontColor: Color = isDisabled ? .gray : .primary
        
        if #available(iOS 26.0, *) {
            let shape: AnyShape = capsuleField ? AnyShape(.capsule) : AnyShape(.rect(cornerRadius: cornerRadius))
            let isInteractive: Bool = isDisabled ? false : true
            
            configuration
                .textFieldStyle(.plain)
                .frame(maxWidth: .infinity)
                .foregroundStyle(fontColor)
                .padding()
                .background(color.opacity(0.2))
                .clipShape(shape)
                .glassEffect(isInteractive ? .regular.interactive() : .regular, in: shape)
                .allowsHitTesting(!isDisabled)
        } else {
            let shape: AnyShape = capsuleField ? AnyShape(.capsule) : AnyShape(.rect(cornerRadius: 12))
            
            configuration
                .textFieldStyle(.plain)
                .frame(maxWidth: .infinity)
                .foregroundStyle(fontColor)
                .padding()
                .background(color.opacity(0.2))
                .clipShape(shape)
                .allowsHitTesting(!isDisabled)
        }
    }
}

public struct GlassyListRowBackground: ViewModifier {
    var color: Color = .accentColor
    var cornerRadius: CGFloat = conditionalCornerRadius()
    
    public init(color: Color = .accentColor, cornerRadius: CGFloat = conditionalCornerRadius()) {
        self.color = color
        self.cornerRadius = cornerRadius
    }
    
    public func body(content: Content) -> some View {
        if #available(iOS 26.0, *) {
            content
                .frame(maxWidth: .infinity, alignment: .leading)
                .foregroundStyle(color)
                .padding()
                .background(color.opacity(0.2))
                .clipShape(.rect(cornerRadius: cornerRadius))
                .glassEffect(.regular.interactive(), in: .rect(cornerRadius: cornerRadius))
        } else {
            content
                .frame(maxWidth: .infinity, alignment: .leading)
                .foregroundStyle(color)
                .padding()
                .background(color.opacity(0.2))
                .clipShape(.rect(cornerRadius: cornerRadius))
        }
    }
}

// MARK: Welcome Sheet
public struct WelcomeSheetTitle: View {
    var title: String
    var color: Color = .accentColor
    
    public init(title: String, color: Color = .accentColor) {
        self.title = title
        self.color = color
    }
    
    public var body: some View {
        VStack(alignment: .center) {
            Text("Welcome to")
                .font(.title)
            Text(title)
                .font(.system(.largeTitle, weight: .semibold))
                .foregroundStyle(color)
        }
        .frame(maxWidth: .infinity)
    }
}

struct WelcomeSheetCell: View {
    var icon: String
    var title: String
    var context: String
    
    public init(icon: String, title: String, context: String) {
        self.icon = icon
        self.title = title
        self.context = context
    }
    
    public var body: some View {
        HStack(spacing: 20) {
            Image(systemName: icon)
                .resizable()
                .scaledToFit()
                .frame(width: 35, height: 35, alignment: .center)
                .foregroundStyle(Color.accentColor)
            VStack(alignment: .leading) {
                Text(title)
                    .font(.system(.title3, weight: .medium))
                Text(context)
                    .multilineTextAlignment(.leading)
                    .opacity(0.8)
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}

struct WelcomeSheet<CellContent: View, ButtonContent: View>: View {
    var title: String
    @ViewBuilder var cellContent: CellContent
    @ViewBuilder var buttonContent: ButtonContent
    
    public init(title: String, cellContent: CellContent, buttonContent: ButtonContent) {
        self.title = title
        self.cellContent = cellContent
        self.buttonContent = buttonContent
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            WelcomeSheetTitle(title: title)
                .padding(.top, 60)
            Spacer()
            VStack(alignment: .leading, spacing: 35) {
                cellContent
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.bottom, 80)
            Spacer()
            VStack {
                buttonContent
            }
            .frame(maxWidth: .infinity, alignment: .leading)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(.bottom, 20)
    }
}
