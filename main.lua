LARGURATELA = 320 --tamanhos da tela
ALTURATELA = 480


MAXMETEOROS = 12

FIM = false
meteoros_atingidos = 0

aviao = { -- tabela propria para o aviao, onde pode guardar a imagem que sera usada
    src = "imagens/14bis.png",
    largura = 55,
    altura = 63,
    x = LARGURATELA/2 - 64/2, --centralizando
    y = ALTURATELA - 64/2,
    tiros = {}
}

function datiro()
    local tiro = {
        x = aviao.x + aviao.largura/2,
        y = aviao.y,
        largura = 16,
        altura = 16
    }
    table.insert(aviao.tiros, tiro)
end

function movetiros()
    for i = #aviao.tiros,1 ,-1 do
        if aviao.tiros[i].y > 0 then -- se ele nao chegou no topo
            aviao.tiros[i].y = aviao.tiros[i].y -1
        else
           table.remove(aviao.tiros, i) 
        end
    end 
end 

function colisao(x1, y1, l1, a1, x2, y2, l2, a2)
    return x2 < x1 + l1 and  -- se uma retorna falso, então não vai existir colisão
            x1 < x2 + l2 and
            y1 < y2 + a2 and
            y2 < y1 + a1

end

meteoros = {}

function moveAviao()
    if love.keyboard.isDown('w') then
        aviao.y = aviao.y-1
   end
   if love.keyboard.isDown('s') then
        aviao.y = aviao.y+1
   end
    if love.keyboard.isDown('a') then
        aviao.x =aviao.x-1
   end
   if love.keyboard.isDown('d') then
        aviao.x = aviao.x+1
   end
end

function destroiaviao()
    aviao.src  = "imagens/explosao_nave.png"
    aviao.imagem = love.graphics.newImage(aviao.src)
    aviao.largura = 67
    aviao.altura = 77
end

function checacolisaocomaviao()
    for k, meteoro in pairs(meteoros) do
        if colisao(meteoro.x, meteoro.y, meteoro.largura, meteoro.altura, aviao.x, aviao.y, aviao.largura, aviao.altura) then
            destroiaviao()
            FIM = true
        end
    end
end

function checacolisaocomtiros()
    for i = #aviao.tiros, 1, -1 do
        for j = #meteoros, 1, -1 do
            if colisao( aviao.tiros[i].x, aviao.tiros[i].y, aviao.tiros[i].largura, aviao.tiros[i].altura, meteoros[j].x, meteoros[j].y, meteoros[j].largura, meteoros[j].altura) then
                meteoros_atingidos = meteoros_atingidos +1
                table.remove(aviao.tiros, i)
                table.remove(meteoros, j)
                break
            end
        end
    end
end

function checaobjetivo()
    if meteoros_atingidos >= 10   then
        VENCEDOR = true
    end
end

function checacolisao()
    checacolisaocomaviao()
    checacolisaocomtiros()

end

function criameteoro()
    meteoro = {
        x = math.random(LARGURATELA),
        y = -20,
        largura = 50,
        altura = 44,
        peso = math.random(3),
        deslocamento_horizontal = math.random(-1, 1)
    }
    table.insert(meteoros, meteoro)
end



function movemeteoros()
    for k, meteoro in pairs(meteoros) do
        meteoro.y = meteoro.y + meteoro.peso * 0.05  -- o 0.20 Reduz a velocidade vertical
    meteoro.x = meteoro.x + meteoro.deslocamento_horizontal * 0.05  -- Reduz o deslocamento horizontal
    end
end


function removemeteoros()
    for i = #meteoros, 1, -1 do  --faz a contagem de tras para frente 
        if meteoros[i].y > ALTURATELA then
            table.remove(meteoros, i)
        end
    end    
end



 
function love.load()
    love.window.setMode(LARGURATELA, ALTURATELA, {resizable = false})
    love.window.setTitle("14 bis vs meteoros")

    background = love.graphics.newImage("imagens/background.png")
    gameover_img = love.graphics.newImage("imagens/gameover.png")
   

    aviao.imagem = love.graphics.newImage(aviao.src)
    meteoro_img = love.graphics.newImage("imagens/meteoro.png")
    tiro_img = love.graphics.newImage("imagens/tiro.png")
    vencedor_img = love.graphics.newImage("imagens/vencedor.png")


end


function love.update(dt)
    if not FIM then
        if love.keyboard.isDown('w','a', 's', 'd') then
        moveAviao()
        end

        removemeteoros()

        if #meteoros < MAXMETEOROS then
            criameteoro()
        end
    
    
    movemeteoros()
    movetiros()
    checacolisao()
    checaobjetivo()
    end


end

function love.keypressed(tecla)
    if tecla == "escape" then
        love.event.quit()
    elseif tecla == "space" then
        datiro()
    end
end

function love.draw()

    love.graphics.draw(background, 0,0)
    love.graphics.draw(aviao.imagem, aviao.x, aviao.y)

    love.graphics.print("Meteoros restantes "..10-meteoros_atingidos, 0, 0)


    for k, meteoro in pairs(meteoros) do
        love.graphics.draw(meteoro_img, meteoro.x, meteoro.y)
    end

    for k, tiro in pairs(aviao.tiros) do
        love.graphics.draw(tiro_img, tiro.x, tiro.y)
    end

    if FIM then
        love.graphics.draw(gameover_img, LARGURATELA/2 -204/2, ALTURATELA/2 -148/2)
    end

    if VENCEDOR then
        love.graphics.draw(vencedor_img, LARGURATELA/2 -204/2, ALTURATELA/2 -148/2)

    end

end


