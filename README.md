![Icon](https://github.com/jailbreakdotparty/PartyUI/blob/main/PartyUI-icon.png)
# PartyUI
**Simple SwiftUI package containing a bunch of random UI components we reuse at [jailbreak.party](https://jailbreak.party/).**
> "If you can learn one thing from one project that you can carry with you into everything else you do, that project was a success."
> *Abraham Lincoln*

## Credits
- [lunginspector](https://github.com/lunginspector) for all the actual work.
- [nikstar's VariableBlur](https://github.com/nikstar/VariableBlur) used in PartyUI, licensed under the MIT License.
- [Skadz](https://github.com/skadz108) for throwing this together into a package.

PartyUI is licensed under the [MIT License](https://github.com/jailbreakdotparty/PartyUI/blob/main/LICENSE.md). Feel free to use this in whatever if you really want to.

## Documentation
- Buttons
  - `PrimaryButtonStyle` - A large button that sets the background to the accent color. Animated with FadeScaleAnimation.
  - `TranscluentButtonStyle` - A large button that tints the clear background and label to accent color. Animated with FadeScaleAnimation.
  - `TinyButtonStyle` - A small button that has no padding or background. Animated with FadeAnimation.
  - `ToolbarButtonStyle` - Currently broken, intended to tint the color to the default color on iOS 26.
- TextFields
  - `PrimaryTextFieldStyle` - The primary text field style. Also has a plain style built-in (which removes all styling but lets you use the autocorrection and autocapitialization properties).
  - `PrimaryTextFieldButton` - A text field with styiling, but it also includes a place to put a button. This groups the text field and button into one container.
- Headers
  - `HeaderDropdown` - A header with a dropdown, that supports AppStorage so that the state is saved (kinda scuffed). Supports inputting numerical counts for extra behaviors.
  - `HeaderLabel` - A label for list headers.
  - `ThemedHeaderLabel` - A label for list headers, but themed to match a List's default styling. Recommended for use in ScrollView.
- Platters
  - `SectionPlatter` - The background for contents inside of a specific section.
  - `TerminalPlatter` - The container of a terminal view.
- Backgrounds
  - `AccentBackground` - A background that's just the accent color with a really low opacity.
  - `FluidGradientBackground` - Uses FluidGradient to produce a nice, moving background, similar to a lava lamp. Uses the accent color of the app.
  - `OverlayBackground` - A background suitable for use in button overlays inside of regular views. This detects when the keyboard is pulled up and adds extra padding, so that your buttons/other content inside of the overlay don't get clipped.
- Labels
  - `NavigationLabel` - A label that has an arrow at the end, takes up the full space, and spaces between the text and the chevron.
  - `TerminalLabel` - A label that's useful to give extra information inside of a terminal view.
- Toggles
  - `CheckmarkIcon` - An icon that switches between a checkmark and a plain circle based on a state.
  - `ListToggleItem` - A special-themed toggle that's good for scrolling lists.
  - `ListTogglePlatter` - The background of a ListToggleItem.
- Animations
  - `FadeScaleAnimation` - Fades the view and scales it down on tap.
  - `FadeAnimation` - Fades the view on tap.
  - `UpdatedIconAnimation` - Animates the icon when it updates. On iOS 26, this uses .symbolEffect(.replace). On iOS 18 and earlier, the icon fades into the new one.
- Interactions
  - `Alertinator` - An alert extension. Use by running Alertinator.shared.alert(title: String, body: String).
  - `Exitinator` - Safely exits the app. Use by running exitinator().
  - `Hapticinator` - Plays a haptic when it is run. Use by running Haptic.shared.play(UIImpactFeedbackGenerator.FeedbackStyle).
  - `Shareinator` - Brings up the share sheet for the URL passed. Use by running presentShareSheet(with url: URL).
- AppSettings
  - There's a whole lot to document, but this package has quite a few components for creating a settings view, customizing the app by accent color and appearance, and an acknowledgements browser (add the acknowledgement in plain text inside of your app).
- Welcome Sheet
  - `WelcomeSheetRow` - A row item for Welcome Sheet. 
  - `WelcomeSheetView` - The primary view for the Welcome Sheet. 
