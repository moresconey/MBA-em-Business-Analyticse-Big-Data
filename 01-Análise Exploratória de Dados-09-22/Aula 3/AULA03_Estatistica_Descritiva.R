#--------------------------------------------------------------------------------#
#--------------------------------------------------------------------------------#
# MBA EM BUSINESS ANALYTICS E BIG DATA
# INFERENCIA ESTATISTICA
# CASE 3 - Estat?stica Descritiva
#--------------------------------------------------------------------------------#
#--------------------------------------------------------------------------------#

library(dplyr)
library(stringr)

#--------------------------------------------------------------------------------#
# Vendas na rede de mercados do Walmart no EUA
# Adaptado de: https://www.kaggle.com/manjeetsingh/retaildataset 
# DATASETS ORIGEM: date_features.csv, stores_info.csv, stores_sales.csv
# DATASET FINAL: wallmart_sales.csv
#--------------------------------------------------------------------------------#

# CONTEXTO: vide CASE 2

#--------------------------------------------------------------------------------#
# PARTE a - Leitura e ajustes do dataframe
#--------------------------------------------------------------------------------#

# EXERCICIO 1:
# a) Leia o dataframe processado na aula anterior


# b) Observe a estrutura dos dataframes, formatos das vari?veis, range das infor-
# ma??es e ocorr?ncia de valores omissos (missing values)


# c) QUal ? a ordem dos niveis dos factors (ie. como est? a ordem das categorias
# das vari?veis qualitativas)? ? necess?rio fazer alguma altera??o? Fa?a essa
# an?lise para Type, Weekday e Month



#--------------------------------------------------------------------------------#
# PARTE b - Estat?stica descritiva
#--------------------------------------------------------------------------------#

# EXERCICIO 2: Sobre a vari?vel venda determine
# a) Qual ? o valor da m?dia e mediana das vendas semanais? Elas s?o parecidas?


# b) Qual ? a amplitude da venda semanal?


# c) E o desvio padr?o e vari?ncia?


# d) Quais s?o os quartis de 25% e 75%?


# e) Quais s?o os percentis de 99% e 1%?



# EXERCICIO 3: Use o dplyr + descritiva para os itens abaixo
# a) QUal loja possui uma venda m?dia semanal maior?


# b) Qual dia da semana possui maior venda m?nima semanal?


# c) Qual loja encontra-se em uma regi?o com a mediana de temperatura menor?


# d) Filtre a loja do item anterior e veja a temperatura m?xima, m?dia, m?nima
# e variancia do periodo registrado de vendas


# e) Qual tipo de loja possui na m?dia um tamanho maior?


# f) Qual ? o percentil de 25% e 75% das vendas semanais por tipo de loja?


# EXERC?CIO 4: 
# a) Existe associa??o entre vendas semanais e temperatura?


# b) Existe associa??o entre tamanho da loja e vendas semanais?


#--------------------------------------------------------------------------------#
#--------------------------------------------------------------------------------#
# FIM
#--------------------------------------------------------------------------------#
#--------------------------------------------------------------------------------#
