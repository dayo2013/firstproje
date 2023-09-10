// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.19;
 import {ERC20} from "@openzeppelin/contracts/token/ERC20/ERC20.sol";

 import "./TokenA.sol";
import "./TokenB.sol";
import  {Swap} from "./IERC20.sol";

contract Tokenswap{

    struct LiquityProvider{
        uint amountA;
        uint amountB;
       

    }
    mapping(address => LiquityProvider) _liquidityprovider;
     uint reserveA;
        uint reserveB;
        address TokenA;
        address TokenB;
        constructor(address _tokenA, address tokenB){
            TokenA = _tokenA;
            TokenB = tokenB;
        }
       

    function addliquidity(uint256 amountA , uint256 amountB)external{
        Swap(TokenA).transferFrom(msg.sender,address(this),amountA);
        Swap(TokenB).transferFrom(msg.sender,address(this),amountB);
        reserveA += amountA;
        reserveB += amountB;
        LiquityProvider storage provider = _liquidityprovider[msg.sender];
        provider.amountA += amountA;
        provider.amountB += amountB;

    }
    function swaptoken(uint _amount)public view returns(uint){


    }



}

    

