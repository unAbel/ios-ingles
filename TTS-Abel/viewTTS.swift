//
//  viewTTS.swift
//  TTS-Abel
//
//  Created by macOS abel on 18/09/23.
//

import SwiftUI

struct viewTTS: View {
    let element: Element
    @ObservedObject var instTTS = viewModelTTS()

    var body: some View {
        VStack(alignment: .leading){
            Text("📚")
                .font(.system(size: 80))
                .foregroundColor(Color.red)
                .frame(maxWidth: .infinity, alignment: .center)

            Text("Castellano: \(element.texto1)")
                .font(.system(size: 30))
                .padding(.vertical, 10)
            Text("Castellano: \(element.texto2)")
                .font(.system(size: 30))
            HStack{
                Text("Ingles: \(element.texto3)")
                    .font(.system(size: 30))
                Button(action: {instTTS.speakText(to: element.texto3)}){
                    Image(systemName: "speaker.3.fill")
                    .frame(width: 30, height: 30)
                }.accentColor(.blue)
            }
            HStack{
                Text(element.texto4)
                    .font(.system(size: 30))
                Button(action: {instTTS.speakText(to: element.texto4)}){
                    Image(systemName: "speaker.3.fill")
                    .frame(width: 30, height: 30)
                }.accentColor(.blue)
                
            }
            //Spacer()
        }
        .padding(15)
        .padding(.vertical, 50)
        .border(Color.blue, width: 4)
        .cornerRadius(15)
    }
    
}

struct viewTTS_Previews: PreviewProvider {
    
    static var previews: some View {
        viewTTS(element: elemento)
    }
}

var elemento = Element(
 texto1: "Texto 1",
 texto2: "Texto 2",
 texto3: "Texto 3",
 texto4: "Texto 4"
)
