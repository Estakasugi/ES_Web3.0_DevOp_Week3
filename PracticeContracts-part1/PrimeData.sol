//SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

contract PrimeData {

    //boolean type of data
    bool public moo = true;

    /*
    uint stands for unsigned integer, meaning non negative integers
    different sizes are available
        uint8   ranges from 0 to 2 ** 8 - 1
        uint16  ranges from 0 to 2 ** 16 - 1
        ...
        uint256 ranges from 0 to 2 ** 256 - 1

        uint"n" -> (0,2**(n) - 1)
    */
    uint8 public u8biggest = 255;
    uint8 public u8sysMax = type(uint8).max;
    uint8 public usysMin = type(uint8).min;

    uint256 public u256test = 199999999;
    uint256 public u256SysMax = type(uint256).max; 

    /*
    Negative numbers are allowed for int types.
    Like uint, different ranges are available from int8 to int256

    int8 range from - (2**7) to 2**7 -1

    int"n" -> (-(2**(n-1)), (2**(n-1)-1))     
    */

    int8 public in8sysMax = type(int8).max;
    int8 public in8sysMin = type(int8).min;
    
    //address type of data
    address public contractFundMe = 0x0fEf8253cAF8C6c23BE22830407aEF019A5eaa4b;

    
    /*
    In Solidity, the data type byte represent a sequence of bytes. 
    Solidity presents two type of bytes types :

     - fixed-sized byte arrays
     - dynamically-sized byte arrays.
     
     The term bytes in Solidity represents a dynamic array of bytes. 
     It’s a shorthand for byte[] .
    */

    bytes1 public byteTest = 0xff; //11111111



}
