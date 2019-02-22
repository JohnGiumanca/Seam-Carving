function img1 = adaugaDrumVertical(img,drum,E)
    

    img1 = zeros(size(img,1),size(img,2)+1,size(img,3),'uint8');
    

    for i=1:size(img1,1)
            coloana = drum(i,2);
            %copiem partea din stanga
            img1(i,1:coloana-1,:) = img(i,1:coloana-1,:);
            %copiem partea din dreapta
            img1(i,coloana+2:end,:) = img(i,coloana+1:end,:);
            %adaugam 2 pixeli apropiati in locul pixelului sters
            img1(i,coloana,:) = (double(img(i,coloana,:))+double(img(i,coloana-1,:)))/2;
            img1(i,coloana+1,:) = (double(img(i,coloana,:))+double(img(i,coloana+1,:)))/2;
            
            
            
    end
end