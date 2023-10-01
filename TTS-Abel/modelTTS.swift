//
//  modelTTS.swift
//  TTS-Abel
//
//  Created by macOS abel on 17/09/23.
//

import Foundation
import AVFoundation


class TTS{
    @Published var elements: [Element] = []
    //private var elements: [Element] = []
    //private var cancellable: AnyCancellable?
    
    let synthesizer = AVSpeechSynthesizer()
    var text: String
    var rate: Float
    
    init(text: String, rate: Float) {
        self.text = text
        self.rate = rate
        
        
        //downloadJSONFromURL()
    }
    
    func getElements()->[Element]{
        return elements
    }
    
    func speakText(to texto: String){//text: String) {
        let utterance = AVSpeechUtterance(string: texto)
        utterance.rate = rate
        utterance.voice = AVSpeechSynthesisVoice(language: "en-US") // Cambia el código de idioma según tu preferencia.
        synthesizer.speak(utterance)
    }
    
    func changeRatio(to rate: Float){
        self.rate = rate
    }
    
    
    func downloadJSONFromURL() {
        let baseURL = "https://unabel.github.io/db.json"
        // Genera un timestamp actual en segundos para que cada URL sea unica
        let timestamp = Int(Date().timeIntervalSince1970)
        // Agrega el timestamp como parámetro de consulta (?)
        let jsonURLString = "\(baseURL)?timestamp=\(timestamp)"
        
        // Crear una URL a partir de la cadena de URL
        guard let url = URL(string: jsonURLString) else {
            print("URL inválida")
            return
        }
        
        // Crear una tarea de descarga de datos, data, response y error contendrán los resultados de la solicitud.
        URLSession.shared.dataTask(with: url) {(data, response, error) in
            if let error = error {
                print("Error al descargar los datos: \(error)")
                return
            }

            guard let data = data else {
                print("Datos vacíos")
                return
            }

            do {
                // Decodificar la respuesta JSON en objetos Swift
                let decoder = JSONDecoder()
                let decodedData = try decoder.decode([Element].self, from: data)
                
                // Actualizar la propiedad elements con los datos decodificados
                // se realice en el hilo principal
                DispatchQueue.main.async {
                    self.elements = decodedData
                }
            } catch {
                print("Error al analizar los datos JSON: \(error)")
            }
        }.resume() // iniciar la tarea de descarga
    }
}



