#!/bin/bash
compression_level=90
compression_method=jpegxl
output_file="$compression_method""_""$compression_level"
dir="$output_file""_""output"
echo "$dir"
mkdir -p $dir
for i in *.ppm;
  do name=`echo "$i" | cut -d'.' -f1`
  echo "$name"
  jpegxl/cjxl -q $compression_level "low_res/$i" "${output_file}_output/${name}.jxl"
done

echo "name,height,width,file_size(kb),method,compression_level" > ${output_file}.csv
for i in "$output_file"_output/*.jxl;
  do name=`echo "$i" | cut -d'.' -f1 | cut -d'/' -f2`
  echo "$name"

  ## get width and heigh from png
  png="low_res/${name}.png"
  echo $png
  W=`file $png | cut -f 2 -d "," | sed s/x.*//` #width
  H=`file $png | cut -f 2 -d "," | sed s/.*x//` #height

  echo $W
  echo $H
  ####
  file_size_kb=`du -k "$i" | cut -f1` #filesize
  
  echo $file_size_kb
  echo "$name,$H,$W,$file_size_kb,$compression_method,$compression_level" >> ${output_file}.csv
  djxl_output= jpegxl/djxl "$i" "${output_file}_output/${name}_dec.jpeg"
done