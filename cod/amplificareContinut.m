function imgRedimensionata = amplificareContinut(img,factorScalare,metodaSelectareDrum,...
                        ploteazaDrum,culoareDrum)

    imgMare = imresize(img,factorScalare);
    
    difPixeliLatime = size(imgMare,2) - size(img,2);
    difPixeliInaltime = size(imgMare,1) - size(img,1);
     
    
    img2 = micsoreazaLatime(imgMare,difPixeliLatime,metodaSelectareDrum,...
                            ploteazaDrum,culoareDrum);
    imgInversa = imrotate(img2,-90);
    imgRedimensionataInversa = micsoreazaLatime(imgInversa,difPixeliInaltime,metodaSelectareDrum,...
                            ploteazaDrum,culoareDrum);
    imgRedimensionata = imrotate(imgRedimensionataInversa,90);                   
                        
end
