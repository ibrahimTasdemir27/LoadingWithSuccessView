# LoadingWithSuccessView
<img alt="Static Badge" src="https://img.shields.io/badge/Xcode-UIView-xcode?&logo=xcode&color=CF212E"> <a href='https://github.com/ibrahimTasdemir27/RFRatingView/' target="_blank"><img alt="Static Badge" src="https://img.shields.io/badge/iOS-swift-xcode?logo=swift">
<a href='https://www.linkedin.com/in/ibrahim-halil-taşdemir-ios-developer-111631245/' target="_blank"><img alt="Static Badge" src="https://img.shields.io/badge/-0B66C2?logo=linkedin">
<a href='https://github.com/ibrahimTasdemir27/' target="_blank"><img alt="Static Badge" src="https://img.shields.io/badge/ibrahimtasdmr27-LoadingWithSuccessView-xcode?logo=GitHub&color=CF212E">

- A simple success view written in Swift.


# OUTPUT

<img width="112" alt="Screenshot 2024-08-03 at 15 48 36" src="https://github.com/user-attachments/assets/2e89d7b4-f3a7-44e2-9d52-6aa8950e3656">


## Requirements
- iOS 15.0
- Xcode 15.0+
- Swift 5.9+

## Swift Package Manager

To integrate LoadingWithSuccessView into your Xcode project using Swift Package Manager, add it to the dependencies value of your Package.swift

```
dependencies: [
    .package(url: "https://github.com/ibrahimTasdemir27/LoadingWithSuccessView", .upToNextMajor(from: "2.0.0"))
]
```


## Usage

```swift

import LoadingWithSuccessView

class ViewController: UIViewController {

    private let loadable = LoadableElementPresentable()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadable.contentWillLoadWithSuccess(withCompletion: nil)
    }
}

```
