# ANIMATIONS OVERVIEW

### Type specific animations

- ColorAnimation
- RotorAnimation
- Vector3dAnimation
- PathAnimation
- NumberAnimation

### Structural Changes

when parent or anchors changes

- AnchorsAnimation
- ParentAnimation

### Immediate Changes

Useful in sequential animations to prepare animations

- PropertyAction: changes a property
- ScriptAction: runs a script

### Animations with build-in easing curves

- SpringAnimation
- SmoothAnimation

### Combining Animations

- SequentialAnimation
- ParallelAnimation
- PauseAnimation

### Animators

Differently from animations which runs in GUI thread, this animators runs in separate thread (GUI thread can be busy)

- OpacityAnimator
- RotationAnimator
- ScaleAnimator
- UniformAnimator
- XAnimator
- YAnimator
