# Changelog

## [v1.1.3](https://github.com/lengocduy/DLSwipeToPopController/tree/v1.1.3) (2021-12-09)

- Skip invoking method `didPopViewController` when view was embed inside another `ContainerView`

## [v1.1.2](https://github.com/lengocduy/DLSwipeToPopController/tree/v1.1.2) (2021-12-08)

- Invoke method `didPopViewController` when `viewDidDisappear` to allow the client consume event follow the life-cycle

## [v1.1.1](https://github.com/lengocduy/DLSwipeToPopController/tree/v1.1.1) (2021-11-13)

- Detect horizontal direction once the gesture end to process as finish transition only

## [v1.1.0](https://github.com/lengocduy/DLSwipeToPopController/tree/v1.1.0) (2021-11-09)

- Support configuration for maximum of vertical distance (coordinate y) `maximumOfVerticalDistance`
  - Only recognize the gesture when user drag of swipe in the range of this property's value
  - In the case vertical distance larger than the configured value. It will skip recognizing and delegate for other components in the chain

## [v1.0.0](https://github.com/lengocduy/DLSwipeToPopController/tree/v1.0.0) (2021-10-31)

- Swipe from Right to Left to pop ViewController
    - Customize via `velocity` when swipe gesture was recognized
- Drag from Right to Left to pop ViewController
    - Customize via `percent` distance move per screen's width
- Built-in Controllers:  `SwipeToPopViewController` &  `SwipeToPopTableViewController`
