//
//  UserDetailView.swift
//  HiPeopleProject
//
//  Created by Eduardo Geovanni Pérez Munguía on 29/07/24.
//

import SwiftUI

struct UserDetailView: View {
    let user: Result

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                AsyncImage(url: URL(string: user.picture.large)) { image in
                    image.resizable()
                        .scaledToFill()
                        .frame(height: 250)
                        .clipShape(Circle())
                        .overlay(Circle().stroke(Color.gray, lineWidth: 4))
                        .shadow(radius: 10)
                        .padding(.top)
                } placeholder: {
                    ProgressView()
                        .frame(height: 250)
                }
                .padding(.horizontal)

                Text("\(user.name.title) \(user.name.first) \(user.name.last)")
                    .font(.title)
                    .fontWeight(.bold)
                    .padding(.horizontal)

                Divider()
                    .padding(.horizontal)

                Group {
                    UserDetailRow(label: "Gender", value: user.gender.rawValue.capitalized)
                    UserDetailRow(label: "Email", value: user.email)
                    UserDetailRow(label: "Phone", value: user.phone)
                    UserDetailRow(label: "Location", value: "\(user.location.street.number) \(user.location.street.name), \(user.location.city), \(user.location.state), \(user.location.country.rawValue) \(user.location.postcode)")
                    UserDetailRow(label: "Date of Birth", value: user.dob.date)
                }
                .padding(.horizontal)

                Spacer()
            }
            .navigationTitle("\(user.name.first) \(user.name.last)")
            .background(Color(.systemBackground))
            .edgesIgnoringSafeArea(.bottom)
        }
        .navigationBarBackButtonHidden(true) // Oculta el botón de retroceso de la vista actual
    }
}

struct UserDetailRow: View {
    let label: String
    let value: String

    var body: some View {
        HStack {
            Text(label + ":")
                .fontWeight(.semibold)
            Spacer()
            Text(value)
                .multilineTextAlignment(.trailing)
        }
        .padding()
        .background(Color(.systemGray6))
        .clipShape(RoundedRectangle(cornerRadius: 10))
    }
}

#Preview {
    UserDetailView(user: Result(
        gender: .female,
        name: NameClass(title: .miss, first: "Jane", last: "Doe"),
        location: Location(
            street: Street(number: 123, name: "Main St"),
            city: "Metropolis",
            state: "State",
            country: .spain,
            postcode: 12345,
            coordinates: Coordinates(latitude: "40.7128", longitude: "-74.0060"),
            timezone: Timezone(offset: "-05:00", description: "Eastern Time")
        ),
        email: "jane.doe@example.com",
        login: Login(
            uuid: "uuid",
            username: "jane_doe",
            password: "password",
            salt: "salt",
            md5: "md5",
            sha1: "sha1",
            sha256: "sha256"
        ),
        dob: Dob(date: "1990-01-01T00:00:00Z", age: 34),
        registered: Dob(date: "2015-01-01T00:00:00Z", age: 9),
        phone: "123-456-7890",
        cell: "123-456-7890",
        id: ID(name: .dni, value: "12345678"),
        picture: Picture(large: "https://randomuser.me/api/portraits/women/1.jpg", medium: "https://randomuser.me/api/portraits/med/women/1.jpg", thumbnail: "https://randomuser.me/api/portraits/thumb/women/1.jpg"),
        nat: .es
    ))
}
