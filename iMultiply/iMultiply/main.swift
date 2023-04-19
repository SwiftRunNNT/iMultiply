import Foundation

func jogarSwiftRun() {
    var pontos = 0 // pontuação inicial do usuário

    // função que gera um número aleatório entre 0 e 13
    func gerarNumeroAleatorio() -> Int {
        return Int.random(in: 0...13)
    }

    // função que gera uma operação aleatória (+, - ou *)
    func gerarOperacaoAleatoria() -> String {
        let operacoes = ["+", "-", "*"]
        return operacoes.randomElement()!
    }

    // função que mostra a pergunta para o usuário e retorna true se ele acertou ou false se errou
    func mostrarPergunta(numero1: Int, numero2: Int, operacao: String) -> Bool {
        print("Quanto é \(numero1) \(operacao) \(numero2) = (?) ")
        let resposta = readLine()
        if let respostaInt = Int(resposta!) {
            switch operacao {
            case "+":
                return respostaInt == numero1 + numero2
            case "-":
                return respostaInt == numero1 - numero2
            case "*":
                return respostaInt == numero1 * numero2
            default:
                return false
            }
        } else {
            return false
        }
    }

    // função que verifica se o usuário acertou ou errou e atualiza a pontuação
    func verificaResultado(resultado: Bool){
        if resultado {
            pontos += 1
            print("Acertou \n")
        }else {
            print("Errou! \n")
        }
    }

    // função que mostra o resultado final e uma mensagem de acordo com a pontuação
    func mostraResultado(){
        if pontos == 10 {
            print("A miseravi!! vc fez: \(pontos) pontos")
        } else if pontos <= 9 && pontos >= 7 {
            print("Vc é brabo dms!! vc fez \(pontos) pontos")
        } else if pontos <= 5 && pontos >= 1 {
            print("Estude mais!! vc fez: \(pontos) pontos")
        } else {
            print("Infelizmente vc fez \(pontos) pontos")
        }
    }

    print("SwiftRun!! ")

    // loop que gera 10 perguntas aleatórias e atualiza a pontuação
    for _ in 1...10 {
        let numero1 = gerarNumeroAleatorio()
        let numero2 = gerarNumeroAleatorio()
        let operacao = gerarOperacaoAleatoria()
        
        let resultado = mostrarPergunta(numero1: numero1, numero2: numero2, operacao: operacao)
        
        verificaResultado(resultado: resultado)
    }

    mostraResultado() // mostra o resultado final
}

print("  ----- SWIFTRUN -----  ")
jogarSwiftRun() // inicia jogo 
