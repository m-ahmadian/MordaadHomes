//
//  DestinationSearchView.swift
//  MordaadHomes
//
//  Created by Mehrdad Behrouz Ahmadian on 2024-11-23.
//

import SwiftUI

enum DestinationSearchOptions {
    case location
    case dates
    case guests
}

struct DestinationSearchView: View {
    @EnvironmentObject var viewModel: ExploreViewModel
    @State private var selectedOption = DestinationSearchOptions.location
    @State private var starDate = Date()
    @State private var endDate = Date()
    @State private var numberOfGuests = 0
    @Binding var show: Bool
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Button {
                    withAnimation(.snappy) {
                        viewModel.updateListingsForLocation()
                        show.toggle()
                    }
                } label: {
                    Image(systemName: "xmark.circle")
                        .imageScale(.large)
                        .foregroundStyle(.black)
                }
                
                Spacer()
                
                if !viewModel.searchLocation.isEmpty {
                    Button("Clear") {
                        viewModel.searchLocation = ""
                        // TODO: Decide between the two
//                        viewModel.updateListingsForLocation()
                        Task { await viewModel.fetchListings() }
                    }
                    .foregroundStyle(.black)
                    .font(.subheadline)
                    .fontWeight(.semibold)
                }
            }
            .padding()

            VStack(alignment: .leading) {
                if selectedOption == .location {
                    Text("Where to?")
                        .font(.title2)
                        .fontWeight(.semibold)
                    
                    HStack {
                        Image(systemName: "magnifyingglass")
                            .imageScale(.small)
                        
                        TextField("Search destinations", text: $viewModel.searchLocation)
                            .font(.subheadline)
                            .onSubmit {
                                viewModel.updateListingsForLocation()
                                show.toggle()
                            }
                    }
                    .frame(height: 44)
                    .padding(.horizontal)
                    .overlay {
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(lineWidth: 1.0)
                            .foregroundStyle(Color(.systemGray4))
                    }
                } else {
                    collapsedPickerView(title: "Where", description: "Add destination")
                }
            }
            .collapsibleView()
            .frame(height: selectedOption == .location ? 120 : 64)
            .onTapGesture {
                withAnimation(.snappy) { selectedOption = .location }
            }
            
            // MARK: - Date Selection View
            
            VStack(alignment: .leading) {
                if selectedOption == .dates {
                    Text("When's your trip?")
                        .font(.title2)
                        .fontWeight(.semibold)
                    
                    VStack {
                        DatePicker("From", selection: $starDate, displayedComponents: .date)
                        
                        Divider()
                        
                        DatePicker("To", selection: $endDate, displayedComponents: .date)
                    }
                    .foregroundStyle(.gray)
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    
                } else {
                    collapsedPickerView(title: "When", description: "Add dates")
                }
            }
            .collapsibleView()
            .frame(height: selectedOption == .dates ? 180 : 64)
            .onTapGesture {
                withAnimation(.snappy) { selectedOption = .dates }
            }
            
            // MARK: - Number of guests view
            
            // TODO: Check
            VStack(alignment: .leading) {
                if selectedOption == .guests {
                    Text("Who's coming?")
                        .font(.title2)
                        .fontWeight(.semibold)
                        .padding(.bottom)
                    
                    Stepper {
                        Text("\(numberOfGuests) Adults")
                    } onIncrement: {
                        numberOfGuests += 1
                    } onDecrement: {
                        guard numberOfGuests > 0 else { return }
                        numberOfGuests -= 1
                    }

                } else {
                    collapsedPickerView(title: "Who", description: "Add guests")
                }
            }
            .collapsibleView()
            .frame(height: selectedOption == .guests ? 120 : 64)
            .onTapGesture {
                withAnimation(.snappy) { selectedOption = .guests }
            }
            
            Spacer()
        }
        .background(Color(.systemGroupedBackground))
    }
}

#Preview {
    DestinationSearchView(show: .constant(false))
}

struct collapsedPickerView: View {
    let title: String
    let description: String
    
    var body: some View {
        VStack {
            HStack {
                Text(title)
                    .foregroundStyle(.gray)
                
                Spacer()
                
                Text(description)
            }
            .fontWeight(.semibold)
            .font(.subheadline)
        }
    }
}
