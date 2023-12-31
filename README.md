# Image-compression-benchmark
A repo to benchmark JPEG, JPEG-XL, and AVIF Image compression performance comparison in commercial use

# Results
Agressive compression scenario
![Alt text](experiment/results/low_BPP_results/all.png)
Moderate compression scenario
![Alt text](experiment/results/medium_BPP_results/all.png)
Agressive compression scenario
![Alt text](experiment/results/high_bpp_results/all.png)


# Python 
**Setup** (with Anaconda3):
```
conda create -n env numpy matplotlib
conda activate env
conda install -c conda-forge opencv
conda install -c conda-forge kornia
conda install -c conda-forge pytorch
```

**Usage:**
First, download the RGB 8bits dataset from http://imagecompression.info/test_images/

```
cd experiments
### downsize the original dataset to 1 megapixels
bash scripts/downsize.sh
### run the scripts
bash scripts/run_cjpeg.sh
bash scripts/run_jpegxl.sh
bash scripts/run_avif.sh
### save results to "results/"
### run the code in pic_code_analysis.ipynb for results analysis
```
**Plotted Results analysis:**
```
pic_code_analysis.ipynb
```

# Citation
[1]  http://imagecompression.info/lossy/

[2] https://github.com/libjxl/libjxl

[3] https://github.com/AOMediaCodec/libavif

[4] https://github.com/NVlabs/flip
