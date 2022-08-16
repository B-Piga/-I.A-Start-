-- cria o grafo na memória com os vértices e as arestas
local arestas = {
[1] = {2},
[2] = {1,3},
[3] = {2,4,5},
[4] = {3,5,6},
[5] = {3,4,6},
[6] = {4,5,7},
[7] = {6,8,9},
[8] = {7},
[9] = {7},
}
-- define qual sera o início
local inicial = 3

-- vetores auxiliares
local fila = {}
local visitados = {}


-- # significa quantidade
for i=1, #arestas, 1 do
  visitados[i] = false
end -- é o fim? SIM


-- insere o inicial na fila
table.insert(fila, inicial)
-- define o inicial como já visitado
visitados[inicial] = 0 

-- enquanto houver vertices na fila vai continuar

while (#fila > 0) do
-- define o vertice atual e exibe na tela
  local verticeAtual = fila[1]
  io.write("Atual: ", verticeAtual,"\n")

  -- PASSA POR TODAS AS CONEXOES DO VERTICE ATUAL
  for i=1, #arestas[verticeAtual], 1 do
   -- define o vizinho atual
    local vizinho = arestas[verticeAtual][i]
   -- verifica se o vizinho já foi visitado, cso sim ignora
    if visitados[vizinho] == false then
    --caso não, insere ele na fila
        table.insert(fila, vizinho)
      -- adiciona a distancia do vertice e insere nos visitados
        visitados[vizinho] = visitados[verticeAtual] + 1
    end
  end
  -- remove o atual da fila
  table.remove(fila, 1)

  -- EXIBE A FILA NA TELA
  io.write("Fila: ")
  for i=1, #fila, 1 do
    io.write(fila[i], " | ")
  end
  io.write("\n\n") -- voces não prestam pra nada, cambada de lixo
  
end 

-- exibe o resultado final
print('Resultado: ')
for i=1, #visitados, 1 do
   print("[", i, "] -> ", visitados[i])
end
--o
-- como q eu 