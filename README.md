# SwiftHook

## 1 Introduction
The following code can be used to send a message to a channel via Discord Webhook. All you have to do is enter the webhook URL.

## 2 Dependencies
1. Swift Language (https://www.swift.org/install/linux)

```shell
$ yay -S --needed --noconfirm swift-bin
```

## 3 WebHook URL

Open the Main.swift file and insert your WebHook URL under the following consant:

```swift
 let webhookURL = ""
```

## 4 Compile

To compile the code, run the following:

```shell
$ gh repo clone f0xb17/SwiftHook
$ cd SwiftHook
$ swift run
```

## 4.1 Build

To create an executable file, run the following:

```shell
$ gh repo clone f0xb17/SwiftHook
$ cd SwiftHook
$ swift build
```

When you build a package, the executable will be pushed to:

```shell
$ cd .build/debug
$ ./RandomSelectionKit
```
