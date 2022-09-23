#--------------------------------------------------------------------------------#
#--------------------------------------------------------------------------------#
# MBA EM BUSINESS ANALYTICS E BIG DATA
# INFERENCIA ESTATISTICA
# CASE 2 - Manipulando dados no Python
#--------------------------------------------------------------------------------#
#--------------------------------------------------------------------------------#

import pandas as pd
import re # for strings

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
dfTransact = pd.read_csv("01-Análise Exploratória de Dados-09-22/Aula 2/transact.csv")
dfTransact.dtypes
print(f'Number of rows/records: {dfTransact.shape[0]}')
print(f'Number of columns/variables: {dfTransact.shape[1]}')

# b) O conte?do do data frame est? como caracteres. Converta adequadamente o char 
# em formato de data-tempo
for x in dfTransact.columns:
    dfTransact[x] = pd.to_datetime(dfTransact[x])

# c) Identificando se a fatura foi paga em atraso ou em dia
#                t0         t1          t2     t3
# gera??o fatura |----------------------| vencimento fatura
# CASO 1         |------------------------------| pagamento fatura  EM ATRASO
# CASO 2         |----------| pagamento fatura                      EM DIA
valid = dfTransact["Payment"] > dfTransact["Due"]
dfTransact["status"] = "EM DIA"
dfTransact.loc[valid, "status"] = "EM ATRASO"

# d) Identificacao do mes, ano, e dia da semana da geracao da fatura
dfTransact["mes"] = dfTransact["Invoice"].dt.month
dfTransact["ano"] = dfTransact["Invoice"].dt.year
dfTransact["diasemana"] = dfTransact["Invoice"].dt.weekday

# e) Quantidade de faturas por Status (em dia e em atraso)
dfTransact["status"].value_counts()

# f) Quantidade de faturas por m?s, ano e dia da semana
dfTransact[["mes","ano","diasemana"]].value_counts()

# g) Quantidade de faturas em atraso por dia da semana
dfTransact.loc[dfTransact["status"] == "EM ATRASO","diasemana"].value_counts()

# h) Crie um intervalo de tempo entre o vencimento e o pagamento, determine a 
# dura??o em dias. Filtre apenas as faturas pagas com atraso e veja a m?dia 
# em dias por ano
dfTemp = dfTransact.loc[dfTransact["status"] == "EM ATRASO"]
(dfTemp["Payment"] - dfTemp["Due"]).mean()


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
dfDateFeatures = pd.read_csv("01-Análise Exploratória de Dados-09-22/Aula 2/date_features.csv")
dfStoresInfo = pd.read_csv("01-Análise Exploratória de Dados-09-22/Aula 2/stores_info.csv")
dfStoresSales = pd.read_csv("01-Análise Exploratória de Dados-09-22/Aula 2/stores_sales.csv")

# b) Observe a estrutura dos dataframes, formatos das vari?veis, range das infor-
# ma??es e ocorr?ncia de valores omissos (missing values)
# Dica: use o summary e str
dfDateFeatures.shape
dfDateFeatures.describe()

dfStoresInfo.shape
dfStoresInfo.describe()

dfStoresSales.shape
dfStoresSales.describe()

# existem informa??es missing em algumas vari?veis em maior ou menor propor??o
dfStoresSales.isna().sum()
dfStoresInfo.isna().sum()
dfDateFeatures.isna().sum()

# dataframe aparentemente ok


# existem valores negativos de vendas


# c) Remova a vari?vel MarkDown1 do dataframe 'date_info'
del dfDateFeatures["MarkDown1"]

# d) Fa?a a convers?o da temperatura para graus Celsius, fa?a o arredondamento na
# primeira casa decimal
dfDateFeatures["TemperatureCelsius"] = round((dfDateFeatures["Temperature"] - 32) * (5/9),1)

# e) Ap?s uma pesquisa, foi determinado o significado do tipo anonimizado de 
# loja (Type) no dataframe 'stores_info': 

# A - Supercenter
# B - Discount Store
# C - Neighborhood Market
new_values = {"A" : "Supercenter", "B" : "Discount Store","C" : "Neighborhood Market"}

# Fa?a a substitui??o na pr?pria vari?vel original
dfStoresInfo["Type"].replace(new_values, inplace=True)

# f) Fa?a a convers?o da ?rea da loja de p?s quadrados para metros quadrados, 
# deixe sem casas decimais
dfStoresInfo["metros_quadrado"] = round(dfStoresInfo["Size"] * 0.3048,0)

# g) Remova os valores negativos de vendas semanais Weekly_Sales do dataframe
# 'sales_info'
dfStoresSales = dfStoresSales[dfStoresSales["Weekly_Sales"] > 0]

# h) Agregue as informa??es de vendas no n?vel loja, ou seja, some por todos 
# os departamentos por loja e data. Atribua o conte?do no dataframe 'sales_info2'
sales_info2 = dfStoresSales.pivot_table(index=["Store", "Date"], aggfunc=sum, values="Weekly_Sales").reset_index()

# i) Traga as informa??es do dataframe 'date_info' no dataframe 'sales_info2'.
# Armazene o conte?do no dataframe 'df' e renomeie a coluna de vendas semanais
# para Sales_wkly

# as keys dos dataframes s?o: Store e Date
sales_info2 = sales_info2.merge(dfStoresSales, how = "left", on = ("Store", "Date"))

# j) Traga as informa??es do dataframe 'stores_info' no dataframe criado no 
# item anterior

# as keys dos dataframes s?o: Store
sales_info2 = sales_info2.merge(dfStoresInfo, how = "left", on = "Store")

# k) Extraia o dia da semana das datas e armazene na coluna 'Weekday'. Use
# de forma abreviada e em ingl?s
# COnvertendo a coluna Date de string -> date
# sales_info2["Date"] = pd.to_datetime(sales_info2["Date"])
sales_info2["weekday"] = sales_info2["Date"].dt.strftime("%a")

# l) Extraia o m?s da data e armazene na coluna 'Month'. Use de forma abrevia-
# da e em ingl?s
sales_info2["month"] = sales_info2["Date"].dt.strftime("%b")

# m) Salve o dataframe 'df' como um arquivo .csv. Nomeie como wallmart_sales
sales_info2.to_csv("01-Análise Exploratória de Dados-09-22/Aula 2/wallmart_sales.csv", index=False)

#--------------------------------------------------------------------------------#
#--------------------------------------------------------------------------------#
# FIM
#--------------------------------------------------------------------------------#
#--------------------------------------------------------------------------------#