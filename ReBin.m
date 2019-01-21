% Used to rebin datasets into larger bins.
% inputfile and outputfile are file name strings
% binsperbin is the number of bins to be shrunk into a single bin
% skiplines is the number of header lines at the top of the file that need to be ignored.

function ReBin(inputfile,outputfile,binsperbin,skiplines)
% ADDME Rebins datasets
% 
% ReBin(Input file string,Output file string,Old bins per new bin,Header ines to skip)
    w=dlmread(inputfile,'',skiplines,0);
    t=w(:,1);
    I=w(:,2);
    n=ceil(length(t)/binsperbin);
    t2=zeros(n+1,1);
    I2=zeros(n+1,1);
    for(j=1:length(t))
        x=ceil(j/binsperbin)+1;
        I2(x)=I2(x)+I(j)/binsperbin;
    end
    for(k=1:(length(t2)-1))
        t2(k+1)=k*binsperbin*t(1);
    end
    newArray=zeros(n+1,2);
    newArray(:,1)=t2;
    newArray(:,2)=I2;
    csvwrite(outputfile,newArray);
end
