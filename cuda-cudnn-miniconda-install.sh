#############################   CUDA + cuDNN    ##################################
sudo yum update -y
sudo yum -y install wget git bzip2 perl gcc gcc-c++
curl -ujear:AP4MZbmtoefzLcEsoMJoVvdVqDD -O "http://10.202.115.197/artifactory/generic-local/cuda_10.0.130_410.48_linux.run"
chmod +x cuda_10.0.130_410.48_linux.run
sudo ./cuda_10.0.130_410.48_linux.run

############################# Log #############################
Do you accept the previously read EULA?
accept/decline/quit: accept 

Install NVIDIA Accelerated Graphics Driver for Linux-x86_64 410.48?
(y)es/(n)o/(q)uit: n

Install the CUDA 10.0 Toolkit?
(y)es/(n)o/(q)uit: y

Enter Toolkit Location
 [ default is /usr/local/cuda-10.0 ]: 

Do you want to install a symbolic link at /usr/local/cuda?
(y)es/(n)o/(q)uit: y

Install the CUDA 10.0 Samples?
(y)es/(n)o/(q)uit: y

Enter CUDA Samples Location
 [ default is /home/bluedata ]: 

Installing the CUDA Toolkit in /usr/local/cuda-10.0 ...

#############################

curl -ujear:AP4MZbmtoefzLcEsoMJoVvdVqDD -O "http://10.202.115.197/artifactory/generic-local/cudnn-10.0-linux-x64-v7.5.1.10.tgz"
sudo tar zxvf cudnn-10.0-linux-x64-v7.5.1.10.tgz
sudo cp cuda/include/cudnn.h /usr/local/cuda/include
sudo cp cuda/lib64/libcudnn* /usr/local/cuda/lib64
sudo chmod a+r /usr/local/cuda/include/cudnn.h /usr/local/cuda/lib64/libcudnn*

#############################   Miniconda    #####################################
wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh
# curl -ujear:AP4MZbmtoefzLcEsoMJoVvdVqDD -O "http://10.202.115.197/artifactory/Miniconda3-latest-Linux-x86_64.sh"
chmod +x Miniconda3-latest-Linux-x86_64.sh
bash Miniconda3-latest-Linux-x86_64.sh

echo $PYTHONPATH
export PYTHONPATH=""

sudo -i
echo "export PATH=\$PATH:/usr/local/cuda-10.0/bin" >> /etc/bashrc
echo "export LD_LIBRARY_PATH=/usr/local/cuda-10.0/lib64:/usr/local/cuda/extras/CUPTI/lib64" >> /etc/bashrc
echo "export CUDA_HOME=/usr/local/cuda" >> /etc/bashrc
exit

. /etc/bashrc

sudo yum install python-qt4 -y  # to solve libsm6 error

conda create -n py36 pip python=3.6
#source activate py36
conda activate py36

pip install --user --upgrade tensorflow-gpu
pip install --user --upgrade scikit-image
pip install --user --upgrade cython
pip install --user --upgrade pycocotools
pip install --user --upgrade imgaug
pip install --user --upgrade jupyter
pip install --user --upgrade keras

git clone https://github.com/matterport/Mask_RCNN.git
cd Mask_RCNN/


jupyter notebook  --no-browser  --allow-root --ip `hostname -i`   --port 8890

