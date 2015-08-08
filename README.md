This is the Image Algebra library for SAC (http://www.sac-home.org/):

Based on the mathematical model of Image Algebra (Ritter), implementing basic operations commonly used in image processing tasks. To be used as a backend for the Rathlin Project’s domain-specific language RIPL (http://rathlin.hw.ac.uk/).

To use it, run make in the ripl directory:
make

If you get the following message:
Cannot find library `libBMPTree.so' for module `BMP'
Your standard library was built without the BMP module. Edit stdlib/configure and changed ENABLE_SDL="no" to ENABLE_SDL="yes", then run configure and make again.

Usage examples available in ripl/examples.
