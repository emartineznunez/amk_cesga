#!/bin/bash
#Installing automekin
module load ase
rm -rf AutoMeKin
git clone https://github.com/emartineznunez/AutoMeKin.git 
cd AutoMeKin
autoreconf -i
./configure
make 
make install
#Changing module name
cp $HOME/amk-2021/modules/amk/2021 $HOME/amk-2021/modules/amk/2021local
#PATCH for FT-III
sed -i 's@srun -N1@srun --exclusive -N1@g;s@corespertask --cpu_bind=none@corespertask@g' $HOME/amk-2021/bin/utils.sh
#Installing amk_tools
cd $HOME
rm -rf amk_tools
git clone https://github.com/dgarayr/amk_tools.git
cd amk_tools
pip install -e .
wget -r https://raw.githubusercontent.com/emartineznunez/amk_cesga/main/install_automekin/modules/ .
