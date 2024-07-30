//
//  HiPeopleProject.swift
//  HiPeopleProject
//
//  Created by Eduardo Geovanni Pérez Munguía on 28/07/24.
//

import Foundation

// MARK: - HiPeople
struct HiPeople: Codable {
    let results: [Result]
    let info: Info
}

// MARK: - Info
struct Info: Codable {
    let seed: String
    let results, page: Int
    let version: String
}

// MARK: - Result
struct Result: Codable, Equatable {
    let gender: Gender
    let name: NameClass
    let location: Location
    let email: String
    let login: Login
    let dob, registered: Dob
    let phone, cell: String
    let id: ID
    let picture: Picture
    let nat: Nat
}

// MARK: - Dob
struct Dob: Codable, Equatable {
    let date: String
    let age: Int
}

// MARK: - ID
struct ID: Codable, Equatable {
    let name: NameEnum
    let value: String
}

// MARK: - NameClass
struct NameClass: Codable, Equatable {
    let title: Title
    let first, last: String
}

// MARK: - Login
struct Login: Codable, Equatable {
    let uuid, username, password, salt: String
    let md5, sha1, sha256: String
}

// MARK: - Location
struct Location: Codable, Equatable {
    let street: Street
    let city, state: String
    let country: Country
    let postcode: Int
    let coordinates: Coordinates
    let timezone: Timezone
}

// MARK: - Street
struct Street: Codable, Equatable {
    let number: Int
    let name: String
}

// MARK: - Coordinates
struct Coordinates: Codable, Equatable {
    let latitude, longitude: String
}

// MARK: - Timezone
struct Timezone: Codable, Equatable {
    let offset, description: String
}

// MARK: - Picture
struct Picture: Codable, Equatable {
    let large, medium, thumbnail: String
}

enum Gender: String, Codable, Equatable {
    case female = "female"
    case male = "male"
}

enum NameEnum: String, Codable, Equatable {
    case dni = "DNI"
}

enum Title: String, Codable, Equatable {
    case miss = "Miss"
    case mr = "Mr"
    case mrs = "Mrs"
    case ms = "Ms"
}

enum Country: String, Codable, Equatable {
    case spain = "Spain"
}

enum Nat: String, Codable, Equatable {
    case es = "ES"
}
