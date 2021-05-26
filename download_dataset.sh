#! /bin/bash

function download_from_gdrive(){
    local file_id=$1
    local file_name=$2
    curl -sc /tmp/cookie "https://drive.google.com/uc?export=download&id=${file_id}" > /dev/null
    code="$(awk '/_warning_/ {print $NF}' /tmp/cookie)"
    curl -Lb /tmp/cookie "https://drive.google.com/uc?export=download&confirm=${code}&id=${file_id}" -o ${file_name}
}

download_from_gdrive "1EKMk3Eo3sGoN7N8rZcv98LjyTueMoy-A" "MultipleMovingBoxLinear.zip"
download_from_gdrive "1QX-ZXkrM0mjbimzlBAuz8aknP5yuhNuI" "MovingBoxLinear.zip"