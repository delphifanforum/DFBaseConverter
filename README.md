# DFBaseConverter

DFBaseConverter is a Delphi library that provides functions for converting numbers between different number bases. It supports conversions between decimal, binary, hexadecimal, octal, and base64 representations, as well as various other number bases.

## Features

- Convert decimal numbers to binary, hexadecimal, octal, and base64 representations.
- Convert binary, hexadecimal, octal, and base64 numbers to decimal representation.

## Usage

To use the DFBaseConverter library in your Delphi project, follow these steps:

1. Clone or download the repository to your local machine.
2. Add the `DFBaseConverter` unit to your Delphi project.
3. Call the provided conversion functions in your code as needed.

## Functions
function DecimalToBinary(Value: Int64): String;

function BinaryToDecimal(Value: String): Int64;

function DecimalToHexadecimal(Value: Int64): String;

function HexadecimalToDecimal(Value: String): Int64;

function DecimalToOctal(Value: Int64): String;

function OctalToDecimal(Value: String): Int64;

function DecimalToDuodecimal(Value: Int64): String;

function DuodecimalToDecimal(Value: String): Int64;

// Additional base conversion functions

function DecimalToSexagesimal(Value: Int64): String;

function SexagesimalToDecimal(Value: String): Int64;

function DecimalToVigesimal(Value: Int64): String;

function VigesimalToDecimal(Value: String): Int64;

function DecimalToBase36(Value: Int64): String;

function Base36ToDecimal(Value: String): Int64;

function DecimalToBalancedTernary(Value: Int64): String;

function BalancedTernaryToDecimal(Value: String): Int64;

function DecimalToSenary(Value: Int64): String;

function SenaryToDecimal(Value: String): Int64;

function DecimalToQuaternary(Value: Int64): String;

function QuaternaryToDecimal(Value: String): Int64;

function DecimalToTernary(Value: Int64): String;

function TernaryToDecimal(Value: String): Int64;

function DecimalToQuinary(Value: Int64): String;

function QuinaryToDecimal(Value: String): Int64;

function DecimalToDuot32(Value: Int64): String;

function Duot32ToDecimal(Value: String): Int64;

function DecimalToTridecimal(Value: Int64): String;

function TridecimalToDecimal(Value: String): Int64;

function DecimalToSeptenary(Value: Int64): String;

function SeptenaryToDecimal(Value: String): Int64;

function DecimalToNonary(Value: Int64): String;

function NonaryToDecimal(Value: String): Int64;

function DecimalToPentadecimal(Value: Int64): String;

function PentadecimalToDecimal(Value: String): Int64;

function DecimalToHexatridecimal(Value: Int64): String;

function HexatridecimalToDecimal(Value: String): Int64;

function DecimalToBase64(Value: Int64): String;

function Base64ToDecimal(Value: String): Int64;


```delphi
// Example: Convert decimal number to binary
var
  DecimalValue: Int64;
  BinaryValue: String;
begin
  DecimalValue := 123;
  BinaryValue := DecimalToBinary(DecimalValue);
  // Output: '1111011'
end; 


