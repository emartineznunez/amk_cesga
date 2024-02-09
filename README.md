# Local installation of AutoMeKin in FT-III

The scripts in the folder install_automekin will show you how to install AutoMeKin in FT-III:


- Clone the repo:
   ```
   git clone https://github.com/emartineznunez/amk_cesga.git
   ```
- Go to the install dir:
  ```
  cd amk_cesga/install_automekin
  ```
- Executable permission:
  ```
  chmod +x install.sh
  ```
- Install AutoMekin and amk_tools:
  ```
  ./install.sh
  ```
- If you installed `AutoMeKin` and `amk_tools` under `$HOME` the following two lines should be added to your `.bashrc`:
  ```
  module use $HOME/amk-2021/modules
  module use $HOME/amk_tools/modules
  ```
- Finally, to run `AutoMeKin`, just load the local module:
  ```
  module load amk/local
  ```
- Likewise, for `amk_tools`, just type:
  ```
  module load amk_tools/local
  ```
 

