import SwiftUI

struct AddBarcodeView: View {
    @Environment(\.modelContext) private var modelContext
    @Environment(\.dismiss) private var dismiss
    @State private var label: String = ""
    @State private var data: String = ""
    @State private var showingLabelHelp = false
    @State private var showingDataHelp = false
    @State private var selectedType = "Barcode"
    let codeTypes = ["Barcode", "QR Code"]
    
    var body: some View {
        Form {
            Section {
                HStack {
                    Text("Label")
                        .padding(.leading)
                    TextField("", text: $label)
                        #if os(macOS)
                        .frame(width: 300)
                        #endif
                }
                .padding(.top)
                
                HStack {
                    Text("Data")
                        .padding(.leading)
                    TextField("", text: $data)
                        #if os(macOS)
                        .frame(width: 300)
                        #endif
                }
                
                Picker("Type", selection: $selectedType) {
                    ForEach(codeTypes, id: \.self) { type in
                        Text(type)
                    }
                }
                .pickerStyle(.segmented)
                .padding(.vertical, 8)
                .padding(.trailing)
            }
        }
        #if os(macOS)
        .frame(width: 450)
        #endif
        .navigationTitle("Add Card")
        .toolbar {
            Button("Cancel") {
                dismiss()
            }
            Button("Save") {
                addItem()
            }
        }
    }
    
    private func addItem() {
        let newItem = Item(
            label: label,
            data: data,
            type: selectedType == "Barcode" ? "EAN13" : "QR Code"
        )
        modelContext.insert(newItem)
        dismiss()
    }
} 