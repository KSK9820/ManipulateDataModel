import ManipulateDataModel
import Foundation


// MARK: - DecodeDTO
// Macros to attach to Struct objects that will adopt Decodable

@DecodeDTO
struct TestDTO {
    let test: String
}


// MARK: - Key
// Macros to use instead of CodingKey
/// Key macros can be used instead of CodingKey that require you to create all variables

// Usage:
/// @Key("server_variable_name") let/var "my_variable_name"


@DecodeDTO
struct Model {
    @Key("receiver_id") let receiverID: Int
}

// MARK: - ConvertToDomainModel<T: DTOMappable>
// Macros to use when changing a DTO to a DomainModel
/// The DomainModel to be converted must be written as a generic value.
/// The generic value can only be an object that conforms to DTOMappable.

// Important:
// Can only be applied to same variable name, same type

// Usage:
/// @ConvertToDomainModel<DomainModel: DTOMappable>
/// you can convert ResponseDTOModel to DomainModel

@ConvertToDomainModel<DomainModel>
struct ResponseModel {
    let id: Int
    let name: String
    let createdAt: Date
}


// MARK: - ConvertToDTOModel<T: DomainMappable>
// Macros to use when changing a DomainModel to a DTO
/// The DomainModel to be converted must be written as a generic value.
/// The generic value can only be an object that conforms to DTOMappable.

// Important:
// Can only be applied to same variable name, same type

// Usage:
/// @ConvertToDomainModel<DomainModel: DomainMappable>
/// you can convert DomainModel to RequestDTOModel

@ConvertToDTOModel<RequestModel>
struct DomainModel: DTOMappable {
    let id: Int
    let name: String
    let createdAt: Date
}


struct RequestModel: DomainMappable {
    let id: Int
    let name: String
    let createdAt: Date
}


let c = ResponseModel(id: 1, name: "sd", createdAt: Date())
var d = c.toModel()
print(d)


