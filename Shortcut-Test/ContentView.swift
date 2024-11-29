//
//  ContentView.swift
//  Shortcut-Test
//
//  Created by Takuan on 2024/05/23.
//

import SwiftUI
import AppIntents
var switch_s = false;
struct ContentView: View {
    
    var body: some View {
        VStack {
            Image(systemName: "checkmark.seal.fill")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello World")
        }
        NavigationView {
        }
        .padding()
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


struct SwitchInt: AppIntent, CustomIntentMigratedAppIntent, PredictableIntent {
    static let intentClassName = "SwitchIntentIntent"

    static var title: LocalizedStringResource = "スイッチ"
    static var description = IntentDescription("")

    @Parameter(title: "スイッチ")
    var switchState: Bool?

    static var parameterSummary: some ParameterSummary {
        Summary("電気スイッチを操作") {
            \.$switchState
        }
    }

    static var predictionConfiguration: some IntentPredictionConfiguration {
        IntentPrediction(parameters: (\.$switchState)) { switchState in
            DisplayRepresentation(
                title: "電気スイッチ",
                subtitle: ""
            )
        }
    }

    func perform() async throws -> some IntentResult & ReturnsValue<Bool> {
        guard let switchState = switchState else {
                throw NSError(domain: "", code: 0, userInfo: [NSLocalizedDescriptionKey: "Switch value is not set"])
        }
            
        let result = switchState ? true : false
        if switchState {
            //スイッチオンコードを入力
            print("実行:TRUE")
        }
        else {
            //スイッチオフコードを入力
            print("実行:FALSE")
        }
        return .result(value: result)
        
    }
}
