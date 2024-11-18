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
            TextField("Label", text: $label)
            TextField("Data", text: $data)
            Picker("Type", selection: $selectedType) {
                ForEach(codeTypes, id: \.self) { type in
                    Text(type)
                }
            }
            .pickerStyle(.segmented)
        }
        .navigationTitle("Add Card")
        .toolbar {
            Button("Cancel") {
                dismiss()
            }
            Button("Save") {
                addBarcode()
                dismiss()
            }
        }
    }
    
    private func addBarcode() {
        let newItem = Item(label: label, data: data, type: selectedType == "Barcode" ? "EAN13" : "QR Code")
        modelContext.insert(newItem)
    }
} 