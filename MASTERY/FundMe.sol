//SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

//Get funds from users
//withdraw funds
//set a minimum funding value

//importing from github
//import { AggregatorV3Interface } from '@chainlink/contracts/src/v0.8/interfaces/AggregatorV3Interface.sol';
/**After creating a library :: PriceConverter, we then use this import below */
import {PriceConverter} from "./PriceConverter.sol";

interface AggregatorV3Interface {
    function decimals() external view returns (uint8);

    function description() external view returns (string memory);

    function version() external view returns (uint256);

    function getRoundData(
        uint80 _roundId
    )
        external
        view
        returns (
            uint80 roundId,
            int256 answer,
            uint256 startedAt,
            uint256 updatedAt,
            uint80 answeredInRound
        );

    function latestRoundData()
        external
        view
        returns (
            uint80 roundId,
            int256 answer,
            uint256 startedAt,
            uint256 updatedAt,
            uint80 answeredInRound
        );
}

// error NotOwner();

contract FundMe {
    //TO convert all functions used to uint256::
    using PriceConverter for uint256;
    uint256 myValue = 1;

    uint256 constant MINIMUM_USD = 50e18; //5ETH .. With constants

    address[] public funders;
    mapping(address /**funder */ => uint256 /**amountFunded*/)
        public addressToAmountFunded;

    address public owner;

    //with immutability::
    // address public immutable i_owner;

    constructor() {
        owner = msg.sender;
    }

    function fund() public payable {
        msg.value.getConversionRate();
        myValue += 2;
        require(
            msg.value > 1e18 || msg.value >= MINIMUM_USD,
            "Didn't send enough ETH"
        ); // 1e18 = 1ETH = 1*10**18
        //to get conversion directly
        require(
            getConversionRate(msg.value) >= MINIMUM_USD,
            "Didnot send enough ETH"
        );
        //or,,since we passed using PriceConverter for uint256,..we can use:::
        require(
            msg.value.getConversionRate /**ethAmount */() >= MINIMUM_USD,
            "Didnot send enough ETH"
        );
        //WITH THE SENDERS
        funders.push(msg.sender);
        addressToAmountFunded[msg.sender] += msg.value;
    }

    //Interface injections .. been migrated to PriceConverter library
    function getPrice() public view returns (uint256) {
        AggregatorV3Interface priceFeed = AggregatorV3Interface(
            0xcfdEf8165d722DC56a1FD06923de261B5B9d8626 /**Chainlink-address */
        );
        (, int256 price, , , ) = priceFeed.latestRoundData();
        return uint256(price * 1e10);
    }

    function getConversionRate(
        uint256 ethAmount
    ) public view returns (uint256) {
        uint256 ethPrice = getPrice();
        uint256 ethAmountInUsd = (ethPrice * ethAmount) / 1e18;
        return ethAmountInUsd;
    }

    function getVersion() public view returns (uint256) {
        return
            AggregatorV3Interface(
                0xcfdEf8165d722DC56a1FD06923de261B5B9d8626 /**chainlink-address*/
            ).version();
    }

    //above up to indicated have been removed for PriceConverter library

    //withdraw funds ..to withdraw , we use for loop::
    function withdraw() public onlyOwner {
        require(msg.sender == owner, "MUST BE THE OWNER"); //No need to use this since the below modifier specified it..
        for (
            uint256 funderIndex = 0;
            funderIndex < funders.length;
            funderIndex++
        ) {
            address funder = funders[funderIndex];
            addressToAmountFunded[funder] = 0; //..set index of funders
        }
        //Resetting array
        funders = new address[](0);
        //actually withdraw the funds

        //The commented below are not recommended
        //transfer
        // payable(msg.sender).transfer(address(this).balance);

        //send
        //    bool sendSuccess = payable(msg.sender).send(address(this).balance);
        //    require(sendSuccess, 'SEND FAILED')'

        //call .. not interested in dataReturned .. /**NOW IT IS THE RECOMMENDED METHOD TO USE TO SEND AND RECEIVE ETHER**/
        //    (bool callSuccess, bytes memory dataReturned) = payable(msg.sender).call{ value: address(this).balance}('');
        //    require(callSuccess, 'CALL FAILED');
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "SENDER IS NOT OWNER");
        //instead use custom error handling::
        // if( msg.send != owner ) {
        //     revert NotOwner();
        // }
        _;
    }

    //    receive() external payable {
    //     fund();
    //    }

    //    fallback() external payable {
    //     fund();
    //    }
}
