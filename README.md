# README for DTO Macros

## Overview

This package provides a set of macros to streamline the transformation and decoding process of DTOs (Data Transfer Objects) and Domain Models in Swift. By using attributes like `@DecodeDTO`, `@Key`, `@ConvertToDomainModel`, and `@ConvertToDTOModel`, you can simplify the boilerplate code required for data decoding and conversion.

---

## Features

### 1. **DecodeDTO**

The `@DecodeDTO` macro is used to automatically adopt the `Decodable` protocol for a given struct.

### **Usage**:

```swift
@DecodeDTO
struct TestDTO {
    let test: String
}

// Macro Result
struct TestDTO: Decodable {
	 	let test: String
}
```

### 2. EncodeDTO

The `@EncodeDTO` macro is used to automatically adopt the `Encodable` protocol for a given struct.

```swift
@EncodeDTO
struct TestDTO {
    let test: String
}

// Macro Result
struct TestDTO: Encodable {
	 	let test: String
}
```

### 3. **Key**

The `@Key` macro allows you to map variable names in your code to JSON keys from a server. This replaces the need for manually conforming to `CodingKey`.

### **Usage**:

```swift
@DecodeDTO
struct Model {
    @Key("receiver_id") let receiverID: Int
}

// Macro Result
struct Model: Decodable {
    let receiverID: Int

    enum CodingKeys: String, CodingKey {
        case receiverID = "receiver_id"
    }
}
```

In this example, the `receiver_id` from the server will be mapped to the `receiverID` variable in the struct.

---

### 4. **ConvertToDomainModel<T: DTOMappable>**

The `@ConvertToDomainModel` macro converts a DTO into a Domain Model. The generic type `<T>` must conform to the `DTOMappable` protocol.

### **Important Notes**:

- Can only be applied when variable names and types match.

### **Usage**:

```swift
@ConvertToDomainModel<T: DTOMappable>
struct ResponseModel {
    let id: Int
    let name: String
    let createdAt: Date
}

struct DomainModel: DTOMappable {
		let id: Int
		let name: String
		let createdAt: Date
}

// Macro Result
@ConvertToDomainModel<DomainModel>
struct ResponseModel {
    let id: Int
    let name: String
    let createdAt: Date
    
    func toModel() -> DomainModel {
		    .init(id: self.id, name: self.name, createdAt: self.createdAt)
		}
}
```

This will allow you to easily transform `ResponseModel` into its corresponding `DomainModel`.

---

### 4. **ConvertToDTOModel<T: DomainMappable>**

The `@ConvertToDTOModel` macro converts a Domain Model into a DTO. The generic type `<T>` must conform to the `DomainMappable` protocol.

### **Important Notes**:

- Can only be applied when variable names and types match.

### **Usage**:

```swift
@ConvertToDTOModel<T: DomainMappable>
struct DomainModel {
    let id: Int
    let name: String
    let createdAt: Date
}

struct RequestDTOModel: DomainMappable {
    let id: Int
    let name: String
    let createdAt: Date
}

// Macro Result
@ConvertToDomainModel<RequestDTOModel>
struct DomainModel {
    let id: Int
    let name: String
    let createdAt: Date
    
    func toModel() -> RequestDTOModel {
		    .init(id: self.id, name: self.name, createdAt: self.createdAt)
		}
}
```

In this example, `DomainModel` can be seamlessly transformed into `RequestModel`.

---

## Installation

To include this package in your project:

1. Add the package URL to your Swift Package Manager dependencies.
2. Import the package in your code:
    
    ```swift
    import ManipulateDataModel
    ```
    

---

## Requirements

- Swift 5.7 or later
- Xcode 14.0 or later

---

## Contributing

We welcome contributions! If you find a bug or want to add a feature, please create a pull request or open an issue in the GitHub repository.


--

## LICENSE
MIT License

Copyright (c) 2025 KSK9820

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is provided to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE, AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES, OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT, OR OTHERWISE, ARISING FROM, OUT OF, OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
