#! /bin/bash

set -x


for i in MCC-INPUTS.tgz ;
do 
    if [ ! -f $i ] ; then 
	wget --progress=dot:mega http://mcc.lip6.fr/2017/archives/$i
    fi
    tar xzf $i
    rm -f $i
done
mv BenchKit/INPUTS/* ./INPUTS/
\rm -r BenchKit

mkdir test
cd test
cp ../scalar.tgz .
tar xzf scalar.tgz
cd ../INPUTS
for i in $(ls -1 ../test/scalar); do
    if [ -f $i.tgz ] ;
    then
	tar xzf $i.tgz && cp ../test/scalar/$i/* $i/ && \rm $i.tgz && tar czf $i.tgz $i/ && rm -rf $i/ ;
    fi
done

cd ..
\rm -rf scalar/    


