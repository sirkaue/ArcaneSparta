//
//  main.swift
//  ArcaneSparta
//
//  Created by KAUE DA SILVA LOPES FERREIRA LIMA on 14/11/25.
//

import Foundation

enum OrdemArcana {
    case helio
    case nyx
    case khaos
}

func atributos(ordem: OrdemArcana) -> (vida: Int, danoBase: Int, critChance: Int, filosofia: String, dica: String) {
    switch ordem {
        case .helio:
            return (vida: 28, danoBase: 4, critChance: 10,
                    filosofia: "Brilho é disciplina.",
                    dica: "Hélio domina ataques diretos.")
        case .nyx:
            return (vida: 24, danoBase: 5, critChance: 25,
                    filosofia: "A escuridão observa.",
                    dica: "Nyx explora críticos com maestria.")
        case .khaos:
            return (vida: 22, danoBase: 5, critChance: 40,
                    filosofia: "O mundo nasceu do acaso.",
                    dica: "Kháos tem Golpe Arcano poderoso.")
    }
}

func calcularDano(base: Int, critChance: Int) -> (dano: Int, critico: Bool) {
    let critico = Int.random(in: 1...100) <= critChance
    let valor = critico ? base * 2 : base
    return (valor, critico)
}

let inimigos = [
    (nome: "Serpente da Areia", vida: 30, ataque: 6),
    (nome: "Espectro do Deserto", vida: 34, ataque: 8),
    (nome: "Guardião da Noite", vida: 40, ataque: 9)
]

func inimigoAleatorio() -> (nome: String, vida: Int, ataque: Int) {
    return inimigos.randomElement()!
}
