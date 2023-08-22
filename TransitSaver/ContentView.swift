//
//  ContentView.swift
//  TransitSaver
//
//  Created by Kailean O'Keefe on 8/14/23.
//

import SwiftUI
import CoreData

struct ContentView: View {
  @Environment(\.managedObjectContext) private var viewContext
  var referenceVehicles = ["Tacoma", "Civic"]
  var transitMethods = ["Bus", "Bike", "Carpool"]
  
  @State private var selectedVehicle: Int = 0
  @State private var selectedTransitMethod: Int = 1
  
  var body: some View {
    NavigationView {
      VStack {
        Text("Amount Saved")
        Text("Reference Vehicle")
        Picker("Vehicle", selection: $selectedVehicle) {
          ForEach(0 ..< referenceVehicles.count, id: \.self) {
            Text(referenceVehicles[$0])
          }
        }
        Text("Transit Method")
        Picker("Transit Method", selection: $selectedTransitMethod) {
          ForEach(0 ..< transitMethods.count, id: \.self) {
            Text(transitMethods[$0])
          }
        }
        Button(action: startTrackingMiles ) {
          Text("Start")
        }
      }
      .toolbar {
        ToolbarItem(placement: .navigationBarTrailing) {
          NavigationLink(destination: SettingsPage()) {
            Label("Go To Settings", systemImage: "gear")
          }
//          Button(action: navigateToSettings) {
//            Label("Go To Settings", systemImage: "gear")
//          }
        }
        ToolbarItem(placement: .navigationBarLeading) {
          Button(action: navigateToCharts) {
            Label("Go to Charts", systemImage: "chart.bar")
          }
        }
      }
      Text("Select an item")
    }
  }
  
  // TODO: Move this to the view model
  private func navigateToSettings() {
  }
  private func navigateToCharts() {
  }
  private func startTrackingMiles() {
  }
  
  private func addItem() {
    withAnimation {
      let newItem = Item(context: viewContext)
      newItem.timestamp = Date()
      
      do {
        try viewContext.save()
      } catch {
        // Replace this implementation with code to handle the error appropriately.
        // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
        let nsError = error as NSError
        fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
      }
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
  }
}
