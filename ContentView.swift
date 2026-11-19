import SwiftUI

struct ContentView: View {
    @State private var selectedTab = "HOME"
    @State private var language = "Русский"
    @State private var key = ""

    private let blue = Color(red: 0.0, green: 0.55, blue: 1.0)

    var body: some View {
        ZStack {
            Color(red: 0.025, green: 0.035, blue: 0.065)
                .ignoresSafeArea()

            VStack(spacing: 20) {
                HStack {
                    VStack(alignment: .leading) {
                        Text("ODIN")
                            .font(.system(size: 34, weight: .black))
                            .foregroundColor(blue)

                        Text("PRIVATE • iOS")
                            .font(.caption)
                            .foregroundColor(.gray)
                    }

                    Spacer()

                    Text("1.0")
                        .foregroundColor(blue)
                }

                HStack(spacing: 8) {
                    ForEach(["HOME", "VISUALS", "SETTINGS"], id: \.self) { tab in
                        Button {
                            selectedTab = tab
                        } label: {
                            Text(tab)
                                .font(.caption.bold())
                                .foregroundColor(selectedTab == tab ? .white : .gray)
                                .padding(12)
                                .background(
                                    selectedTab == tab ? blue.opacity(0.5) : Color.white.opacity(0.05)
                                )
                                .cornerRadius(10)
                        }
                    }
                }

                if selectedTab == "HOME" {
                    VStack(spacing: 15) {
                        Text("WELCOME TO ODIN")
                            .font(.title2.bold())
                            .foregroundColor(.white)

                        Text("Your private control center")
                            .foregroundColor(.gray)

                        HStack {
                            Text("STATUS")
                                .foregroundColor(.gray)
                            Spacer()
                            Text("READY")
                                .foregroundColor(.green)
                        }
                        .padding()
                        .background(Color.white.opacity(0.05))
                        .cornerRadius(12)
                    }
                }

                if selectedTab == "VISUALS" {
                    Text("VISUAL SETTINGS")
                        .foregroundColor(blue)
                        .font(.title2.bold())

                    Text("Interface customization")
                        .foregroundColor(.white)
                }

                if selectedTab == "SETTINGS" {
                    Text("LANGUAGE")
                        .foregroundColor(blue)

                    Picker("Language", selection: $language) {
                        Text("Русский").tag("Русский")
                        Text("English").tag("English")
                        Text("Türkçe").tag("Türkçe")
                        Text("Suomi").tag("Suomi")
                    }
                    .pickerStyle(.menu)
                    .tint(.white)
                }

                Spacer()

                Text("ODIN PRIVATE © 2026")
                    .font(.caption2)
                    .foregroundColor(.gray)
            }
            .padding(22)
        }
    }
}
