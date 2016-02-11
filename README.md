This is the Image Algebra library for SAC (http://www.sac-home.org/):

Based on the mathematical model of Image Algebra (Ritter), implementing basic operations commonly used in image processing tasks. To be used as a backend for the Rathlin Project’s domain-specific language RIPL (http://rathlin.hw.ac.uk/).


To use it, run make in the ripl directory:
make

For this library, you need your SAC standard library built with the BMP module (it isn't by default). \n
Edit stdlib/configure and change ENABLE_SDL="no" to ENABLE_SDL="yes", then run configure and make again.
If you get the following message:
Cannot find library `libBMPTree.so' for module `BMP'
Your standard library was built without the BMP module. 


If you want any sac files outside the RIPL lib directory to use this library, you can compile them with

sac2c -L "/path/to/sac/ripl/lib" file.sac


To remove the lengthy compiler output in the terminal, compile with:

sac2c -v1 file.sac


Documentation available in

doc-mathematical_operations.txt : In set notation, similar to Image Algebra description
doc-functions.txt 				: A description of this library's functions and some other useful things for doing image processing in SAC.


Usage examples available in examples/.
