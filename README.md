# Local installation of AutoMeKin in FT-III

Here is the recipe to install AutoMeKin in FT-III:


- Clone the repo:
   ```
   git clone https://github.com/emartineznunez/amk_cesga.git
   ```
- Go to the directory where the installation script resides:
  ```
  cd amk_cesga/install_automekin
  ```
- Give appropriate permissions to `install.sh`:
  ```
  chmod +x install.sh
  ```
- Run the script to install `AutoMekin` and `amk_tools` in your account:
  ```
  ./install.sh
  ```
- Provided `AutoMeKin` and `amk_tools` are installed under `$HOME`, the following two lines should be added to your `.bashrc`:
  ```
  module use $HOME/amk-2021/modules
  module use $HOME/amk_tools/modules
  ```
- If you want to run a simple test with `AutoMeKin`, just load the local module:
  ```
  module load amk/local
  ```
- To use the Slurm job scheduler, your basic script of the low-level calculations should look something like this (change the parameters appropriately):
  ```
  #!/bin/bash
  ntasks=20
  niter=2
  filename=FA
  module load amk/local
  sbatch --output=llcalcs.log --error=llcalcs.err -n $ntasks --mem-per-cpu=2G -t 00:10:00 llcalcs.sh ${filename}.dat $ntasks $niter
  ```
- Likewise, the basic script for the high-level calculations should look like this:
  ```
  #!/bin/bash
  ntasks=8
  ncores=4
  filename=FA
  module load amk/local
  module load g16
  sbatch --output=hlcalcs.log --error=hlcalcs.err -n $ntasks -c $ncores --mem-per-cpu=2G -t 00:30:00 hlcalcs.sh ${filename}.dat
  ```
- For the analysis of the results, you may want o use `amk_tools`:
  ```
  module load amk_tools/local
  ```
