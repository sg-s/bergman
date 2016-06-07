# bergman

Experimental proof-of-concept video capture in MATLAB using Point Grey cameras.

## The problem:

MATLAB's built in `videoinput` class, used for image capture, can only log data as .AVI file. It is also reportedly slow, and takes some time to save the data after acquisition. 

## The Solution:

Use callback functions from the `videoinput` class to write raw frames to a binary dump. This should allow one to stream the data to disk, with no limitation. 

## Installation 

The recommended way to install this is to use my package manager:

```matlab
urlwrite('http://srinivas.gs/install.m','install.m'); 
install bergman
install srinivas.gs_mtools  
```

or clone this repository using git. 

## Usage

Set up the `bergman` class:

``` matlab
b =  bergman;
```

(Optional) Specify where you want to log data

```matlab
b.file_name = 'through_a_glass_darkly.bergman';
```

Start acquisition:

```matlab
b.start;
```

`bergman` should now have logged all the data to disk in the file you specified. 


## Limitations

1. Only works with Point Grey cameras
2. Assumes you have all the hardware packages installed
3. No support for unlimited data capture yet. You have to specify how many frames you want in advance.
4. Files not closed properly. You have to manually close them. 

## License

bergman is free software. 
[GPL v3](https://www.gnu.org/licenses/gpl-3.0.txt)