<a href="https://exyte.com/"><picture><source media="(prefers-color-scheme: dark)" srcset="https://raw.githubusercontent.com/exyte/media/master/common/header-dark.png"><img src="https://raw.githubusercontent.com/exyte/media/master/common/header-light.png"></picture></a>

<a href="https://exyte.com/"><picture><source media="(prefers-color-scheme: dark)" srcset="https://raw.githubusercontent.com/exyte/media/master/common/our-site-dark.png" width="80" height="16"><img src="https://raw.githubusercontent.com/exyte/media/master/common/our-site-light.png" width="80" height="16"></picture></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="https://twitter.com/exyteHQ"><picture><source media="(prefers-color-scheme: dark)" srcset="https://raw.githubusercontent.com/exyte/media/master/common/twitter-dark.png" width="74" height="16"><img src="https://raw.githubusercontent.com/exyte/media/master/common/twitter-light.png" width="74" height="16">
</picture></a> <a href="https://exyte.com/contacts"><picture><source media="(prefers-color-scheme: dark)" srcset="https://raw.githubusercontent.com/exyte/media/master/common/get-in-touch-dark.png" width="128" height="24" align="right"><img src="https://raw.githubusercontent.com/exyte/media/master/common/get-in-touch-light.png" width="128" height="24" align="right"></picture></a>

<img align="right" src="https://raw.githubusercontent.com/exyte/media/master/ConcentricOnboarding/demo.gif" width="250" />

<p><h1 align="left">Concentric Onboarding</h1></p>

<p><h4>iOS library for a walkthrough or onboarding flow with tap actions written with SwiftUI</h4></p>

![](https://img.shields.io/github/v/tag/exyte/ConcentricOnboarding?label=Version)
[![](https://img.shields.io/endpoint?url=https%3A%2F%2Fswiftpackageindex.com%2Fapi%2Fpackages%2Fexyte%2FConcentricOnboarding%2Fbadge%3Ftype%3Dswift-versions)](https://swiftpackageindex.com/exyte/ConcentricOnboarding)
[![](https://img.shields.io/endpoint?url=https%3A%2F%2Fswiftpackageindex.com%2Fapi%2Fpackages%2Fexyte%2FConcentricOnboarding%2Fbadge%3Ftype%3Dplatforms)](https://swiftpackageindex.com/exyte/ConcentricOnboarding)
[![SPM](https://img.shields.io/badge/SPM-Compatible-brightgreen.svg)](https://swiftpackageindex.com/exyte/ConcentricOnboarding)
[![Cocoapods](https://img.shields.io/badge/Cocoapods-Deprecated%20after%201.0.5-yellow.svg)](https://cocoapods.org/pods/ConcentricOnboarding)
[![License: MIT](https://img.shields.io/badge/License-MIT-black.svg)](https://opensource.org/licenses/MIT)

# Usage
1. Create `View`'s descendant class for your pages.
2. Create at least two pages and fill them with content.
3. Create an array of tuple - (page, background color).
4. Create ConcentricOnboardingView and place it in your view hierarchy.
```swift
struct ContentView: View {
    var body: some View {
        return ConcentricOnboardingView(pageContents: [<your_page>, <your_background_color>])
    }
}
```
5. Pass duration as an argument if you want animation to be faster/slower
```swift
ConcentricOnboardingView(pageContents: [<your_page>, <your_background_color>])
	.(duration: 2.0)
```

6. Pass icon name as an argument if you want to change default icon on the button 
```swift
ConcentricOnboardingView(pageContents: [<your_page>, <your_background_color>])
	.(nextIcon: "chevron.forward")
```
  
### Public interface    
`goToNextPage(animated: Bool = true)` - call this method manually if you need to  
`goToPreviousPage(animated: Bool = true)` - call this method manually if you need to  
  
### Assignable closures    

`.animationWillBegin` - called before animation starts  
`.animationDidEnd` - called after animation ends  
`.didGoToLastPage` - called after animation leading to last page ends  
`.didChangeCurrentPage` - called after page changes  
`.insteadOfCyclingToFirstPage` - replaces default navigation to first page after pressing next on last page  
`.insteadOfCyclingToLastPage` - replaces default navigation to last page after pressing prev on first page while navigating backwards  
`.didPressNextButton` - replaces default button action with user's custom closure  
  
## Examples

To try the ConcentricOnboarding examples:
- Clone the repo `https://github.com/exyte/ConcentricOnboarding.git`
- Open `ConcentricOnboardingExample.xcodeproj` in the Xcode
- Try it!

## Installation

### [Swift Package Manager](https://swift.org/package-manager/)

```swift
dependencies: [
    .package(url: "https://github.com/exyte/ConcentricOnboarding.git")
]
```

## Requirements

* iOS 14+
* Xcode 12+

## Acknowledgements

Many thanks to [Cuberto team](https://dribbble.com/shots/6654320-Animated-Onboarding-Screens) for the design idea and inspiration. 

## Our other open source SwiftUI libraries
[PopupView](https://github.com/exyte/PopupView) - Toasts and popups library    
[Grid](https://github.com/exyte/Grid) - The most powerful Grid container    
[ScalingHeaderScrollView](https://github.com/exyte/ScalingHeaderScrollView) - A scroll view with a sticky header which shrinks as you scroll  
[AnimatedTabBar](https://github.com/exyte/AnimatedTabBar) - A tabbar with number of preset animations         
[MediaPicker](https://github.com/exyte/mediapicker) - Customizable media picker     
[Chat](https://github.com/exyte/chat) - Chat UI framework with fully customizable message cells, input view, and a built-in media picker      
[FloatingButton](https://github.com/exyte/FloatingButton) - Floating button menu     
[ActivityIndicatorView](https://github.com/exyte/ActivityIndicatorView) - A number of animated loading indicators     
[ProgressIndicatorView](https://github.com/exyte/ProgressIndicatorView) - A number of animated progress indicators    
[SVGView](https://github.com/exyte/SVGView) - SVG parser    
[LiquidSwipe](https://github.com/exyte/LiquidSwipe) - Liquid navigation animation    

