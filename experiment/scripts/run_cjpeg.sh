#!/bin/bash
compression_level=90
compression_method=jpeg6b
output_file="$compression_method""_""$compression_level"
dir="$output_file""_""output"
echo "$dir"
mkdir -p $dir
for i in *.ppm;
  do name=`echo "$i" | cut -d'.' -f1`
  echo "$name"
  cjpeg -quality $compression_level "low_res/$i" "${dir}/${name}_dec.jpeg"
done

echo "name,height,width,file_size(kb),method,compression_level" > ${output_file}.csv
for i in "$output_file"_output/*.jpeg;
  do name=`echo "$i" | cut -d'.' -f1 | cut -d'/' -f2`
  echo "$name"
  W=`file $i | cut -f 8 -d "," | sed s/x.*//` #width
  H=`file $i | cut -f 8 -d "," | sed s/.*x//` #height
  file_size_kb=`du -k "$i" | cut -f1` #filesize
  echo $W
  echo $H
  echo $file_size_kb
  echo "$name,$H,$W,$file_size_kb,$compression_method,$compression_level" >> ${output_file}.csv
  # formual from https://www.tutorialspoint.com/dip/concept_of_bits_per_pixel.htm
  # bpp= $(($file_size_kb * 1024 * 8 / ($W * $H)))
  # echo "$(($file_size_kb * 1024 * 8 / ($W * $H)))" | bc
  # echo "scale=2; $file_size_kb * 1024 * 8 / ($W * $H)" | bc
  # djpeg "$i" "${dir}/${name}_dec.png"
done