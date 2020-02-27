#!/bin/bash
#################################################################
# SCRIPT DOWNLOAD TAXI DATA AS SAMPLE (100 records) VIA wget 
#################################################################


MONTH_ORDINALS=("01" "02" "03" "04" "05" "06" "07" "08" "09" "10" "11" "12")
YEAR_ORDINALS=("2009" "2010" "2011" "2012" "2013" "2014" "2015" "2016") 
CAB_TYPES=("yellow")

export srcDataDirRoot=data/staging/transactional-data/yellow-taxi


urls=("https://s3.amazonaws.com/nyc-tlc/trip+data/yellow_tripdata_2017-07.csv"
      "https://s3.amazonaws.com/nyc-tlc/trip+data/yellow_tripdata_2017-08.csv"
      "https://s3.amazonaws.com/nyc-tlc/trip+data/yellow_tripdata_2017-09.csv")

for url in ${urls[@]}; 
do 
    echo $url
    filename="`echo $url | sed 's/trip+data/ /g' |  awk '{print $2 }'`"
    echo $filename
    #echo $srcDataDirRoot$filename
    wget $url -qO - | head -100  >> $srcDataDirRoot$filename
done 
