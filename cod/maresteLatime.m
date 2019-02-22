function img = maresteLatime(img,numarPixeliLatime,metodaSelectareDrum, ploteazaDrum,culoareDrum)

%input: img - imaginea initiala
%       numarPixeliLatime - specifica numarul de drumuri de sus in jos adaugate
%       metodaSelectareDrum - specifica metoda aleasa pentru selectarea drumului. Valori posibile:
%                           'aleator' - alege un drum aleator
%                           'greedy' - alege un drum utilizand metoda Greedy
%                           'programareDinamica' - alege un drum folosind metoda Programarii Dinamice
%       ploteazaDrum - specifica daca se ploteaza drumul gasit la fiecare pas. Valori posibile:
%                    0 - nu se ploteaza
%                    1 - se ploteaza
%       culoareDrum  - specifica culoarea cu care se vor plota pixelii din drum. Valori posibile:
%                    [r g b]' - triplete RGB (e.g [255 0 0]' - rosu)          
%                           
% output: img - imaginea redimensionata obtinuta prin adaugarea drumurilor

imgCopie = img;
drumuri = zeros(size(img,1), 2, numarPixeliLatime);

for i = 1:numarPixeliLatime  
    disp(['Salveaza drumul vertical numarul ' num2str(i) ...
        ' dintr-un total de ' num2str(numarPixeliLatime)]);
    E = calculeazaEnergie(imgCopie);
    drum = selecteazaDrumVertical(E,metodaSelectareDrum);
    drumuri(:,:,i) = drum;
    imgCopie = eliminaDrumVertical(imgCopie,drum);
    
end

for i = 1:numarPixeliLatime
    
    disp(['Adauga drumul vertical numarul ' num2str(i) ...
        ' dintr-un total de ' num2str(numarPixeliLatime)]);
    
    
    %alege drumul vertical din vectorul de drumuri
    drum = drumuri(:,:,i);
    
    %afiseaza drum
    if ploteazaDrum
        ploteazaDrumVertical(img,E,drum,culoareDrum);
        pause(1);
        close(gcf);
    end
    
    %elimina drumul din imagine
    img = adaugaDrumVertical(img,drum);
    
    for j = i:numarPixeliLatime
        if drumuri(size(img,1),2,j) > drum(size(img,1),2)
            drumuri(:,2,j) = drumuri(:,2,j) + 1;
        end
    end

end