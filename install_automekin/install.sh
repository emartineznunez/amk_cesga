#!/bin/bash
#Installing automekin
cwd=$PWD
module load ase
rm -rf AutoMeKin
git clone https://github.com/emartineznunez/AutoMeKin.git 
cd AutoMeKin
autoreconf -i
./configure
make 
make install
#Changing module name
sed 's@#module load g09@module load ase gcccore/system@' $HOME/amk-2021/modules/amk/2021 > $HOME/amk-2021/modules/amk/local
#PATCH for FT-III (no path is needed any more)
#sed -i 's@srun -N1@srun --exclusive -N1@g;s@corespertask --cpu_bind=none@corespertask@g' $HOME/amk-2021/bin/utils.sh
#Installing amk_tools
cd $HOME
rm -rf amk_tools
git clone https://github.com/dgarayr/amk_tools.git
cd amk_tools
pip install -e .
cp -r ${cwd}/modules .
rm -rf $HOME/amk-2021/modules/amk/2021*
