imageFolder=cd('C:\Users\Mahira\Desktop\slike');

%ucitavanje slike
slika=imread('pexels-photo-3123914.jpeg');

%pretvaranje slike u sivo
slika_sivo=rgb2gray(slika);

%konvertovanje slike u double
slika_double=double(slika_sivo);

%razmatra se samo jedan dio od cijele slike, matrica pixela 3x3 zbog maski,
%pa petlja ne ide do cijele duzine
for i=1:size(slika_double,1)-2
    for j=1:size(slika_double,2)-2
        
        %X komponenta za Sobel masku: razlika prvog i treceg reda
        Gx=((slika_double(i+2,j)+2*slika_double(i+2,j+1)+slika_double(i+2,j+2))-(slika_double(i,j)+2*slika_double(i,j+1)+slika_double(i,j+2)));
      
        %Y komponenta za Sobel masku: razlika prve i trece kolone
        Gy=((slika_double(i,j+2)+2*slika_double(i+1,j+2)+slika_double(i+2,j+2))-(slika_double(i,j)+2*slika_double(i+1,j)+slika_double(i+2,j)));
     
        %racunanje gradijenta slike
        slika_sivo(i,j)=sqrt(Gx.^2+Gy.^2);
    end
end
figure, imshow(slika); title('Originalna slika');
figure,imshow(slika_sivo); title('Slika nakon primjene Sobelovog gradijenta');

%podesiti parametar threshold
thresh=85;
slika_sivo=max(slika_sivo,thresh);

%ivice se boje u crno
slika_sivo(slika_sivo==thresh)=0;

%komplement slike daje konacan rezultat
figure,imshow(~slika_sivo);title('Sobel edge detection');



