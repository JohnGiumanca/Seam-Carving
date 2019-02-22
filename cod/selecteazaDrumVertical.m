function d = selecteazaDrumVertical(E,metodaSelectareDrum)
%selecteaza drumul vertical ce minimizeaza functia cost calculate pe baza lui E
%
%input: E - energia la fiecare pixel calculata pe baza gradientului
%       metodaSelectareDrum - specifica metoda aleasa pentru selectarea drumului. Valori posibile:
%                           'aleator' - alege un drum aleator
%                           'greedy' - alege un drum utilizand metoda Greedy
%                           'programareDinamica' - alege un drum folosind metoda Programarii Dinamice
%
%output: d - drumul vertical ales

d = zeros(size(E,1),2);

switch metodaSelectareDrum
    case 'aleator'
        %pentru linia 1 alegem primul pixel in mod aleator
        linia = 1;
        %coloana o alegem intre 1 si size(E,2)
        coloana = randi(size(E,2));
        %punem in d linia si coloana coresponzatoare pixelului
        d(1,:) = [linia coloana];
        for i = 2:size(d,1)
            %alege urmatorul pixel pe baza vecinilor
            %linia este i
            linia = i;
            %coloana depinde de coloana pixelului anterior
            if d(i-1,2) == 1%pixelul este localizat la marginea din stanga
                %doua optiuni
                optiune = randi(2)-1;%genereaza 0 sau 1 cu probabilitati egale 
            elseif d(i-1,2) == size(E,2)%pixelul este la marginea din dreapta
                %doua optiuni
                optiune = randi(2) - 2; %genereaza -1 sau 0
            else
                optiune = randi(3)-2; % genereaza -1, 0 sau 1
            end
            coloana = d(i-1,2) + optiune;%adun -1 sau 0 sau 1: 
                                         % merg la stanga, dreapta sau stau pe loc
            d(i,:) = [linia coloana];
        end
    case 'greedy'
        %completati aici codul vostru
        
         linia = 1;
         [valoareaMinima coloana] = min(E(1,:));
         d(1,:) = [linia coloana];
         
         for i = 2:size(d,1)
             linia = i;
             coloanaAnterioara = d(i-1,2);
             
             if coloanaAnterioara == 1 
                 x = 0;
                 y = 1;
             elseif coloanaAnterioara == size(E,1)
                     x = 1;
                     y = 0;
                 else
                     x = 1;
                     y = 1;
             end
                 
             minim = min(E(i,coloanaAnterioara-x:coloanaAnterioara+y));
             if minim == E(i,coloanaAnterioara-x)
                 coloana = coloanaAnterioara-x;
             elseif minim == E(i,coloanaAnterioara)
                 coloana = coloanaAnterioara;
             else
                 coloana = coloanaAnterioara+y;
             end
             d(i,:) = [linia coloana];
         end
        
        
    case 'programareDinamica'
        matriceCosturi = zeros(size(E));
        
        matriceCosturi(1,:) = E(1,:);
          
        for i = 2: size(matriceCosturi,1)
            for j = 1: size(matriceCosturi,2)
                
                if j == 1
                    matriceCosturi(i,j) = min(matriceCosturi(i-1,j:j+1)) + E(i,j);
                elseif j == size(matriceCosturi,2)
                    matriceCosturi(i,j) = min(matriceCosturi(i-1,j-1:j)) + E(i,j);
                    else
                        matriceCosturi(i,j) = min(matriceCosturi(i-1,j-1:j+1)) + E(i,j);
                    
                end
            end
        end
        
        linia = size(matriceCosturi,1);
        [valoareaMinima coloana] = min(matriceCosturi(size(E,1),:));
        d(linia,:) = [linia coloana];
        
        for i = size(E,1)-1: -1: 1
            linia = i;
            coloanaAnterioara = d(i+1,2);
            
            if coloanaAnterioara == 1 
                 x = 0;
                 y = 1;
             elseif coloanaAnterioara == size(E,2)
                     x = 1;
                     y = 0;
                 else
                     x = 1;
                     y = 1;
             end
                 
             minim = min(matriceCosturi(i,coloanaAnterioara-x:coloanaAnterioara+y));
             if minim == matriceCosturi(i,coloanaAnterioara-x)
                 coloana = coloanaAnterioara-x;
             elseif minim == matriceCosturi(i,coloanaAnterioara)
                 coloana = coloanaAnterioara;
             else
                 coloana = coloanaAnterioara+y;
             end
             d(i,:) = [linia coloana];
         
        end
        
                
        
        
    otherwise
        error('Optiune pentru metodaSelectareDrum invalida');
end

end