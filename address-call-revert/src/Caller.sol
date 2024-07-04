// SPDX-License-Identifier: Apache-2.0
pragma solidity 0.8.26;

import {Terminus} from "./Terminus.sol";

contract Caller {
    Terminus private _endpoint;

    constructor(Terminus endpoint){
        _endpoint = endpoint;
    }

    function callValue() external payable {

        //TODO call
    }
}
