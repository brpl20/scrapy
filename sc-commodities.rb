require 'open-uri'
require 'byebug'
require 'json'

# Todo 
# 1. Corrigir cotacao de soja e milho  
    # Multiplicar o valor da soja para o saco de 60 Kg 
    # A soja e o milho usam bushels nos eua 
    # https://pt.wikipedia.org/wiki/Bushel 
    # Aqui a cotacao funciona assim, a cada um dolar eu consigo comprar quantos bushels? 
    # Assim, temos que fazer o calculo invertido
    # Para eu comprar um bushel, quantos dolares eu preciso? 
    # Depois, converter libras em kilogramas 
    # Calcular o peso do bushels 
    # Multiplicar por Kg 
    # E usar a medida de real para saber  

# 2. usar um banco de dados 
    # para armazenar as informacoes diariamente 

# 3. Usar emojis para indicar se o preco subiu ou diminuiu em relacao ao dia anterior

# 4. Adicionar barril de petroleo 

# 5. Adicionar Bitcoin 

# 6. Como fazer com as cotacoes do Brasil ? 
    # onde encontrar informacao de convianca 

# 7. Ver um metodo interessante para entregar essas informacoes

# 8. Adicionar bolsa de valores 

# 9. Adicionar empresas de interesse 

def request
    link = "https://commodities-api.com/api/latest?access_key=jb6u531nb3qechk5e61ba6l1j6lv7r308ow9ugy33o7sljn68e8c8h0l6x45"
    doc = URI.open(link)
    json = JSON.parse(doc.string);
    corn =  json["data"]["rates"]["CORN"]
    soy = json["data"]["rates"]["SOYBEAN"] 
    real = json["data"]["rates"]["BRL"]
    euro = json["data"]["rates"]["EUR"]

    puts "Soja => #{soy.round(2)}"
    puts "Milho => #{corn.round(2)}"
    puts "Dolar => #{real.round(2)}"
    puts "Euro => #{euro.round(2)}"
    
    byebug

end 

request