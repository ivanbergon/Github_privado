# Calculadora em Python

# Desenvolva uma calculadora em Python com tudo que você aprendeu nos capítulos 2 e 3. 
# A solução será apresentada no próximo capítulo!
# Assista o vídeo com a execução do programa!

print("\n******************* Python Calculator *******************")

# escrever "Selecione o número da operação desejada:"
print("Selecione o número da operação desejada: \n")

print("1 - Soma")
print("2 - Subtração")
print("3 - Multiplicação")
print("4 - Divisão")

# pedir ao usuário para escolher a opção desejada
operacao = int(input("Digite sua opção (1/2/3/4): "))

# pedir ao usuário o primeiro número
num1 = float(input("Digite o primeiro número: "))

# pedir ao usuário o segundo número
num2 = float(input("Digite o segundo número: "))

# Fazer a operação pedida
if operacao == 1:
    print("O resultado é: ", num1+num2)
elif operacao == 2:
    print("O resultado é: ", num1 - num2)
elif operacao == 3:
    print("O resultado é: ", num1*num2)
elif operacao == 4:
    print("O resultado é: ", num1/num2)
else:
    print("Selecione o tipo de operação corretamente, entre 1 e 4")

# Mostrar o resultado