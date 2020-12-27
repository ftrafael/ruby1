def da_boas_vindas
    puts "Bem vindo ao jogo da adivinhação"
    puts "Qual é o seu nome?"
    nome = gets.strip 
    puts "\n\n\n\n"
    puts "Começaremos o jogo para você, #{nome}"
    nome 
end

def pede_dificuldade
    puts "Qual é o nível de dificuldade que deseja?"
    puts "(1) Muito fácil (2) Fácil (3) Normal (4) Difícil (5) Impossível"
    puts "Escolha: "
    dificuldade = gets.to_i
end  

def sorteia_numero_secreto(dificuldade)
    case dificuldade
    when 1
        maximo = 30
    when 2 
        maximo = 60
    when 3
        maximo = 100
    when 4
        maximo = 150
    else
        maximo = 200
    end    
                          
    puts "Escolhendo um numero secreto entre 1 e #{maximo}..."
    sorteado = rand(maximo) + 1
    puts "Escolhido... que tal adivinhar hoje nosso número secreto?"
    return sorteado
end

def pede_um_numero(chutes, tentativas, limite_de_tentativas)
    puts "\n\n\n"
    puts "tentativa #{tentativas} de #{limite_de_tentativas}" 
    puts "chutes até agora: #{chutes}"
    puts "Entre com o número"
    chute = gets
    puts "Será que acertou? Você chutou #{chute}" 
    return chute.to_i #posso tirar o return e deixar apenas o chute.to_i porque esta na ultima linha em ruby.
end

def verifica_se_acertou(numero_secreto, chute)   
    acertou = numero_secreto == chute

    if acertou
        ganhou
        return true 
    end    

    maior = numero_secreto > chute
    if maior
        puts "O número secreto é maior!"
    else
        puts "O número secreto é menor!"
    end
    return false #posso tirar o return e deixar apenas o false pq esta na ultima linha do cod. em ruby.
end 

def ganhou
    puts " PARABÉNS, VOCÊ GANHOU!" 
    puts
    puts "             OOOOOOOOOOO               "
    puts "         OOOOOOOOOOOOOOOOOOO           "
    puts "      OOOOOO  OOOOOOOOO  OOOOOO        "
    puts "    OOOOOO      OOOOO      OOOOOO      "
    puts "  OOOOOOOO  #   OOOOO  #   OOOOOOOO    "
    puts " OOOOOOOOOO    OOOOOOO    OOOOOOOOOO   "
    puts "OOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOO  "
    puts "OOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOO  "
    puts "OOOO  OOOOOOOOOOOOOOOOOOOOOOOOO  OOOO  "
    puts " OOOO  OOOOOOOOOOOOOOOOOOOOOOO  OOOO   "
    puts "  OOOO   OOOOOOOOOOOOOOOOOOOO  OOOO    "
    puts "    OOOOO   OOOOOOOOOOOOOOO   OOOO     "
    puts "      OOOOOO   OOOOOOOOO   OOOOOO      "
    puts "         OOOOOO         OOOOOO         "
    puts "             OOOOOOOOOOOO              "
    puts
    puts "               Acertou!                "
    puts
end    

def joga (nome, dificuldade)
    numero_secreto = sorteia_numero_secreto dificuldade

pontos_ate_agora = 1000 
limite_de_tentativas = 5
chutes = []

for tentativas in 1..limite_de_tentativas

    chute = pede_um_numero(chutes, tentativas, limite_de_tentativas) # posso tirar os parenteses em ruby
    chutes << chute # poderia ter colocado chutes[chutes.size] = chutes, ele iria contar usando o sizeo total de chutes.
    if nome == "Rafael"
        ganhou
        break 
    end
    pontos_a_perder = (chute - numero_secreto).abs / 2.0
    pontos_ate_agora -= pontos_a_perder
    if verifica_se_acertou(numero_secreto, chute) # posso tirar os parenteses em ruby
        break
    end    
end

puts "Você ganhou até agora #{pontos_ate_agora} pontos."
end

def nao_quer_jogar?
    puts "Deseja jogar novamente? (S/N)"
    quero_jogar = gets.strip
    nao_quero_jogar = quero_jogar.upcase == "N"
end    

#variaveis globais abaixo.... para cima variaveis locais
nome = da_boas_vindas
dificuldade = pede_dificuldade

loop do
    joga nome, dificuldade
    if nao_quer_jogar?
        break
    end
end


