%aqui tem a parte de criação dos elementos, que no código já tem alguns
image = imread('mdb010.bmp');
[linha, coluna] = size(image);

h = fspecial('gaussian');
image = imfilter(image,h);

maximo = 0;
alpha = 4; %parâmetro de espalhamento do numero fuzzy
W = 7; %tamanho da vizinhança
T = 0.7; %threshold

matriz_pertinencia = zeros(linha, coluna);
imgFinal = zeros(linha, coluna);
row=linha;
col=coluna;
for r =((W+1)/2):(row-((W-1)/2))
        for c =((W+1)/2):(col-((W-1)/2))
            soma = 0;
            for posx=-((W-1)/2):((W-1)/2)
                for posy=-((W-1)/2):((W-1)/2)
                   a = image(r+posx,c+posy);
                   temp = 1-(double(abs(a-image(r,c)))/alpha);
                   soma = soma + max(0,temp) ;
                   
                end
            end
            matriz_pertinencia(r,c) = (soma-1)/((W^2)-1);    
            
            if matriz_pertinencia(r,c)<=T
                imgFinal(r,c)=1;
            end
        end
    end

imshow(imgFinal);
