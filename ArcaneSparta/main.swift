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

var ordemEscolhida: OrdemArcana? = nil

func mostrarMenu() {
    print("""
    
    🛡 Santuário de Esparta Arcana
    Escolha uma opção:
    
    1. Escolher Ordem Arcana
    2. Entrar no Santuário (duelo)
    3. Ver Filosofia da Ordem
    4. Sair
    
    """)
}

func iniciarDuelo(ordem: OrdemArcana) {
    var inimigo = inimigoAleatorio()
    let status = atributos(ordem: ordem)
    var vidaJogador = status.vida

    print("\n⚔️ Você entrou no Santuário Arcano...")
    print("Um \(inimigo.nome) surge diante de você!")
    print("Vida do inimigo: \(inimigo.vida)\n")
    print("📌 Dica da sua Ordem: \(status.dica)\n")

    while vidaJogador > 0 && inimigo.vida > 0 {
        
        print("""
        ❗ Status atual:
        Sua vida: \(vidaJogador)
        Vida do inimigo: \(inimigo.vida)

        Escolha sua ação:
        1. Golpe Normal
        2. Golpe Arcano
        """)
        
        let escolha = readLine()
        var danoCausado = 0
        
        if escolha == "1" {
            let resultado = calcularDano(base: status.danoBase, critChance: status.critChance)
            danoCausado = resultado.dano
            print("\nVocê atacou e causou \(danoCausado) de dano\(resultado.critico ? " (CRÍTICO!)" : "").")
        }
        else if escolha == "2" {
            let extra = Int.random(in: 5...12)
            danoCausado = status.danoBase + extra
            print("\n✨ Golpe Arcano! Você canalizou poder místico e causou \(danoCausado) de dano!")
        }
        else {
            print("Ação inválida.")
            continue
        }
        
        inimigo.vida -= danoCausado
        
        if inimigo.vida <= 0 {
            print("\n🏆 Você derrotou o \(inimigo.nome)!")
            return
        }
        
        // Inimigo ataca
        print("O \(inimigo.nome) revida!")
        print("🩸 Ele causou \(inimigo.ataque) de dano.")
        vidaJogador -= inimigo.ataque
        
        if vidaJogador <= 0 {
            print("\n💀 Você caiu no Santuário...")
            return
        }

        print("")
    }
}

var executando = true

while executando {
    mostrarMenu()
    let opcao = readLine()
    
    switch opcao {
        case "1":
            print("""
            Escolha sua Ordem:
            1. Hélio
            2. Nyx
            3. Kháos
            """)
            let escolha = readLine()
            
            switch escolha {
                case "1": ordemEscolhida = .helio
                case "2": ordemEscolhida = .nyx
                case "3": ordemEscolhida = .khaos
                default: print("Escolha inválida.")
            }
            
            if let ordem = ordemEscolhida {
                let f = atributos(ordem: ordem)
                print("\nVocê agora pertence à Ordem de \(ordem).")
                print("Vida base: \(f.vida)")
                print("Filosofia: \(f.filosofia)")
                print("Dica: \(f.dica)\n")
            }
        
        case "2":
            if let ordem = ordemEscolhida {
                iniciarDuelo(ordem: ordem)
            } else {
                print("Escolha uma Ordem primeiro!\n")
            }
        
        case "3":
            if let ordem = ordemEscolhida {
                let f = atributos(ordem: ordem)
                print("\n📜 Filosofia da Ordem:")
                print(f.filosofia)
                print("Dica: \(f.dica)\n")
            } else {
                print("Nenhuma Ordem selecionada.\n")
            }
        
        case "4":
            print("Saindo do Santuário...")
            executando = false
        
        default:
            print("Opção inválida.\n")
    }
}
