# Tríade dos Guerreiros de Esparta Arcana

Um mini–RPG de console onde você assume o papel de um guerreiro arcano treinado no antigo **Santuário de Esparta Arcana**.

Três ordens ancestrais moldam o estilo de combate, a filosofia e o destino do seu personagem.

O objetivo do projeto é apresentar um jogo simples, funcional e bem organizado, demonstrando domínio de:

- enums
- funções puras
- tuplas
- estruturas de decisão e loops
- entrada de dados com `readLine()`
- modularidade e clareza no código
- lógica de combate e geração aleatória

Sem complexidade desnecessária — direto, limpo e pensado para ser compreensível.

---

## Ordens Arcanas

Cada Ordem possui atributos, estilo de combate, filosofia e uma dica estratégica.

### 🔥 **Ordem de Hélio**

Disciplina, fogo e precisão.

- Vida: 28
- Dano base: 4
- Chance crítica: 10%
- Filosofia: *“Brilho é disciplina.”*
- Estilo: golpes diretos e confiáveis

---

### 🌑 **Ordem de Nyx**

Trevas, silêncio e análise fria.

- Vida: 24
- Dano base: 5
- Chance crítica: 25%
- Filosofia: *“A escuridão observa.”*
- Estilo: foco em ataques críticos

---

### ⚚ **Ordem de Kháos**

Magia instável e poder bruto.

- Vida: 22
- Dano base: 5
- Chance crítica: 40%
- Filosofia: *“O mundo nasceu do acaso.”*
- Estilo: imprevisibilidade e golpes arcanos fortes

---

## 👹 Inimigos do Santuário

A cada duelo, um adversário aleatório surge:

- **Serpente da Areia** — ágil e venenosa
- **Espectro do Deserto** — etéreo, corrosivo
- **Guardião da Noite** — robusto e implacável

Cada um possui vida e dano próprios, variando o desafio.

## ⚔️ Como funciona o jogo

1. **Escolha sua Ordem Arcana**
2. Veja sua filosofia, vida e vantagens
3. Enfrente um inimigo sorteado
4. Durante o duelo, escolha sua ação:
    - **Golpe Normal** — pode causar crítico
    - **Golpe Arcano** — dano aumentado aleatoriamente
5. Sobreviva aos ataques do inimigo
6. Vença… ou caia no Santuário

O combate é totalmente por turnos e depende das suas escolhas e da sorte arcana.

## 🧩 Estrutura do Código

- **`enum OrdemArcana`**
    
    Define as ordens e permite organizar atributos de forma clara.
    
- **Função `atributos`**
    
    Retorna uma tupla com: vida, dano base, chance crítica, filosofia e dica.
    
- **Função `calcularDano`**
    
    Lida com dano crítico e retorna outra tupla: dano final e boolean indicando crítico.
    
- **Sistema de inimigos**
    
    Lista de inimigos e função que retorna um aleatório.
    
- **Função `iniciarDuelo`**
    
    Gerencia todo o combate, decisões e fluxo da batalha.
    
- **Menu principal**
    
    Loop interativo com 4 opções:
    
    escolher ordem, duelar, ver filosofia e sair.
    

A organização foi pensada para ser simples, modular e fácil de entender.
