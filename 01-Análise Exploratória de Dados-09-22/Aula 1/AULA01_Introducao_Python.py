#--------------------------------------------------------------------------------#
#--------------------------------------------------------------------------------#
# MBA EM BUSINESS ANALYTICS E BIG DATA
# INFERENCIA ESTATISTICA
# CASE 1 - Introdução ao Python
#--------------------------------------------------------------------------------#
#--------------------------------------------------------------------------------#

#--------------------------------------------------------------------------------#
# PARTE a - Comandos e sintaxe básica
#--------------------------------------------------------------------------------#

#--------------------------------------------------------------------------------#

# Importe Duas bibliotecas necessárias
import numpy as np
import pandas as pd

# EXERCICIO 1 - Trabalhando com tipo de dados

# a) Numerica
1

# b) Caractere
"a"

# c) Booleana
True

#--------------------------------------------------------------------------------#
# EXERCICIO 2: Trabalhando com operações básicas

# a) Assinale o valor 42 a variável x e 10 à variável y. Imprima os valores 
x = 42
y = 10
x
y

# b) Imprima agora a subtração entre x e y
x-y

# c) Crie um vetor com os numeros 1, 10 e 49. Imprima
x = [1,10,49]
print(x)

# d) Crie um vetor de caracteres com a, b e c. Imprima
x = ["a", "b", "c"]
print(x)

# e) Agora crie um vetor com Verdadeiro, Falso e Verdadeiro. Imprima
x = [True,False,True]
print(x)

#--------------------------------------------------------------------------------#
# EXERCICIO 3: Trabalhando com vetores

# a) Crie um vetor com os números 1,3 e 5. Agore crie um com os números 2, 4 e 6.
# Faça a soma de ambos. Imprima os resultados

x = np.array([1,3,5])
y = np.array([2,4,6])
x + y

# b) Crie um vetor com os números de 1 a 10. Extraia os 5 primeiros
x = np.arange(1,11)
x[:5]

#--------------------------------------------------------------------------------#
# EXERCICIO 4: Trabalhando com operadores

# a) Imprima o resultado de 3 mais 4
3+4

# b) Imprima o resultado de 3 vezes 5
3*5

# c) Faça 5 mais 5 e os divida por 2
5+5/2

# d) Eleve 2 à 5a potência
2**5

# e) Resto da divisão (parte inteira) de 28 por 6
28%6

# f) Crie um vetorde 1 a 10 e com ele crie um vetor logico se cada valor desse
# vetor é > 5. Extraia esses valores do vetor
x = np.arange(1,10)
x[x>5]

# g) Repita a extração agora para valores maiores que 4 e menores que 7
# DICA: and (ou e) em R é dado por &
x[(x>4) & (x<7)]

#--------------------------------------------------------------------------------#
# EXERCICIO 5: Trabalhando com fatores

# a) A partir do vetor de caracteres abaixo, transforme o seu conteúdo em fator
color_vector = ['blue', 'red', 'green', 'white', 'black', 'yellow']


# b) A partir do vetor de caracteres abaixo, transforme o seu conteúdo em fator
# lembre-se que aqui as categorias possuem ordem
day_vector = ['evening', 'morning', 'afternoon', 'midday', 'midnight', 'evening']


#--------------------------------------------------------------------------------#
# EXERCICIO 6: Trabalhando com matrizes

# a) Construa uma matriz de 5 linhas que contenha os numeros de 1 a 10 e que seja
# a distribuição por linha
x = np.arange(1,11).reshape(5,2,order="F")
x

# b) Crie uma matriz 4x3 que contenha os números de 1 a 12 e que a distribuição
# seja por coluna
y = np.arange(1,13).reshape(4,3)
y

# c) Concatene o vetor com os numeros de 1 a 5 na matriz do item a. Mostre as
# dimensões da nova matriz (use pela coluna)
c1 = np.insert(x, x.shape[1], np.arange(1,6), axis=1)
c1 

# d) Adicione a matriz do item b uma linha com os numeros de 1 a 3. Mostre as
# dimensões da nova matriz 
d1 = np.insert(y, y.shape[0], np.arange(1,4), axis=0)
d1

# e) Da matriz do item d) selecione o elemento da 1a linha e 2a coluna
d1[0][1]

# f) Da matriz do item d) selecione os elementos da linha 1 a 3 da primeira 
# coluna
[x[0] for x in d1[:3]]

#--------------------------------------------------------------------------------#
# EXERCICIO 7: Trabalhando com dataframes

# a) A partir das 4 variáveis abaixo crie um dataframe
a = [10,20,30,40]
b = ['book', 'pen', 'textbook', 'pencil_case']
c = [True,False,True,False]
d = [2.5, 8, 10, 7]

import pandas as pd
df = pd.DataFrame(list(zip(a,b,c,d)))

# b) Acrescente os nomes abaixo às colunas
# a - ID, b - items, c - store, d - price
df.columns = ["ID", "items", "store", "price"]

# c) Mostre a estrutura do dataframe
df.dtypes

# d) Selecione a linha 1 e coluna 2
df.iloc[0,1]

# e) Selecione todas as colunas com as linhas 1 a 2
df.iloc[[0,1]]

# f) Selecione todas as linhas das variáveis ID e store
df.loc[:,["ID","store"]]

# g) Adicione ao data frame o vetor de quantidade
df["quantidade"] = 0

#--------------------------------------------------------------------------------#
# EXERCICIO 8: Trabalhando com listas

# a) A partir do data frame do Ex7, um vetor numerico com 5 numeros e uma 
# matriz 2x5. Gere uma lista e a imprima
list_data = [np.arange(1,6), np.arange(1,11).reshape(5,2)]

# b) Imprima o segundo elemento da lista
list_data[1]

# c) Imprima do segundo elemento da lista, o elemento 2 x 5 da matriz
list_data[1][4,1]

#--------------------------------------------------------------------------------#
# EXERCICIO 9: Trabalhando com if-else

# a) Crie uma variavel quantity, atribua a ele um valor. Caso esse valor seja
# acima de 20 imprima a frase 'You sold a lot!', caso contrário imprima 'Not 
# enough for today'
quantity = 22
if quantity > 20:
    print("You sold a lot!")
else:
    print("Not enough for today")

# b) A partir do item a, modifque a relação acrescentando mais uma regra. Agora
# se a quantidade for acima de 20 e menor ou igual a 30 imprima 'Average day'.
# Para valores acima de 30 ou abaixo de 20 continue fornecendo as mensagens do
# item a
if (quantity > 20) and (quantity <= 30):
    print("Average day")
else:
    print("Not enough for today")

# c) Categorias diferentes de produtos possuem impostos diferentes. Tem-se 3
# diferentes tipos de produtos. Simule o valor final de um produto que vale 10
# e pertence a categoria B
produto = 10
if produto == 10:
    print("Categoria A")
elif produto == 10:
    print("Categoria B")
elif produto == 20:
    print("Categoria C")

# Categoria A - imposto 8%
# Categoria B - imposto 10%
# Categoria C - imposto 20%

#--------------------------------------------------------------------------------#
# EXERCICIO 10: Trabalhando com loops

# a) Imprima cada elemento do vetor abaixo
fruit = ['Apple', 'Orange', 'Passion fruit', 'Banana']
fruit

# b) Crie uma lista vazia e a preencha com 5 números seguindo a regra n^n.
# Imprima essa lista
empty_list = []
for i in range(1,6):
    empty_list.append(i**i)
empty_list

# c) Através da matriz abaixo, cria um loop que imprima cada valor seguindo a se-
# guinte regra: Row i and column j have values of x
mat = np.arange(11,21).reshape(5,2, order="F")
for i, row in enumerate(mat):
    for j, value in enumerate(row):
        print(f"Row {i} and column {j} have values of {value}")

#--------------------------------------------------------------------------------#
# PARTE b - Leitura e escrita de dados
#--------------------------------------------------------------------------------#

#--------------------------------------------------------------------------------#
# EXERCICIO 11: Baixe o arquivo dataset.csv do eclass, em seguida Salve em um 
# diretorio chamado Heart disease em alguma pasta diferente do wd()

# a) Leia o arquivo
df_file = pd.read_csv("01-Análise Exploratória de Dados-09-22/Aula 1/dataset.csv")

# b) Mostre a estrutura do data frame
df.dtypes

# c) Mostre as 5 primeiras linhas do data frame
df.head()

# d) Mostre as 5 ultimas linhas do data frame
df.tail()

# e) Mostre o data frame
df

# Escreva esse data frame no formato csv no desktop com o nome heart_disease
df.to_csv("heart_disease.csv", index=False)

#--------------------------------------------------------------------------------#
#--------------------------------------------------------------------------------#
# FIM
#--------------------------------------------------------------------------------#
#--------------------------------------------------------------------------------#