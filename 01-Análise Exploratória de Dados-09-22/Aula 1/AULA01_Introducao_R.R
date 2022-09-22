#--------------------------------------------------------------------------------#
#--------------------------------------------------------------------------------#
# MBA EM BUSINESS ANALYTICS E BIG DATA
# INFERENCIA ESTATISTICA
# CASE 1 - Introdução ao R
#--------------------------------------------------------------------------------#
#--------------------------------------------------------------------------------#

#--------------------------------------------------------------------------------#
# PARTE a - Comandos e sintaxe básica
#--------------------------------------------------------------------------------#

#--------------------------------------------------------------------------------#
# EXERCICIO 1 - Trabalhando com tipo de dados

# a) Numerica
1

# b) Caractere
"a"

# c) Booleana
TRUE

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
x = c(1,10,49)
print(x)

# d) Crie um vetor de caracteres com a, b e c. Imprima
x = c("a", "b", "c")
print(x)

# e) Agora crie um vetor com Verdadeiro, Falso e Verdadeiro. Imprima
x = c(TRUE,FALSE,TRUE)
print(x)

#--------------------------------------------------------------------------------#
# EXERCICIO 3: Trabalhando com vetores

# a) Crie um vetor com os números 1,3 e 5. Agore crie um com os números 2, 4 e 6.
# Faça a soma de ambos. Imprima os resultados
x = c(1,3,5)
y = c(2,4,6)
x+y

# b) Crie um vetor com os números de 1 a 10. Extraia os 5 primeiros
x = 1:10
x[1:5]

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
28%/%6

# f) Crie um vetorde 1 a 10 e com ele crie um vetor logico se cada valor desse
# vetor é > 5. Extraia esses valores do vetor
x = c(1:10)
x[x>5]

# g) Repita a extração agora para valores maiores que 4 e menores que 7
# DICA: and (ou e) em R é dado por &
x[x>4 & x<7]

#--------------------------------------------------------------------------------#
# EXERCICIO 5: Trabalhando com fatores

# a) A partir do vetor de caracteres abaixo, transforme o seu conteúdo em fator
color_vector <- c('blue', 'red', 'green', 'white', 'black', 'yellow')
color_fac = factor(color_vector)


# b) A partir do vetor de caracteres abaixo, transforme o seu conteúdo em fator
# lembre-se que aqui as categorias possuem ordem
day_vector <- c('evening', 'morning', 'afternoon', 
                'midday', 'midnight', 'evening')

day_factor = factor(day_vector, levels = c("morning", "midday", "afternoon", "evening", "midnight"))

#--------------------------------------------------------------------------------#
# EXERCICIO 6: Trabalhando com matrizes

# a) Construa uma matriz de 5 linhas que contenha os numeros de 1 a 10 e que seja
# a distribuição por linha
x = matrix(1:10, nrow = 5, ncol = 2)
x

# b) Crie uma matriz 4x3 que contenha os números de 1 a 12 e que a distribuição
# seja por coluna
y = matrix(1:12, nrow = 4, ncol = 3, byrow = TRUE)
y

# c) Concatene o vetor com os numeros de 1 a 5 na matriz do item a. Mostre as
# dimensões da nova matriz (use pela coluna)
c1 = cbind(x, 1:5)
c1

# d) Adicione a matriz do item b uma linha com os numeros de 1 a 3. Mostre as
# dimensões da nova matriz 
d1 = rbind(y, 1:3)
d1

# e) Da matriz do item d) selecione o elemento da 1a linha e 2a coluna
d1[1,2]

# f) Da matriz do item d) selecione os elementos da linha 1 a 3 da primeira 
# coluna
d1[1:3,1]

#--------------------------------------------------------------------------------#
# EXERCICIO 7: Trabalhando com dataframes

# a) A partir das 4 variáveis abaixo crie um dataframe
a <- c(10,20,30,40)
b <- c('book', 'pen', 'textbook', 'pencil_case')
c <- c(TRUE,FALSE,TRUE,FALSE)
d <- c(2.5, 8, 10, 7)
df = data.frame(a,b,c,d)

# b) Acrescente os nomes abaixo às colunas
# a - ID, b - items, c - store, d - price
colnames(df) = c("ID", "items", "store", "price")

# c) Mostre a estrutura do dataframe
str(df)

# d) Selecione a linha 1 e coluna 2
df[1,2]

# e) Selecione todas as colunas com as linhas 1 a 2
df[1:2,]

# f) Selecione todas as linhas das variáveis ID e store
df[,c("ID", "store")]

# g) Adicione ao data frame o vetor de quantidade
df["quantidade"] = c()
df

#--------------------------------------------------------------------------------#
# EXERCICIO 8: Trabalhando com listas

# a) A partir do data frame do Ex7, um vetor numerico com 5 numeros e uma 
# matriz 2x5. Gere uma lista e a imprima
list_data = list(1:5,matrix(1:10,nrow = 5,ncol = 2))
list_data
# b) Imprima o segundo elemento da lista
list_data[2]

# c) Imprima do segundo elemento da lista, o elemento 2 x 5 da matriz
list_data[[2]][5,2]

#--------------------------------------------------------------------------------#
# EXERCICIO 9: Trabalhando com if-else

# a) Crie uma variavel quantity, atribua a ele um valor. Caso esse valor seja
# acima de 20 imprima a frase 'You sold a lot!', caso contrário imprima 'Not 
# enough for today'
quantity = 23
if(quantity > 20){
    print("You sold a lot!")
} else {
   print("Not enough for today")
}


# b) A partir do item a, modifque a relação acrescentando mais uma regra. Agora
# se a quantidade for acima de 20 e menor ou igual a 30 imprima 'Average day'.
# Para valores acima de 30 ou abaixo de 20 continue fornecendo as mensagens do
# item a
quantity = 23
if(quantity > 20 & quantity <= 30){
    print("Average day")
} else {
   print("Not enough for today")
}

# c) Categorias diferentes de produtos possuem impostos diferentes. Tem-se 3
# diferentes tipos de produtos. Simule o valor final de um produto que vale 10
# e pertence a categoria B
product = 10
if(product == 8){
    print("Categoria A")
} else if (product == 10) {
   print("Categoria B") 
} else if (product == 20) {
   print("Categoria C")
}

# Categoria A - imposto 8%
# Categoria B - imposto 10%
# Categoria C - imposto 20%



#--------------------------------------------------------------------------------#
# EXERCICIO 10: Trabalhando com loops

# a) Imprima cada elemento do vetor abaixo
fruit <- c('Apple', 'Orange', 'Passion fruit', 'Banana')
for(x in fruit){
    print(x)
}

# b) Crie uma lista vazia e a preencha com 5 números seguindo a regra n^n.
# Imprima essa lista
empty_list = list()
for(x in 1:5){
    empty_list[x] = x^x
}
empty_list

# c) Através da matriz abaixo, cria um loop que imprima cada valor seguindo a se-
# guinte regra: Row i and column j have values of x
mat <- matrix(data = seq(11, 20, by = 1), nrow = 5, ncol =2)
for(i in 1:nrow(mat)){
    for(j in 1:ncol(mat)){
        print(paste("Row", i, "and column", j,"have values of", mat[i,j]))
    }
}

#--------------------------------------------------------------------------------#
# PARTE b - Leitura e escrita de dados
#--------------------------------------------------------------------------------#

#--------------------------------------------------------------------------------#
# EXERCICIO 11: Baixe o arquivo dataset.csv do eclass, em seguida Salve em um 
# diretorio chamado Heart disease em alguma pasta diferente do wd()

# a) Leia o arquivo
csv_file = read.csv("01-Análise Exploratória de Dados-09-22/Aula 1/dataset.csv")

# b) Mostre a estrutura do data frame
str(csv_file)

# c) Mostre as 5 primeiras linhas do data frame
head(csv_file)

# d) Mostre as 5 ultimas linhas do data frame
tail(csv_file)

# e) Mostre o data frame
csv_file

# Escreva esse data frame no formato csv no desktop com o nome heart_disease
write.csv(csv_file, file = "01-Análise Exploratória de Dados-09-22/Aula 1/heart_disease")

#--------------------------------------------------------------------------------#
#--------------------------------------------------------------------------------#
# FIM
#--------------------------------------------------------------------------------#
#--------------------------------------------------------------------------------#