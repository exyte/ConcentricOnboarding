<img src="https://raw.githubusercontent.com/exyte/media/master/common/header.png">
<img align="right" src="https://raw.githubusercontent.com/exyte/media/master/ConcentricOnboarding/demo.gif" width="480" />

<p><h1 align="left">Concentric Onboarding</h1></p>

<p><h4>iOS library for a walkthrough or onboarding flow with tap actions written with SwiftUI</h4></p>

___

<p> We are a development agency building
  <a href="https://clutch.co/profile/exyte#review-731233?utm_medium=referral&utm_source=github.com&utm_campaign=phenomenal_to_clutch">phenomenal</a> apps.</p>

</br>

<a href="https://exyte.com/contacts"><img src="https://i.imgur.com/vGjsQPt.png" width="134" height="34"></a> <a href="https://twitter.com/exyteHQ"><img src="https://i.imgur.com/DngwSn1.png" width="165" height="34"></a>

</br></br>

[![Twitter](https://img.shields.io/badge/Twitter-@exyteHQ-blue.svg?style=flat)](http://twitter.com/exyteHQ)
[![Version](https://img.shields.io/cocoapods/v/ConcentricOnboarding.svg?style=flat)](http://cocoapods.org/pods/ConcentricOnboarding)
[![Carthage Compatible](https://img.shields.io/badge/Carthage-compatible-0473B3.svg?style=flat)](https://github.com/Carthage/Carthage)
[![License](https://img.shields.io/cocoapods/l/ConcentricOnboarding.svg?style=flat)](http://cocoapods.org/pods/ConcentricOnboarding)
[![Platform](https://img.shields.io/cocoapods/p/ConcentricOnboarding.svg?style=flat)](http://cocoapods.org/pods/ConcentricOnboarding)

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

To try ConcentricOnboarding examples:
- Clone the repo `https://github.com/exyte/ConcentricOnboarding.git`
- Open terminal and run `cd <ConcentricOnboardingRepo>/Example/`
- Run `pod install` to install all dependencies
- Run open `ConcentricOnboardingExample.xcworkspace/` to open project in the Xcode
- Try it!

## Installation

### [Swift Package Manager](https://swift.org/package-manager/)

```swift
dependencies: [
    .package(url: "https://github.com/exyte/ConcentricOnboarding.git")
]
```

### [CocoaPods](http://cocoapods.org)

To install `ConcentricOnboarding`, simply add the following line to your Podfile:

```ruby
pod 'ConcentricOnboarding'
```

### [Carthage](http://github.com/Carthage/Carthage)

To integrate `ConcentricOnboarding` into your Xcode project using Carthage, specify it in your `Cartfile`

```ruby
github "Exyte/ConcentricOnboarding"
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
[FloatingButton](https://github.com/exyte/FloatingButton) - Floating button menu    
[ActivityIndicatorView](https://github.com/exyte/ActivityIndicatorView) - A number of animated loading indicators    
[ProgressIndicatorView](https://github.com/exyte/ProgressIndicatorView) - A number of animated progress indicators    
[SVGView](https://github.com/exyte/SVGView) - SVG parser    
[LiquidSwipe](https://github.com/exyte/LiquidSwipe) - Liquid navigation animation    

