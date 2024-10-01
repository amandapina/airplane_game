# airplane_game

*14 Bis vs Meteoros
Este é um jogo simples feito em Lua usando o framework LÖVE. O objetivo é controlar o avião 14 Bis, desviar de meteoros e destruí-los com tiros. O jogo termina quando o avião é destruído ou quando 10 meteoros são atingidos.

Pré-requisitos
Para rodar o jogo, você precisará do seguinte:

LÖVE 2D: O framework de desenvolvimento de jogos 2D. Você pode baixar a versão mais recente no site oficial:
Download LÖVE
Arquivos do jogo:
O código-fonte em Lua (main.lua).
As imagens do jogo:
imagens/14bis.png
imagens/background.png
imagens/gameover.png
imagens/meteoro.png
imagens/tiro.png
imagens/vencedor.png
imagens/explosao_nave.png
Como rodar o jogo
Siga os passos abaixo para rodar o jogo:

1. Instale o LÖVE 2D
Se você ainda não tem o LÖVE instalado, baixe e instale o framework para o seu sistema operacional:

Windows: Baixe e instale o executável do site oficial do LÖVE.
Linux: Instale via terminal (distribuições baseadas no Ubuntu/Debian):

sudo apt-get install love
macOS: Baixe e arraste o LÖVE para sua pasta de Aplicativos.


2. Estrutura de Arquivos
Coloque o arquivo main.lua e todas as imagens em uma pasta com a seguinte estrutura:

/minha_pasta_do_jogo
    /imagens
        14bis.png
        background.png
        gameover.png
        meteoro.png
        tiro.png
        vencedor.png
        explosao_nave.png
    main.lua


3. Executando o Jogo
Agora, você pode rodar o jogo de duas formas:

Windows/macOS:
Arraste a pasta do jogo (que contém o main.lua e a pasta imagens/) para o ícone do LÖVE.
Ou, via terminal:

love /caminho/para/a/pasta/do/jogo

Linux:
No terminal, navegue até a pasta onde o código está salvo e execute:

love .


4. Controles do Jogo
Teclas de movimentação:
Use as teclas W, A, S, D para mover o avião:

W: Move para cima
A: Move para a esquerda
S: Move para baixo
D: Move para a direita
Atirar:
Pressione Espaço para disparar tiros.

Sair do Jogo:
Pressione ESC para fechar o jogo.

Objetivo do Jogo
Desvie dos meteoros e destrua 10 deles para vencer.
Se um meteoro colidir com o avião, o jogo termina.
