# 📘 NetworkError Swift Package

`NetworkError` is a lightweight, extensible Swift enum to model common networking failures in your iOS projects. It includes detailed error context and can be easily integrated into any Swift package or app.

---

## Features

- Covers common networking errors
- Includes debug-friendly descriptions and optional associated values
- Conforms to `Error` and `Equatable`
- Can be used in Swift-based networking layers

---

## Installation via Swift Package Manager (SPM)

Add this to your `Package.swift`:

```swift
dependencies: [
    .package(url: "https://github.com/nmolkeri/NetworkError.git", branch: "main")
]
