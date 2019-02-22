function imgRedimensionata = redimensioneazaImagine(img,parametri)
%redimensioneaza imaginea
%
%input: img - imaginea initiala
%       parametri - stuctura de defineste modul in care face redimensionarea 
%
% output: imgRedimensionata - imaginea redimensionata obtinuta


optiuneRedimensionare = parametri.optiuneRedimensionare;
metodaSelectareDrum = parametri.metodaSelectareDrum;
ploteazaDrum = parametri.ploteazaDrum;
culoareDrum = parametri.culoareDrum;

switch optiuneRedimensionare
    
    case 'micsoreazaLatime'
        numarPixeliLatime = parametri.numarPixeliLatime;
        imgRedimensionata = micsoreazaLatime(img,numarPixeliLatime,metodaSelectareDrum,...
                            ploteazaDrum,culoareDrum);
        
    case 'micsoreazaInaltime'
        numarPixeliInaltime = parametri.numarPixeliInaltime;
        imgInversa = imrotate(img,-90);
        imgRedimensionataInversa = micsoreazaLatime(imgInversa,numarPixeliInaltime,metodaSelectareDrum,...
                            ploteazaDrum,culoareDrum);
        imgRedimensionata = imrotate(imgRedimensionataInversa,90);     
        
    case 'maresteLatime'
        numarPixeliLatime = parametri.numarPixeliLatime;
        imgRedimensionata = maresteLatime(img,numarPixeliLatime,metodaSelectareDrum,...
                        ploteazaDrum,culoareDrum);
    case 'maresteInaltime'
        numarPixeliInaltime = parametri.numarPixeliInaltime;
        imgInversa = imrotate(img,-90);
        imgRedimensionataInversa = maresteLatime(imgInversa,numarPixeliInaltime,metodaSelectareDrum,...
                        ploteazaDrum,culoareDrum);
        imgRedimensionata = imrotate(imgRedimensionataInversa,90);                
    
    case 'amplificaContinut'
        factorScalare = parametri.factorScalare;
        imgRedimensionata = amplificareContinut(img,factorScalare ,metodaSelectareDrum,...
                        ploteazaDrum,culoareDrum);
    
    case 'eliminaObiect'
        imshow(img)
        rect = getrect();
        imgRedimensionata = eliminaObiect(img, rect,metodaSelectareDrum,...
                        ploteazaDrum,culoareDrum);
    
end