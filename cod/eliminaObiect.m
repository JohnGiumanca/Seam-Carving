function imagineModificata = eliminaObiect(img,rect,metodaSelectareDrum,...
                        ploteazaDrum,culoareDrum)
    
    E = calculeazaEnergie(img);  
%     [xmin ymin width height] = rect;
    w = round(rect(3));
    h = round(rect(4));
    i1 = round(rect(2));
    i2 = round(i1 + h);
    j1 = round(rect(1));
    j2 = round(j1 + w);
    
    if h>w 
        img = imrotate(img,-90);
    end

    for i = 1:w

        disp(['Eliminam drumul vertical numarul ' num2str(i) ...
            ' dintr-un total de ' num2str(w)]);

        %calculeaza energia dupa ecuatia (1) din articol
        E = calculeazaEnergie(img);
        E(i1:(i2-i+1), j1:j2) = -10000;

        drum1 = selecteazaDrumVertical(E(1:i1,:),metodaSelectareDrum);
        drum1(i1,:) = [];
        drum2 = [i1:(i1+h-1); j1*ones(1,h)]';
        drum3 = selecteazaDrumVertical(E(i1:end,:),metodaSelectareDrum);
        drum3(1:h,:) = [];
        drum3(:,1) = drum3(:,1) + i1-1;
        drum = [drum1;drum2;drum3];

%             drum = selecteazaDrumVertical(E,metodaSelectareDrum);
        %afiseaza drum
        if ploteazaDrum
            ploteazaDrumVertical(img,E,drum,culoareDrum);
            pause(1);
            close(gcf);
        end

        %elimina drumul din imagine
        img = eliminaDrumVertical(img,drum);

    end

    if h>w 
        img = imrotate(img,90);
    end
    
    imagineModificata = img;
    
end