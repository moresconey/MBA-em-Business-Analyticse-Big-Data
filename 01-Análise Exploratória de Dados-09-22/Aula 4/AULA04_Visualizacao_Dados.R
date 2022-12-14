#--------------------------------------------------------------------------------#
#--------------------------------------------------------------------------------#
# MBA EM BUSINESS ANALYTICS E BIG DATA
# INFERENCIA ESTATISTICA
# CASE 4 - Visualiza??o e an?lise dos dados
#--------------------------------------------------------------------------------#
#--------------------------------------------------------------------------------#

library(dplyr)
library(rcompanion)

#--------------------------------------------------------------------------------#
# Metadados de renda de Ilocos, Filipinas
# Adaptado de: pacote ineq do R
# DATASETS: Ilocos
# DATASET FINAL: income_ilocos.csv
#--------------------------------------------------------------------------------#

# EXERCICIO 1:
# Contexto: A base cont?m dados censit?rios de 632 domic?lios em de uma das 16
# regioes da Filipinas chamada Ilocos

# -- Vari?veis:
# income: renda total do domicilio (pesos filipinos)
# sex: sexo do chefe do dom?clio (male ou female)
# family.size: n?mero de integrantes da familia
# urbanity: tipo de regi?o onde encontra-se o domicilio
# province: nome da provincia onde encontra-se o domicilio

#--------------------------------------------------------------------------------#
# PARTE a - Estatistica descritiva
#--------------------------------------------------------------------------------#

# a) Leitura da base de dados e inspe?ao das variaveis


# Uma das formas rapidas de visualizacao da-se por tabelas, no R temos o co-
# mando table() que mostra o dado na forma tabular com as contagens das catego-
# rias dos factors

# table(var) | table(var1, var2) | addmargins(table(var1, var2), 1:2)

# ja o prop.table aliado com o dado tabular fornece os %s

# prop.table(table(var)) 
# prop.table(table(var1, var2), 1) : soma 100% na linha
# prop.table(table(var1, var2), 2) : soma 100% na coluna

# b) Construa uma tabela province vs urbanity somando em quantidade e % na linha.
# Como s?o as distribuicoes?


# c) Calcule a correlacao entre as categorias province e urbanity via V de Cramer.
# Qual ? a intensidade dessa associacao?


# d) Determine m?tricas de estat?stica descritiva para a vari?vel income. Que ti-
# po de aspecto tem a distribui??o?


# e) Calcule a correlacao entre income e family.size. Qual ? a intensidade dessa
# associacao


# f) Determine a media e mediana da renda por sexo do chefe de familia. Existe
# muita diferenca entre os valores?



#--------------------------------------------------------------------------------#
# PARTE b - Analise exploratoria de dados (dataviz)
#--------------------------------------------------------------------------------#

# g) Fa?a um grafico univariado com as vars sex, urbanity e province.
# Que tipo de insights conseguimos aqui?


# h) Fa?a um grafico univariado com as vars income ($1000) e family.size.
# Que tipo de insights conseguimos aqui?


# i) Fa?a um gr?fico bivariado de province e urbanity.
# Como ? a rela??o entre as categorias?



# j) Fa?a um gr?fico bivariado de province e sex
# Como ? a rela??o entre as categorias?


# k) Fa?a um gr?fico bivariado de urbanity e sex
# Como ? a rela??o entre as categorias?


# l) Fa?a gr?ficos bivariados da variavel family.size
# Que tipo de insights conseguimos aqui?


# m) Fa?a gr?ficos bivariados da variavel income
# Que tipo de insights conseguimos aqui?


#--------------------------------------------------------------------------------#
#--------------------------------------------------------------------------------#
# FIM
#--------------------------------------------------------------------------------#
#--------------------------------------------------------------------------------#
