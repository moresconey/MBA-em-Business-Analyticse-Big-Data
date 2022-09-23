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
df = read.csv("01-Análise Exploratória de Dados-09-22/Aula 3/wallmart_sales.csv")

# b) Observe a estrutura dos dataframes, formatos das vari?veis, range das infor-
# ma??es e ocorr?ncia de valores omissos (missing values)
str(df)
summary(df)



# c) QUal ? a ordem dos niveis dos factors (ie. como est? a ordem das categorias
# das vari?veis qualitativas)? ? necess?rio fazer alguma altera??o? Fa?a essa
# an?lise para Type, Weekday e Month
str(df[c("Type","Weekday","Month")])

#--------------------------------------------------------------------------------#
# PARTE b - Estat?stica descritiva
#--------------------------------------------------------------------------------#

# EXERCICIO 2: Sobre a vari?vel venda determine
# a) Qual ? o valor da m?dia e mediana das vendas semanais? Elas s?o parecidas?
print(paste("Média:", mean(df$Sales_wkly)))
print(paste("Mediana:", median(df$Sales_wkly)))
# Média e Mediana muito distantes pode possuir muitos outliers em nosso data frame, neste caso para cima

# b) Qual ? a amplitude da venda semanal?


# c) E o desvio padr?o e vari?ncia?
print(paste("Desvio Padrão:", sd(df$Sales_wkly)))
print(paste("variância:", var(df$Sales_wkly)))


# d) Quais s?o os quartis de 25% e 75%?
print(paste("Primeiro Quartil:", quantile(df$Sales_wkly, .25)))
print(paste("Terceiro Quartil:", quantile(df$Sales_wkly, .75)))

# e) Quais s?o os percentis de 99% e 1%?
print(paste("Percentil 99%:", quantile(df$Sales_wkly, .99)))
print(paste("Percentil 1%:", quantile(df$Sales_wkly, .01)))


# EXERCICIO 3: Use o dplyr + descritiva para os itens abaixo
# a) QUal loja possui uma venda m?dia semanal maior?
df %>% group_by(Store) %>% summarize(media_semana = mean(Sales_wkly)) %>% arrange(desc(media_semana)) %>% head(3)

# b) Qual dia da semana possui maior venda m?nima semanal?
table(df$Weekday) # Somente possui Dados de Sexta-Feira
df %>% group_by(Weekday) %>% summarize(max_day = max(Sales_wkly)) %>% arrange(desc(max_day)) %>% head(3)

# c) Qual loja encontra-se em uma regi?o com a mediana de temperatura menor?
df %>% group_by(Store) %>% summarize(temp = median(Temperature)) %>% arrange(temp) %>% head(1)

# d) Filtre a loja do item anterior e veja a temperatura m?xima, m?dia, m?nima
# e variancia do periodo registrado de vendas
df %>% filter(Store == 7) %>% summarise(max = max(Temperature), med = mean(Temperature), min = min(Temperature), var = var(Temperature))

# e) Qual tipo de loja possui na m?dia um tamanho maior?
df %>% group_by(Type) %>% summarize(med_size = mean(Size)) %>% arrange(desc(med_size)) %>% head(1)

# f) Qual ? o percentil de 25% e 75% das vendas semanais por tipo de loja?
df %>% group_by(Type) %>% summarize(primeiro_quartil = quantile(Sales_wkly, .25), terceiro_quartil = quantile(Sales_wkly, .75))

# EXERC?CIO 4: 
# a) Existe associa??o entre vendas semanais e temperatura?
cor(df$Sales_wkly, df$Temperature)
plot(df$Sales_wkly, df$Temperature)
# Não

# b) Existe associa??o entre tamanho da loja e vendas semanais?
cor(df$Sales_wkly, df$Size)
plot(df$Sales_wkly, df$Size)
# Sim forte correlação positiva, quanto maior a loja maior são as vendas

#--------------------------------------------------------------------------------#
#--------------------------------------------------------------------------------#
# FIM
#--------------------------------------------------------------------------------#
#--------------------------------------------------------------------------------#
