pragma solidity ^0.4.18;

library SafeMath {

  /**
  * @dev Multiplies two numbers, throws on overflow.
  */
  function mul(uint256 a, uint256 b) internal pure returns (uint256) {
    if (a == 0) {
      return 0;
    }
    uint256 c = a * b;
    assert(c / a == b);
    return c;
  }

  /**
  * @dev Integer division of two numbers, truncating the quotient.
  */
  function div(uint256 a, uint256 b) internal pure returns (uint256) {
    // assert(b > 0); // Solidity automatically throws when dividing by 0
    uint256 c = a / b;
    // assert(a == b * c + a % b); // There is no case in which this doesn't hold
    return c;
  }

  /**
  * @dev Substracts two numbers, throws on overflow (i.e. if subtrahend is greater than minuend).
  */
  function sub(uint256 a, uint256 b) internal pure returns (uint256) {
    assert(b <= a);
    return a - b;
  }

  /**
  * @dev Adds two numbers, throws on overflow.
  */
  function add(uint256 a, uint256 b) internal pure returns (uint256) {
    uint256 c = a + b;
    assert(c >= a);
    return c;
  }
}



contract SafeMathTesting {
  using SafeMath for uint256;
  
   function () external payable {
     uint256 tokenAmount = getTokenAmount(msg.value);
     uint256 something = tokenAmount * 2; // just so I have a place for debugger.
     assert(tokenAmount == 4000);
   } 
  
  uint256 weiRaised = 700 finney;

  function getTokenAmount(uint256 _weiAmount) internal view returns (uint256) {

    uint16 multiply;
    uint16 divide = 2;

    // 0-50    4x
    // 50-100  3.5x
    // 100-150 3x
    // 150-200 2.5x
    // 200-250 2x

    if (weiRaised < 1 ether) {
      multiply = 8;
    } else if (weiRaised < 2 ether) {
      multiply = 7;
    } else if (weiRaised < 3 ether) {
      multiply = 6;
    } else if (weiRaised < 4 ether) {
      multiply = 5;
    } else {
      multiply = 4;
    }

    return _weiAmount.mul(multiply).div(divide);
  }

}