#--------------------------------------------------------------------------------#
#--------------------------------------------------------------------------------#
# MBA EM BUSINESS ANALYTICS E BIG DATA
# INFERENCIA ESTATISTICA
# CASE 2 - Manipulando dados no R 
#--------------------------------------------------------------------------------#
#--------------------------------------------------------------------------------#

library(dplyr)
library(tidyr)
library(stringr)
library(lubridate)

#--------------------------------------------------------------------------------#
# PARTE a - Manipula??o de datas com o lubridate
#--------------------------------------------------------------------------------#

# EXERCICIO 1:
# A base transact cont?m dados de gera??o e pagamento de faturas de cart?o de
# cr?dito de um banco. 
# A ideia ? explorar o comportamento de pagamento dos clientes no que se refere
# i   - identifica??o de faturas pagas em atraso e em dia
# ii  - identifica??o de quantos dias decorridos da gera??o da fatura ate o paga-
#      mento
# iii - marca??o do dia da semana onde acontecem essas transa??es
# iv  - determine o ano e m?s de gera??o das faturas


# a) Leia a base de dados. Que formato de dados temos? Quantas linhas e quantas
# colunas?


# b) O conte?do do data frame est? como caracteres. Converta adequadamente o char 
# em formato de data-tempo



# c) Identificando se a fatura foi paga em atraso ou em dia


#                t0         t1          t2     t3
# gera??o fatura |----------------------| vencimento fatura
# CASO 1         |------------------------------| pagamento fatura  EM ATRASO
# CASO 2         |----------| pagamento fatura                      EM DIA



# d) Identificacao do mes, ano, e dia da semana da geracao da fatura


# e) Quantidade de faturas por Status (em dia e em atraso)


# f) Quantidade de faturas por m?s, ano e dia da semana


# g) Quantidade de faturas em atraso por dia da semana


# h) Crie um intervalo de tempo entre o vencimento e o pagamento, determine a 
# dura??o em dias. Filtre apenas as faturas pagas com atraso e veja a m?dia 
# em dias por ano


#--------------------------------------------------------------------------------#
# PARTE b - Manipula??o de dataframes com o dplyr
#--------------------------------------------------------------------------------#

# EXERCICIO 2:
# CONTEXTO: ? apresentado a voc? dados hist?ricos de mais de 2 anos de vendas em
# 45 lojas da rede de supermercados Walmart no EUA. Al?m disso s?o apresentadas 
# outras informa??es referentes as datas que abragem as vendas bem como informa??es
# sobre as lojas. 
# Adaptado de: https://www.kaggle.com/manjeetsingh/retaildataset

# Os dados s?o apresentados em 3 dataframes distintos e possuem as seguintes infos

# i) date_features.csv: informa??es atreladas ? regi?es de origem de uma deter-
# minada loja. Note que as vari?veis est?o atreladas ao calend?rio e a loja em
# quest?o

# -- Vari?veis:
# Store: c?digo anonimizado da loja
# Date: data (formato dd/mm/aaaa, vis?o semanal)
# Temperature: temperatura m?dia semanal na regi?o (Fahrenheit)
# Fuel_Price: pre?o do combust?vel na regi?o (US$)
# MarkDown1: dado anonimizado referente ? descontos dados a produtos (US$)
# CPI: Indice de Pre?os ao Consumidor na regi?o
# Unemployment: Taxa de desemprego na regi?o (%)
# IsHoliday: Indicador de que a data refere-se ? um feriado (booleana)

# ii) stores_info.csv: informa??es anonimizadas referentes ?s 45 lojas

# -- Vari?veis:
# Store: C?digo anonimizado da loja
# Type: Tipo da loja (anonimizado)
# Size: Tamanho da loja medido pela sua ?rea (sqt ft)

# iii) stores_sales.csv: dados hist?ricos de vendas cobrindo de 2010-02-05 ?
# 2012-11-01 para cada loja e departamento

# -- Vari?veis:
# Store: C?digo anonimizado da loja
# Dept: C?digo anonimizado do departamento da loja
# Date: data (formato dd/mm/aaaa, vis?o semanal)
# Weekly_Sales: total de vendas na semana em uma determinada loja e departamento

#--------------------------------------------------------------------------------#

# a) Leia os dataframes em quest?o


# b) Observe a estrutura dos dataframes, formatos das vari?veis, range das infor-
# ma??es e ocorr?ncia de valores omissos (missing values)
# Dica: use o summary e str


# existem informa??es missing em algumas vari?veis em maior ou menor propor??o


# dataframe aparentemente ok


# existem valores negativos de vendas

# c) Remova a vari?vel MarkDown1 do dataframe 'date_info'


# d) Fa?a a convers?o da temperatura para graus Celsius, fa?a o arredondamento na
# primeira casa decimal

# e) Ap?s uma pesquisa, foi determinado o significado do tipo anonimizado de 
# loja (Type) no dataframe 'stores_info': 

# A - Supercenter
# B - Discount Store
# C - Neighborhood Market

# Fa?a a substitui??o na pr?pria vari?vel original


# f) Fa?a a convers?o da ?rea da loja de p?s quadrados para metros quadrados, 
# deixe sem casas decimais


# g) Remova os valores negativos de vendas semanais Weekly_Sales do dataframe
# 'sales_info'


# h) Agregue as informa??es de vendas no n?vel loja, ou seja, some por todos 
# os departamentos por loja e data. Atribua o conte?do no dataframe 'sales_info2'


# i) Traga as informa??es do dataframe 'date_info' no dataframe 'sales_info2'.
# Armazene o conte?do no dataframe 'df' e renomeie a coluna de vendas semanais
# para Sales_wkly

# as keys dos dataframes s?o: Store e Date


# j) Traga as informa??es do dataframe 'stores_info' no dataframe criado no 
# item anterior

# as keys dos dataframes s?o: Store


# k) Extraia o dia da semana das datas e armazene na coluna 'Weekday'. Use
# de forma abreviada e em ingl?s

# COnvertendo a coluna Date de string -> date


# l) Extraia o m?s da data e armazene na coluna 'Month'. Use de forma abrevia-
# da e em ingl?s


# m) Salve o dataframe 'df' como um arquivo .csv. Nomeie como wallmart_sales


#--------------------------------------------------------------------------------#
#--------------------------------------------------------------------------------#
# FIM
#--------------------------------------------------------------------------------#
#--------------------------------------------------------------------------------#