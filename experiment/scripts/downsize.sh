
for i in *.ppm;
  do name=`echo "$i" | cut -d'.' -f1`
  echo "$name"
  ffmpeg -i "$i" -vf "scale='min(1280,iw)':-1"  "low_res/${name}.ppm"
done


