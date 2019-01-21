% Used to rebin datasets into larger bins.

function ReBin(inputfile,outputfile,binsperbin)
    w=dlmread(inputfile,'',2,0);
    t=w(:,1);
    I=w(:,2);
    n=ceil(length(t)/binsperbin);
    t2=zeros(n+1,1);
    I2=zeros(n+1,1);
    for(j=1:length(t))
        x=ceil(j/binsperbin)+1;
        I2(x)=I2(x)+I(j)/binsperbin;
    end
    for(k=1:length(t2))
        t2(k+1)=k*binsperbin*t(1);
    end
    newArray=zeros(n+1,2);
    newArray(:,1)=t2;
    newArray(:,2)=I2;
    csvwrite(outputfile,newArray);
end
