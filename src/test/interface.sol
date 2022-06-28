// SPDX-License-Identifier: UNLICENSED

pragma solidity >=0.7.0 <0.9.0;

import "ds-test/test.sol";


interface CheatCodes {
    function prank(address) external;
    function warp(uint256) external;
    function startPrank(address) external;
    function startPrank(address msgsender, address txorigin) external;
    function stopPrank() external;
    function deal(address who, uint256 newBalance) external;
    function roll(uint256) external;
}

interface IERC20 {
    event Approval(address indexed owner, address indexed spender, uint value);
    event Transfer(address indexed from, address indexed to, uint value);

    function name() external view returns (string memory);
    function symbol() external view returns (string memory);
    function decimals() external view returns (uint8);
    function totalSupply() external view returns (uint);
    function balanceOf(address owner) external view returns (uint);
    function allowance(address owner, address spender) external view returns (uint);

    function approve(address spender, uint value) external returns (bool);
    function transfer(address to, uint value) external returns (bool);
    function transferFrom(address from, address to, uint value) external returns (bool);
}
interface ICErc20Delegate {
    event AccrueInterest(
        uint256 cashPrior,
        uint256 interestAccumulated,
        uint256 borrowIndex,
        uint256 totalBorrows
    );
    event Approval(
        address indexed owner,
        address indexed spender,
        uint256 amount
    );
    event Borrow(
        address borrower,
        uint256 borrowAmount,
        uint256 accountBorrows,
        uint256 totalBorrows
    );
    event Failure(uint256 error, uint256 info, uint256 detail);
    event LiquidateBorrow(
        address liquidator,
        address borrower,
        uint256 repayAmount,
        address cTokenCollateral,
        uint256 seizeTokens
    );
    event Mint(address minter, uint256 mintAmount, uint256 mintTokens);
    event NewAdmin(address oldAdmin, address newAdmin);
    event NewComptroller(address oldComptroller, address newComptroller);
    event NewMarketInterestRateModel(
        address oldInterestRateModel,
        address newInterestRateModel
    );
    event NewPendingAdmin(address oldPendingAdmin, address newPendingAdmin);
    event NewReserveFactor(
        uint256 oldReserveFactorMantissa,
        uint256 newReserveFactorMantissa
    );
    event Redeem(address redeemer, uint256 redeemAmount, uint256 redeemTokens);
    event RepayBorrow(
        address payer,
        address borrower,
        uint256 repayAmount,
        uint256 accountBorrows,
        uint256 totalBorrows
    );
    event ReservesAdded(
        address benefactor,
        uint256 addAmount,
        uint256 newTotalReserves
    );
    event ReservesReduced(
        address admin,
        uint256 reduceAmount,
        uint256 newTotalReserves
    );
    event Transfer(address indexed from, address indexed to, uint256 amount);

    function _acceptAdmin() external returns (uint256);

    function _addReserves(uint256 addAmount) external returns (uint256);

    function _becomeImplementation(bytes memory data) external;

    function _delegateCompLikeTo(address compLikeDelegatee) external;

    function _reduceReserves(uint256 reduceAmount) external returns (uint256);

    function _resignImplementation() external;

    function _setComptroller(address newComptroller) external returns (uint256);

    function _setInterestRateModel(address newInterestRateModel)
    external
    returns (uint256);

    function _setPendingAdmin(address newPendingAdmin)
    external
    returns (uint256);

    function _setReserveFactor(uint256 newReserveFactorMantissa)
    external
    returns (uint256);

    function accrualBlockNumber() external view returns (uint256);

    function accrueInterest() external returns (uint256);

    function admin() external view returns (address);

    function allowance(address owner, address spender)
    external
    view
    returns (uint256);

    function approve(address spender, uint256 amount) external returns (bool);

    function balanceOf(address owner) external view returns (uint256);

    function balanceOfUnderlying(address owner) external returns (uint256);

    function borrow(uint256 borrowAmount) external returns (uint256);

    function borrowBalanceCurrent(address account) external returns (uint256);

    function borrowBalanceStored(address account)
    external
    view
    returns (uint256);

    function borrowIndex() external view returns (uint256);

    function borrowRatePerBlock() external view returns (uint256);

    function comptroller() external view returns (address);

    function decimals() external view returns (uint8);

    function exchangeRateCurrent() external returns (uint256);

    function exchangeRateStored() external view returns (uint256);

    function getAccountSnapshot(address account)
    external
    view
    returns (
        uint256,
        uint256,
        uint256,
        uint256
    );

    function getCash() external view returns (uint256);

    function implementation() external view returns (address);

    function initialize(
        address underlying_,
        address comptroller_,
        address interestRateModel_,
        uint256 initialExchangeRateMantissa_,
        string memory name_,
        string memory symbol_,
        uint8 decimals_
    ) external;

    function initialize(
        address comptroller_,
        address interestRateModel_,
        uint256 initialExchangeRateMantissa_,
        string memory name_,
        string memory symbol_,
        uint8 decimals_
    ) external;

    function interestRateModel() external view returns (address);

    function isCToken() external view returns (bool);

    function liquidateBorrow(
        address borrower,
        uint256 repayAmount,
        address cTokenCollateral
    ) external returns (uint256);

    function mint(uint256 mintAmount) external returns (uint256);

    function name() external view returns (string memory);

    function pendingAdmin() external view returns (address);

    function protocolSeizeShareMantissa() external view returns (uint256);

    function redeem(uint256 redeemTokens) external returns (uint256);

    function redeemUnderlying(uint256 redeemAmount) external returns (uint256);

    function repayBorrow(uint256 repayAmount) external returns (uint256);

    function repayBorrowBehalf(address borrower, uint256 repayAmount)
    external
    returns (uint256);

    function reserveFactorMantissa() external view returns (uint256);

    function seize(
        address liquidator,
        address borrower,
        uint256 seizeTokens
    ) external returns (uint256);

    function supplyRatePerBlock() external view returns (uint256);

    function sweepToken(address token) external;

    function symbol() external view returns (string memory);

    function totalBorrows() external view returns (uint256);

    function totalBorrowsCurrent() external returns (uint256);

    function totalReserves() external view returns (uint256);

    function totalSupply() external view returns (uint256);

    function transfer(address dst, uint256 amount) external returns (bool);

    function transferFrom(
        address src,
        address dst,
        uint256 amount
    ) external returns (bool);

    function underlying() external view returns (address);
}
interface ERC1820Registry {
    function setInterfaceImplementer(
        address _addr,
        bytes32 _interfaceHash,
        address _implementer
    ) external;
}

interface IUniswapV2Pair {
    function swap(uint amount0Out, uint amount1Out, address to, bytes calldata data) external;
}
interface IBacon {
    function lend(uint index) external;
    function redeem(uint index) external;
    function balanceOf(address account) external view returns (uint256);
}

interface IACOWriter {
    function erc20proxy() external view returns (address);

    function weth() external view returns (address);

    function write(
        address acoToken,
        uint256 collateralAmount,
        address exchangeAddress,
        bytes memory exchangeData
    ) external payable;

    receive() external payable;
}

interface IRevest {
    struct FNFTConfig {
        address asset;
        address pipeToContract;
        uint256 depositAmount;
        uint256 depositMul;
        uint256 split;
        uint256 depositStopTime;
        bool maturityExtension;
        bool isMulti;
        bool nontransferrable;
    }

    event FNFTAddionalDeposited(
        address indexed from,
        uint256 indexed newFNFTId,
        uint256 indexed quantity,
        uint256 amount
    );
    event FNFTAddressLockMinted(
        address indexed asset,
        address indexed from,
        uint256 indexed fnftId,
        address trigger,
        uint256[] quantities,
        FNFTConfig fnftConfig
    );
    event FNFTMaturityExtended(
        address indexed from,
        uint256 indexed fnftId,
        uint256 indexed newExtendedTime
    );
    event FNFTSplit(
        address indexed from,
        uint256[] indexed newFNFTId,
        uint256[] indexed proportions,
        uint256 quantity
    );
    event FNFTTimeLockMinted(
        address indexed asset,
        address indexed from,
        uint256 indexed fnftId,
        uint256 endTime,
        uint256[] quantities,
        FNFTConfig fnftConfig
    );
    event FNFTUnlocked(address indexed from, uint256 indexed fnftId);
    event FNFTValueLockMinted(
        address indexed primaryAsset,
        address indexed from,
        uint256 indexed fnftId,
        address compareTo,
        address oracleDispatch,
        uint256[] quantities,
        FNFTConfig fnftConfig
    );
    event FNFTWithdrawn(
        address indexed from,
        uint256 indexed fnftId,
        uint256 indexed quantity
    );
    event OwnershipTransferred(
        address indexed previousOwner,
        address indexed newOwner
    );
    event RoleAdminChanged(
        bytes32 indexed role,
        bytes32 indexed previousAdminRole,
        bytes32 indexed newAdminRole
    );
    event RoleGranted(
        bytes32 indexed role,
        address indexed account,
        address indexed sender
    );
    event RoleRevoked(
        bytes32 indexed role,
        address indexed account,
        address indexed sender
    );

    function ADDRESS_LOCK_INTERFACE_ID() external view returns (bytes4);

    function DEFAULT_ADMIN_ROLE() external view returns (bytes32);

    function PAUSER_ROLE() external view returns (bytes32);

    function depositAdditionalToFNFT(
        uint256 fnftId,
        uint256 amount,
        uint256 quantity
    ) external returns (uint256);

    function erc20Fee() external view returns (uint256);

    function extendFNFTMaturity(uint256 fnftId, uint256 endTime)
    external
    returns (uint256);

    function flatWeiFee() external view returns (uint256);

    function getAddressesProvider() external view returns (address);

    function getERC20Fee() external view returns (uint256);

    function getFlatWeiFee() external view returns (uint256);

    function getRoleAdmin(bytes32 role) external view returns (bytes32);

    function getRoleMember(bytes32 role, uint256 index)
    external
    view
    returns (address);

    function getRoleMemberCount(bytes32 role) external view returns (uint256);

    function grantRole(bytes32 role, address account) external;

    function hasRole(bytes32 role, address account)
    external
    view
    returns (bool);

    function mintAddressLock(
        address trigger,
        bytes memory arguments,
        address[] memory recipients,
        uint256[] memory quantities,
        FNFTConfig memory fnftConfig
    ) external payable returns (uint256);

    function mintTimeLock(
        uint256 endTime,
        address[] memory recipients,
        uint256[] memory quantities,
        FNFTConfig memory fnftConfig
    ) external payable returns (uint256);

    function mintValueLock(
        address primaryAsset,
        address compareTo,
        uint256 unlockValue,
        bool unlockRisingEdge,
        address oracleDispatch,
        address[] memory recipients,
        uint256[] memory quantities,
        FNFTConfig memory fnftConfig
    ) external payable returns (uint256);

    function owner() external view returns (address);

    function renounceOwnership() external;

    function renounceRole(bytes32 role, address account) external;

    function revokeRole(bytes32 role, address account) external;

    function setAddressRegistry(address registry) external;

    function setERC20Fee(uint256 erc20) external;

    function setFlatWeiFee(uint256 wethFee) external;

    function splitFNFT(
        uint256 fnftId,
        uint256[] memory proportions,
        uint256 quantity
    ) external returns (uint256[] memory);

    function supportsInterface(bytes4 interfaceId) external view returns (bool);

    function transferOwnership(address newOwner) external;

    function unlockFNFT(uint256 fnftId) external;

    function withdrawFNFT(uint256 fnftId, uint256 quantity) external;
}
interface AnyswapV4Router {

    function anySwapOutUnderlyingWithPermit(
        address from,
        address token,
        address to,
        uint256 amount,
        uint256 deadline,
        uint8 v,
        bytes32 r,
        bytes32 s,
        uint256 toChainID
    ) external;
    
}

interface WETH {

    function approve(address guy, uint256 wad) external returns (bool);

    function withdraw(uint256 wad) external;

    function balanceOf(address) external view returns (uint256);

    function transfer(address dst, uint256 wad) external returns (bool);

}

interface AnyswapV1ERC20 {
    function mint(address to, uint256 amount) external returns (bool);
    function burn(address from, uint256 amount) external returns (bool);
    function changeVault(address newVault) external returns (bool);
    function depositVault(uint amount, address to) external returns (uint);
    function withdrawVault(address from, uint amount, address to) external returns (uint);
    function underlying() external view returns (address);
}
interface IERC1820Registry {
    function setInterfaceImplementer(
        address _addr,
        bytes32 _interfaceHash,
        address _implementer
    ) external;

    function getManager(address _addr) external view returns (address);

    function setManager(address _addr, address _newManager) external;

    function interfaceHash(string memory _interfaceName)
        external
        pure
        returns (bytes32);

    function updateERC165Cache(address _contract, bytes4 _interfaceId) external;

    function getInterfaceImplementer(address _addr, bytes32 _interfaceHash)
        external
        view
        returns (address);

    function implementsERC165InterfaceNoCache(
        address _contract,
        bytes4 _interfaceId
    ) external view returns (bool);

    function implementsERC165Interface(address _contract, bytes4 _interfaceId)
        external
        view
        returns (bool);

    event InterfaceImplementerSet(
        address indexed addr,
        bytes32 indexed interfaceHash,
        address indexed implementer
    );
    event ManagerChanged(address indexed addr, address indexed newManager);
}

interface IERC777 {

    function name() external view returns (string memory);
    function symbol() external view returns (string memory);
    function granularity() external view returns (uint256);
    function totalSupply() external view returns (uint256);
    function balanceOf(address owner) external view returns (uint256);
    function send(
        address recipient,
        uint256 amount,
        bytes calldata data
    ) external;

    function burn(uint256 amount, bytes calldata data) external;

    function isOperatorFor(address operator, address tokenHolder) external view returns (bool);

    function authorizeOperator(address operator) external;

    function revokeOperator(address operator) external;

    function defaultOperators() external view returns (address[] memory);

    function operatorSend(
        address sender,
        address recipient,
        uint256 amount,
        bytes calldata data,
        bytes calldata operatorData
    ) external;

    function operatorBurn(
        address account,
        uint256 amount,
        bytes calldata data,
        bytes calldata operatorData
    ) external;

    event Sent(
        address indexed operator,
        address indexed from,
        address indexed to,
        uint256 amount,
        bytes data,
        bytes operatorData
    );

    event Minted(address indexed operator, address indexed to, uint256 amount, bytes data, bytes operatorData);

    event Burned(address indexed operator, address indexed from, uint256 amount, bytes data, bytes operatorData);

    event AuthorizedOperator(address indexed operator, address indexed tokenHolder);

    event RevokedOperator(address indexed operator, address indexed tokenHolder);
}

interface Uni_Pair_V2 {

    event Approval( address indexed owner,address indexed spender,uint256 value ) ;
    event Burn( address indexed sender,uint256 amount0,uint256 amount1,address indexed to ) ;
    event Mint( address indexed sender,uint256 amount0,uint256 amount1 ) ;
    event Swap( address indexed sender,uint256 amount0In,uint256 amount1In,uint256 amount0Out,uint256 amount1Out,address indexed to ) ;
    event Sync( uint112 reserve0,uint112 reserve1 ) ;
    event Transfer( address indexed from,address indexed to,uint256 value ) ;
    function DOMAIN_SEPARATOR(  ) external view returns (bytes32 ) ;
    function MINIMUM_LIQUIDITY(  ) external view returns (uint256 ) ;
    function PERMIT_TYPEHASH(  ) external view returns (bytes32 ) ;
    function allowance( address ,address  ) external view returns (uint256 ) ;
    function approve( address spender,uint256 value ) external  returns (bool ) ;
    function balanceOf( address  ) external view returns (uint256 ) ;
    function burn( address to ) external  returns (uint256 amount0, uint256 amount1) ;
    function decimals(  ) external view returns (uint8 ) ;
    function factory(  ) external view returns (address ) ;
    function getReserves(  ) external view returns (uint112 _reserve0, uint112 _reserve1, uint32 _blockTimestampLast) ;
    function initialize( address _token0,address _token1 ) external   ;
    function kLast(  ) external view returns (uint256 ) ;
    function mint( address to ) external  returns (uint256 liquidity) ;
    function name(  ) external view returns (string memory ) ;
    function nonces( address  ) external view returns (uint256 ) ;
    function permit( address owner,address spender,uint256 value,uint256 deadline,uint8 v,bytes32 r,bytes32 s ) external   ;
    function price0CumulativeLast(  ) external view returns (uint256 ) ;
    function price1CumulativeLast(  ) external view returns (uint256 ) ;
    function skim( address to ) external   ;
    function swap( uint256 amount0Out,uint256 amount1Out,address to,bytes memory data ) external   ;
    function symbol(  ) external view returns (string memory ) ;
    function sync(  ) external   ;
    function token0(  ) external view returns (address ) ;
    function token1(  ) external view returns (address ) ;
    function totalSupply(  ) external view returns (uint256 ) ;
    function transfer( address to,uint256 value ) external  returns (bool ) ;
    function transferFrom( address from,address to,uint256 value ) external  returns (bool ) ;
}

interface Uni_Router_V2{



    function WETH(  ) external view returns (address ) ;
    function addLiquidity( address tokenA,address tokenB,uint256 amountADesired,uint256 amountBDesired,uint256 amountAMin,uint256 amountBMin,address to,uint256 deadline ) external  returns (uint256 amountA, uint256 amountB, uint256 liquidity) ;
    function addLiquidityETH( address token,uint256 amountTokenDesired,uint256 amountTokenMin,uint256 amountETHMin,address to,uint256 deadline ) external payable returns (uint256 amountToken, uint256 amountETH, uint256 liquidity) ;
    function factory(  ) external view returns (address ) ;
    function getAmountIn( uint256 amountOut,uint256 reserveIn,uint256 reserveOut ) external pure returns (uint256 amountIn) ;
    function getAmountOut( uint256 amountIn,uint256 reserveIn,uint256 reserveOut ) external pure returns (uint256 amountOut) ;
    function getAmountsIn( uint256 amountOut,address[] memory path ) external view returns (uint256[] memory amounts) ;
    function getAmountsOut( uint256 amountIn,address[] memory path ) external view returns (uint256[] memory amounts) ;
    function quote( uint256 amountA,uint256 reserveA,uint256 reserveB ) external pure returns (uint256 amountB) ;
    function removeLiquidity( address tokenA,address tokenB,uint256 liquidity,uint256 amountAMin,uint256 amountBMin,address to,uint256 deadline ) external  returns (uint256 amountA, uint256 amountB) ;
    function removeLiquidityETH( address token,uint256 liquidity,uint256 amountTokenMin,uint256 amountETHMin,address to,uint256 deadline ) external  returns (uint256 amountToken, uint256 amountETH) ;
    function removeLiquidityETHSupportingFeeOnTransferTokens( address token,uint256 liquidity,uint256 amountTokenMin,uint256 amountETHMin,address to,uint256 deadline ) external  returns (uint256 amountETH) ;
    function removeLiquidityETHWithPermit( address token,uint256 liquidity,uint256 amountTokenMin,uint256 amountETHMin,address to,uint256 deadline,bool approveMax,uint8 v,bytes32 r,bytes32 s ) external  returns (uint256 amountToken, uint256 amountETH) ;
    function removeLiquidityETHWithPermitSupportingFeeOnTransferTokens( address token,uint256 liquidity,uint256 amountTokenMin,uint256 amountETHMin,address to,uint256 deadline,bool approveMax,uint8 v,bytes32 r,bytes32 s ) external  returns (uint256 amountETH) ;
    function removeLiquidityWithPermit( address tokenA,address tokenB,uint256 liquidity,uint256 amountAMin,uint256 amountBMin,address to,uint256 deadline,bool approveMax,uint8 v,bytes32 r,bytes32 s ) external  returns (uint256 amountA, uint256 amountB) ;
    function swapETHForExactTokens( uint256 amountOut,address[] memory path,address to,uint256 deadline ) external payable returns (uint256[] memory amounts) ;
    function swapExactETHForTokens( uint256 amountOutMin,address[] memory path,address to,uint256 deadline ) external payable returns (uint256[] memory amounts) ;
    function swapExactETHForTokensSupportingFeeOnTransferTokens( uint256 amountOutMin,address[] memory path,address to,uint256 deadline ) external payable  ;
    function swapExactTokensForETH( uint256 amountIn,uint256 amountOutMin,address[] memory path,address to,uint256 deadline ) external  returns (uint256[] memory amounts) ;
    function swapExactTokensForETHSupportingFeeOnTransferTokens( uint256 amountIn,uint256 amountOutMin,address[] memory path,address to,uint256 deadline ) external   ;
    function swapExactTokensForTokens( uint256 amountIn,uint256 amountOutMin,address[] memory path,address to,uint256 deadline ) external  returns (uint256[] memory amounts) ;
    function swapExactTokensForTokensSupportingFeeOnTransferTokens( uint256 amountIn,uint256 amountOutMin,address[] memory path,address to,uint256 deadline ) external   ;
    function swapTokensForExactETH( uint256 amountOut,uint256 amountInMax,address[] memory path,address to,uint256 deadline ) external  returns (uint256[] memory amounts) ;
    function swapTokensForExactTokens( uint256 amountOut,uint256 amountInMax,address[] memory path,address to,uint256 deadline ) external  returns (uint256[] memory amounts) ;
    // receive () external payable;
}

interface WETH9 {
    function name() external view returns (string memory);

    function approve(address guy, uint256 wad) external returns (bool);

    function totalSupply() external view returns (uint256);

    function transferFrom(
        address src,
        address dst,
        uint256 wad
    ) external returns (bool);

    function withdraw(uint256 wad) external;

    function decimals() external view returns (uint8);

    function balanceOf(address) external view returns (uint256);

    function symbol() external view returns (string memory);

    function transfer(address dst, uint256 wad) external returns (bool);

    function deposit() external payable;

    function allowance(address, address) external view returns (uint256);
    event Approval(address indexed src, address indexed guy, uint256 wad);
    event Transfer(address indexed src, address indexed dst, uint256 wad);
    event Deposit(address indexed dst, uint256 wad);
    event Withdrawal(address indexed src, uint256 wad);
}

interface crETH {
    event AccrueInterest(
        uint256 cashPrior,
        uint256 interestAccumulated,
        uint256 borrowIndex,
        uint256 totalBorrows
    );
    event Approval(
        address indexed owner,
        address indexed spender,
        uint256 amount
    );
    event Borrow(
        address borrower,
        uint256 borrowAmount,
        uint256 accountBorrows,
        uint256 totalBorrows
    );
    event Failure(uint256 error, uint256 info, uint256 detail);
    event LiquidateBorrow(
        address liquidator,
        address borrower,
        uint256 repayAmount,
        address cTokenCollateral,
        uint256 seizeTokens
    );
    event Mint(address minter, uint256 mintAmount, uint256 mintTokens);
    event NewAdmin(address oldAdmin, address newAdmin);
    event NewComptroller(address oldComptroller, address newComptroller);
    event NewMarketInterestRateModel(
        address oldInterestRateModel,
        address newInterestRateModel
    );
    event NewPendingAdmin(address oldPendingAdmin, address newPendingAdmin);
    event NewReserveFactor(
        uint256 oldReserveFactorMantissa,
        uint256 newReserveFactorMantissa
    );
    event Redeem(address redeemer, uint256 redeemAmount, uint256 redeemTokens);
    event RepayBorrow(
        address payer,
        address borrower,
        uint256 repayAmount,
        uint256 accountBorrows,
        uint256 totalBorrows
    );
    event ReservesAdded(
        address benefactor,
        uint256 addAmount,
        uint256 newTotalReserves
    );
    event ReservesReduced(
        address admin,
        uint256 reduceAmount,
        uint256 newTotalReserves
    );
    event Transfer(address indexed from, address indexed to, uint256 amount);



    function _acceptAdmin() external returns (uint256);

    function _reduceReserves(uint256 reduceAmount) external returns (uint256);

    function _setComptroller(address newComptroller) external returns (uint256);

    function _setInterestRateModel(address newInterestRateModel)
        external
        returns (uint256);

    function _setPendingAdmin(address newPendingAdmin)
        external
        returns (uint256);

    function _setReserveFactor(uint256 newReserveFactorMantissa)
        external
        returns (uint256);

    function accrualBlockNumber() external view returns (uint256);

    function accrueInterest() external returns (uint256);

    function admin() external view returns (address);

    function allowance(address owner, address spender)
        external
        view
        returns (uint256);

    function approve(address spender, uint256 amount) external returns (bool);

    function balanceOf(address owner) external view returns (uint256);

    function balanceOfUnderlying(address owner) external returns (uint256);

    function borrow(uint256 borrowAmount) external returns (uint256);

    function borrowBalanceCurrent(address account) external returns (uint256);

    function borrowBalanceStored(address account)
        external
        view
        returns (uint256);

    function borrowIndex() external view returns (uint256);

    function borrowRatePerBlock() external view returns (uint256);

    function comptroller() external view returns (address);

    function decimals() external view returns (uint8);

    function exchangeRateCurrent() external returns (uint256);

    function exchangeRateStored() external view returns (uint256);

    function getAccountSnapshot(address account)
        external
        view
        returns (
            uint256,
            uint256,
            uint256,
            uint256
        );

    function getCash() external view returns (uint256);

    function initialize(
        address comptroller_,
        address interestRateModel_,
        uint256 initialExchangeRateMantissa_,
        string memory name_,
        string memory symbol_,
        uint8 decimals_
    ) external;

    function interestRateModel() external view returns (address);

    function isCToken() external view returns (bool);

    function liquidateBorrow(address borrower, address cTokenCollateral)
        external
        payable;

    function mint() external payable;

    function name() external view returns (string memory);

    function pendingAdmin() external view returns (address);

    function redeem(uint256 redeemTokens) external returns (uint256);

    function redeemUnderlying(uint256 redeemAmount) external returns (uint256);

    function repayBorrow() external payable;

    function repayBorrowBehalf(address borrower) external payable;

    function reserveFactorMantissa() external view returns (uint256);

    function seize(
        address liquidator,
        address borrower,
        uint256 seizeTokens
    ) external returns (uint256);

    function supplyRatePerBlock() external view returns (uint256);

    function symbol() external view returns (string memory);

    function totalBorrows() external view returns (uint256);

    function totalBorrowsCurrent() external returns (uint256);

    function totalReserves() external view returns (uint256);

    function totalSupply() external view returns (uint256);

    function transfer(address dst, uint256 amount) external returns (bool);

    function transferFrom(
        address src,
        address dst,
        uint256 amount
    ) external returns (bool);
}

interface crAMP {
    event AccrueInterest(
        uint256 cashPrior,
        uint256 interestAccumulated,
        uint256 borrowIndex,
        uint256 totalBorrows
    );
    event Approval(
        address indexed owner,
        address indexed spender,
        uint256 amount
    );
    event Borrow(
        address borrower,
        uint256 borrowAmount,
        uint256 accountBorrows,
        uint256 totalBorrows
    );
    event Failure(uint256 error, uint256 info, uint256 detail);
    event LiquidateBorrow(
        address liquidator,
        address borrower,
        uint256 repayAmount,
        address cTokenCollateral,
        uint256 seizeTokens
    );
    event Mint(address minter, uint256 mintAmount, uint256 mintTokens);
    event NewAdmin(address oldAdmin, address newAdmin);
    event NewComptroller(address oldComptroller, address newComptroller);
    event NewImplementation(
        address oldImplementation,
        address newImplementation
    );
    event NewMarketInterestRateModel(
        address oldInterestRateModel,
        address newInterestRateModel
    );
    event NewPendingAdmin(address oldPendingAdmin, address newPendingAdmin);
    event NewReserveFactor(
        uint256 oldReserveFactorMantissa,
        uint256 newReserveFactorMantissa
    );
    event Redeem(address redeemer, uint256 redeemAmount, uint256 redeemTokens);
    event RepayBorrow(
        address payer,
        address borrower,
        uint256 repayAmount,
        uint256 accountBorrows,
        uint256 totalBorrows
    );
    event ReservesAdded(
        address benefactor,
        uint256 addAmount,
        uint256 newTotalReserves
    );
    event ReservesReduced(
        address admin,
        uint256 reduceAmount,
        uint256 newTotalReserves
    );
    event Transfer(address indexed from, address indexed to, uint256 amount);
    


    function _acceptAdmin() external returns (uint256);

    function _addReserves(uint256 addAmount) external returns (uint256);

    function _reduceReserves(uint256 reduceAmount) external returns (uint256);

    function _setComptroller(address newComptroller) external returns (uint256);

    function _setImplementation(
        address implementation_,
        bool allowResign,
        bytes memory becomeImplementationData
    ) external;

    function _setInterestRateModel(address newInterestRateModel)
        external
        returns (uint256);

    function _setPendingAdmin(address newPendingAdmin)
        external
        returns (uint256);

    function _setReserveFactor(uint256 newReserveFactorMantissa)
        external
        returns (uint256);

    function accrualBlockNumber() external view returns (uint256);

    function accrueInterest() external returns (uint256);

    function admin() external view returns (address);

    function allowance(address owner, address spender)
        external
        view
        returns (uint256);

    function approve(address spender, uint256 amount) external returns (bool);

    function balanceOf(address owner) external view returns (uint256);

    function balanceOfUnderlying(address owner) external returns (uint256);

    function borrow(uint256 borrowAmount) external returns (uint256);

    function borrowBalanceCurrent(address account) external returns (uint256);

    function borrowBalanceStored(address account)
        external
        view
        returns (uint256);

    function borrowIndex() external view returns (uint256);

    function borrowRatePerBlock() external view returns (uint256);

    function comptroller() external view returns (address);

    function decimals() external view returns (uint8);

    function delegateToImplementation(bytes memory data)
        external
        returns (bytes memory);

    function delegateToViewImplementation(bytes memory data)
        external
        view
        returns (bytes memory);

    function exchangeRateCurrent() external returns (uint256);

    function exchangeRateStored() external view returns (uint256);

    function getAccountSnapshot(address account)
        external
        view
        returns (
            uint256,
            uint256,
            uint256,
            uint256
        );

    function getCash() external view returns (uint256);

    function implementation() external view returns (address);

    function interestRateModel() external view returns (address);

    function isCToken() external view returns (bool);

    function liquidateBorrow(
        address borrower,
        uint256 repayAmount,
        address cTokenCollateral
    ) external returns (uint256);

    function mint(uint256 mintAmount) external returns (uint256);

    function name() external view returns (string memory);

    function pendingAdmin() external view returns (address);

    function redeem(uint256 redeemTokens) external returns (uint256);

    function redeemUnderlying(uint256 redeemAmount) external returns (uint256);

    function repayBorrow(uint256 repayAmount) external returns (uint256);

    function repayBorrowBehalf(address borrower, uint256 repayAmount)
        external
        returns (uint256);

    function reserveFactorMantissa() external view returns (uint256);

    function seize(
        address liquidator,
        address borrower,
        uint256 seizeTokens
    ) external returns (uint256);

    function supplyRatePerBlock() external view returns (uint256);

    function symbol() external view returns (string memory);

    function totalBorrows() external view returns (uint256);

    function totalBorrowsCurrent() external returns (uint256);

    function totalReserves() external view returns (uint256);

    function totalSupply() external view returns (uint256);

    function transfer(address dst, uint256 amount) external returns (bool);

    function transferFrom(
        address src,
        address dst,
        uint256 amount
    ) external returns (bool);

    function underlying() external view returns (address);
}

interface AMP {
    event Approval(
        address indexed owner,
        address indexed spender,
        uint256 value
    );
    event ApprovalByPartition(
        bytes32 indexed partition,
        address indexed owner,
        address indexed spender,
        uint256 value
    );
    event AuthorizedOperator(
        address indexed operator,
        address indexed tokenHolder
    );
    event AuthorizedOperatorByPartition(
        bytes32 indexed partition,
        address indexed operator,
        address indexed tokenHolder
    );
    event ChangedPartition(
        bytes32 indexed fromPartition,
        bytes32 indexed toPartition,
        uint256 value
    );
    event CollateralManagerRegistered(address collateralManager);
    event Minted(
        address indexed operator,
        address indexed to,
        uint256 value,
        bytes data
    );
    event OwnerUpdate(address indexed oldValue, address indexed newValue);
    event OwnershipTransferAuthorization(address indexed authorizedAddress);
    event PartitionStrategySet(
        bytes4 flag,
        string name,
        address indexed implementation
    );
    event RevokedOperator(
        address indexed operator,
        address indexed tokenHolder
    );
    event RevokedOperatorByPartition(
        bytes32 indexed partition,
        address indexed operator,
        address indexed tokenHolder
    );
    event Swap(address indexed operator, address indexed from, uint256 value);
    event Transfer(address indexed from, address indexed to, uint256 value);
    event TransferByPartition(
        bytes32 indexed fromPartition,
        address operator,
        address indexed from,
        address indexed to,
        uint256 value,
        bytes data,
        bytes operatorData
    );

    function allowance(address _owner, address _spender)
        external
        view
        returns (uint256);

    function allowanceByPartition(
        bytes32 _partition,
        address _owner,
        address _spender
    ) external view returns (uint256);

    function approve(address _spender, uint256 _value) external returns (bool);

    function approveByPartition(
        bytes32 _partition,
        address _spender,
        uint256 _value
    ) external returns (bool);

    function assumeOwnership() external;

    function authorizeOperator(address _operator) external;

    function authorizeOperatorByPartition(bytes32 _partition, address _operator)
        external;

    function authorizeOwnershipTransfer(address _authorizedAddress) external;

    function authorizedNewOwner() external view returns (address);

    function balanceOf(address _tokenHolder) external view returns (uint256);

    function balanceOfByPartition(bytes32 _partition, address _tokenHolder)
        external
        view
        returns (uint256);

    function canImplementInterfaceForAddress(bytes32 _interfaceHash, address)
        external
        view
        returns (bytes32);

    function collateralManagers(uint256) external view returns (address);

    function decimals() external pure returns (uint8);

    function decreaseAllowance(address _spender, uint256 _subtractedValue)
        external
        returns (bool);

    function decreaseAllowanceByPartition(
        bytes32 _partition,
        address _spender,
        uint256 _subtractedValue
    ) external returns (bool);

    function defaultPartition() external view returns (bytes32);

    function granularity() external pure returns (uint256);

    function increaseAllowance(address _spender, uint256 _addedValue)
        external
        returns (bool);

    function increaseAllowanceByPartition(
        bytes32 _partition,
        address _spender,
        uint256 _addedValue
    ) external returns (bool);

    function isCollateralManager(address _collateralManager)
        external
        view
        returns (bool);

    function isOperator(address _operator, address _tokenHolder)
        external
        view
        returns (bool);

    function isOperatorForCollateralManager(
        bytes32 _partition,
        address _operator,
        address _collateralManager
    ) external view returns (bool);

    function isOperatorForPartition(
        bytes32 _partition,
        address _operator,
        address _tokenHolder
    ) external view returns (bool);

    function isPartitionStrategy(bytes4 _prefix) external view returns (bool);

    function name() external view returns (string memory);

    function owner() external view returns (address);

    function partitionStrategies(uint256) external view returns (bytes4);

    function partitionsOf(address _tokenHolder)
        external
        view
        returns (bytes32[] memory);

    function registerCollateralManager() external;

    function revokeOperator(address _operator) external;

    function revokeOperatorByPartition(bytes32 _partition, address _operator)
        external;

    function setPartitionStrategy(bytes4 _prefix, address _implementation)
        external;

    function swap(address _from) external;

    function swapToken() external view returns (address);

    function swapTokenGraveyard() external view returns (address);

    function symbol() external view returns (string memory);

    function totalPartitions() external view returns (bytes32[] memory);

    function totalSupply() external view returns (uint256);

    function totalSupplyByPartition(bytes32) external view returns (uint256);

    function transfer(address _to, uint256 _value) external returns (bool);

    function transferByPartition(
        bytes32 _partition,
        address _from,
        address _to,
        uint256 _value,
        bytes memory _data,
        bytes memory _operatorData
    ) external returns (bytes32);

    function transferFrom(
        address _from,
        address _to,
        uint256 _value
    ) external returns (bool);
}
interface IUSDC {

    function Swapin(
        bytes32 txhash,
        address account,
        uint256 amount
    ) external returns (bool);


    function transfer(address to, uint256 value) external returns (bool);

    function balanceOf(address) external view returns (uint256);

    function approve(address spender, uint256 value) external returns (bool);

}

interface IBaseV1Router01 {

    function addLiquidity(
        address tokenA,
        address tokenB,
        bool stable,
        uint256 amountADesired,
        uint256 amountBDesired,
        uint256 amountAMin,
        uint256 amountBMin,
        address to,
        uint256 deadline
    )
        external
        returns (
            uint256 amountA,
            uint256 amountB,
            uint256 liquidity
        );



    function swapExactTokensForTokensSimple(
        uint256 amountIn,
        uint256 amountOutMin,
        address tokenFrom,
        address tokenTo,
        bool stable,
        address to,
        uint256 deadline
    ) external returns (uint256[] memory amounts);


}

interface IDeiLenderSolidex {

    function addCollateral(address to, uint256 amount) external;

    function borrow(
        address to,
        uint256 amount,
        uint256 price,
        uint256 timestamp,
        bytes memory reqId,
        SchnorrSign[] memory sigs
    ) external returns (uint256 debt);
}
struct SchnorrSign {
    uint256 signature;
    address owner;
    address nonce;
}
interface ISSPv4 {

    function buyDei(uint256 amountIn) external;

}

interface ILpDepositor{

    function deposit(address pool, uint256 amount) external;

}


interface IOracle {
    function getOnChainPrice() external view returns (uint256);
}

interface DVM{
    
    function flashLoan(
        uint256 baseAmount,
        uint256 quoteAmount,
        address assetTo,
        bytes calldata data
    ) external;
    
    function init(
        address maintainer,
        address baseTokenAddress,
        address quoteTokenAddress,
        uint256 lpFeeRate,
        address mtFeeRateModel,
        uint256 i,
        uint256 k,
        bool isOpenTWAP
    ) external;        
    
}

interface Surge{
    function sell(uint256 tokenAmount) external returns (bool);
    function balanceOf(address account) external view returns (uint256);
    function transfer(address recipient, uint256 amount) external  returns (bool);
}



interface USDT{
    function transfer(address to, uint value) external;
    function balanceOf(address account) external view returns (uint);
    function approve (address spender, uint256 value) external ;
}
interface IMasterChef {
    event Deposit(address indexed user, uint256 indexed pid, uint256 amount);
    event EmergencyWithdraw(
        address indexed user,
        uint256 indexed pid,
        uint256 amount
    );
    event Withdraw(address indexed user, uint256 indexed pid, uint256 amount);
    event WithdrawChange(
        address indexed user,
        address indexed token,
        uint256 change
    );

    function BONUS_MULTIPLIER() external view returns (uint256);

    function WETH() external view returns (address);

    function _become(address proxy) external;

    function _totalClaimed(address, uint256) external view returns (uint256);

    function _whitelist(address) external view returns (address);

    function add(
        uint256 _allocPoint,
        address _lpToken,
        uint256 _pooltype,
        address _ticket,
        bool _withUpdate
    ) external;

    function admin() external view returns (address);

    function bonusEndBlock() external view returns (uint256);

    function check_vip_limit(
        uint256 ticket_level,
        uint256 ticket_count,
        uint256 amount
    ) external view returns (uint256 allowed, uint256 overflow);

    function claimFeeRate() external view returns (uint256);

    function deposit(uint256 _pid, uint256 _amount) external;

    function depositByAddLiquidity(
        uint256 _pid,
        address[2] memory _tokens,
        uint256[2] memory _amounts
    ) external;

    function depositByAddLiquidityETH(
        uint256 _pid,
        address _token,
        uint256 _amount
    ) external payable;

    function depositSingle(
        uint256 _pid,
        address _token,
        uint256 _amount,
        address[][2] memory paths,
        uint256 _minTokens
    ) external payable;

    function depositSingleTo(
        address _user,
        uint256 _pid,
        address _token,
        uint256 _amount,
        address[][2] memory paths,
        uint256 _minTokens
    ) external payable;

    function depositTo(
        uint256 _pid,
        uint256 _amount,
        address _user
    ) external;

    function deposit_all_tickets(address ticket) external;

    function dev(address _devaddr) external;

    function devaddr() external view returns (address);

    function emergencyWithdraw(uint256 _pid) external;

    function farmPercent(uint256) external view returns (uint8);

    function feeDistributor() external view returns (address);

    function getMultiplier(uint256 _from, uint256 _to)
    external
    view
    returns (uint256);

    function implementation() external view returns (address);

    function initialize(
        address _t42,
        address _treasury,
        address _feeDistributor,
        address _devaddr,
        uint256 _bonusEndBlock,
        address _WETH,
        address _paraRouter
    ) external;

    function massUpdatePools() external;

    function migrate(uint256 _pid) external;

    function migrator() external view returns (address);

    function onERC721Received(
        address,
        address,
        uint256,
        bytes memory
    ) external returns (bytes4);

    function paraRouter() external view returns (address);

    function pendingAdmin() external view returns (address);

    function pendingImplementation() external view returns (address);

    function pendingT42(uint256 _pid, address _user)
    external
    view
    returns (uint256 pending, uint256 fee);

    function poolInfo(uint256)
    external
    view
    returns (
        address lpToken,
        uint256 allocPoint,
        uint256 lastRewardBlock,
        uint256 accT42PerShare,
        address ticket,
        uint256 pooltype
    );

    function poolLength() external view returns (uint256);

    function poolsTotalDeposit(uint256) external view returns (uint256);

    function set(
        uint256 _pid,
        uint256 _allocPoint,
        bool _withUpdate
    ) external;

    function setClaimFeeRate(uint256 newRate) external;

    function setFarmPercents(uint8[] memory percents) external;

    function setFeeDistributor(address _newAddress) external;

    function setMigrator(address _migrator) external;

    function setRouter(address _router) external;

    function setT42(address _t42) external;

    function setTreasury(address _treasury) external;

    function setWhitelist(address _whtie, address accpeter) external;

    function setWithdrawFeeRate(uint256 newRate) external;

    function startBlock() external view returns (uint256);

    function t42() external view returns (address);

    function t42PerBlock(uint8 index) external view returns (uint256);

    function ticket_staked_array(address who, address ticket)
    external
    view
    returns (uint256[] memory);

    function ticket_staked_count(address who, address ticket)
    external
    view
    returns (uint256);

    function ticket_stakes(
        address,
        address,
        uint256
    ) external view returns (uint256);

    function totalAllocPoint() external view returns (uint256);

    function totalClaimed(
        address _user,
        uint256 pooltype,
        uint256 index
    ) external view returns (uint256);

    function treasury() external view returns (address);

    function updatePool(uint256 _pid) external;

    function userChange(address, address) external view returns (uint256);

    function userInfo(uint256, address)
    external
    view
    returns (uint256 amount, uint256 rewardDebt);

    function withdraw(uint256 _pid, uint256 _amount) external;

    function withdrawAndRemoveLiquidity(
        uint256 _pid,
        uint256 _amount,
        bool isBNB
    ) external;

    function withdrawChange(address[] memory tokens) external;

    function withdrawFeeRate() external view returns (uint256);

    function withdrawSingle(
        address tokenOut,
        uint256 _pid,
        uint256 _amount,
        address[][2] memory paths
    ) external;

    function withdraw_tickets(uint256 _pid, uint256 tokenId) external;
}

interface IPancakePair {
    event Approval(address indexed owner, address indexed spender, uint value);
    event Transfer(address indexed from, address indexed to, uint value);
    function name() external pure returns (string memory);
    function symbol() external pure returns (string memory);
    function decimals() external pure returns (uint8);
    function totalSupply() external view returns (uint);
    function balanceOf(address owner) external view returns (uint);
    function allowance(address owner, address spender) external view returns (uint);

    function approve(address spender, uint value) external returns (bool);
    function transfer(address to, uint value) external returns (bool);
    function transferFrom(address from, address to, uint value) external returns (bool);

    function DOMAIN_SEPARATOR() external view returns (bytes32);
    function PERMIT_TYPEHASH() external pure returns (bytes32);
    function nonces(address owner) external view returns (uint);

    function permit(address owner, address spender, uint value, uint deadline, uint8 v, bytes32 r, bytes32 s) external;

    event Mint(address indexed sender, uint amount0, uint amount1);
    event Burn(address indexed sender, uint amount0, uint amount1, address indexed to);
    event Swap(
        address indexed sender,
        uint amount0In,
        uint amount1In,
        uint amount0Out,
        uint amount1Out,
        address indexed to
    );
    event Sync(uint112 reserve0, uint112 reserve1);

    function MINIMUM_LIQUIDITY() external pure returns (uint);
    function factory() external view returns (address);
    function token0() external view returns (address);
    function token1() external view returns (address);
    function getReserves() external view returns (uint112 reserve0, uint112 reserve1, uint32 blockTimestampLast);
    function price0CumulativeLast() external view returns (uint);
    function price1CumulativeLast() external view returns (uint);
    function kLast() external view returns (uint);

    function mint(address to) external returns (uint liquidity);
    function burn(address to) external returns (uint amount0, uint amount1);
    function swap(uint amount0Out, uint amount1Out, address to, bytes calldata data) external;
    function skim(address to) external;
    function sync() external;

    function initialize(address, address) external;
}
interface IPancakeRouter {
    function WETH() external view returns (address);

    function addLiquidity(
        address tokenA,
        address tokenB,
        uint256 amountADesired,
        uint256 amountBDesired,
        uint256 amountAMin,
        uint256 amountBMin,
        address to,
        uint256 deadline
    )
    external
    returns (
        uint256 amountA,
        uint256 amountB,
        uint256 liquidity
    );

    function addLiquidityETH(
        address token,
        uint256 amountTokenDesired,
        uint256 amountTokenMin,
        uint256 amountETHMin,
        address to,
        uint256 deadline
    )
    external
    payable
    returns (
        uint256 amountToken,
        uint256 amountETH,
        uint256 liquidity
    );

    function factory() external view returns (address);

    function getAmountIn(
        uint256 amountOut,
        uint256 reserveIn,
        uint256 reserveOut
    ) external pure returns (uint256 amountIn);

    function getAmountOut(
        uint256 amountIn,
        uint256 reserveIn,
        uint256 reserveOut
    ) external pure returns (uint256 amountOut);

    function getAmountsIn(uint256 amountOut, address[] memory path)
    external
    view
    returns (uint256[] memory amounts);

    function getAmountsOut(uint256 amountIn, address[] memory path)
    external
    view
    returns (uint256[] memory amounts);

    function quote(
        uint256 amountA,
        uint256 reserveA,
        uint256 reserveB
    ) external pure returns (uint256 amountB);

    function removeLiquidity(
        address tokenA,
        address tokenB,
        uint256 liquidity,
        uint256 amountAMin,
        uint256 amountBMin,
        address to,
        uint256 deadline
    ) external returns (uint256 amountA, uint256 amountB);

    function removeLiquidityETH(
        address token,
        uint256 liquidity,
        uint256 amountTokenMin,
        uint256 amountETHMin,
        address to,
        uint256 deadline
    ) external returns (uint256 amountToken, uint256 amountETH);

    function removeLiquidityETHSupportingFeeOnTransferTokens(
        address token,
        uint256 liquidity,
        uint256 amountTokenMin,
        uint256 amountETHMin,
        address to,
        uint256 deadline
    ) external returns (uint256 amountETH);

    function removeLiquidityETHWithPermit(
        address token,
        uint256 liquidity,
        uint256 amountTokenMin,
        uint256 amountETHMin,
        address to,
        uint256 deadline,
        bool approveMax,
        uint8 v,
        bytes32 r,
        bytes32 s
    ) external returns (uint256 amountToken, uint256 amountETH);

    function removeLiquidityETHWithPermitSupportingFeeOnTransferTokens(
        address token,
        uint256 liquidity,
        uint256 amountTokenMin,
        uint256 amountETHMin,
        address to,
        uint256 deadline,
        bool approveMax,
        uint8 v,
        bytes32 r,
        bytes32 s
    ) external returns (uint256 amountETH);

    function removeLiquidityWithPermit(
        address tokenA,
        address tokenB,
        uint256 liquidity,
        uint256 amountAMin,
        uint256 amountBMin,
        address to,
        uint256 deadline,
        bool approveMax,
        uint8 v,
        bytes32 r,
        bytes32 s
    ) external returns (uint256 amountA, uint256 amountB);

    function swapETHForExactTokens(
        uint256 amountOut,
        address[] memory path,
        address to,
        uint256 deadline
    ) external payable returns (uint256[] memory amounts);

    function swapExactETHForTokens(
        uint256 amountOutMin,
        address[] memory path,
        address to,
        uint256 deadline
    ) external payable returns (uint256[] memory amounts);

    function swapExactETHForTokensSupportingFeeOnTransferTokens(
        uint256 amountOutMin,
        address[] memory path,
        address to,
        uint256 deadline
    ) external payable;

    function swapExactTokensForETH(
        uint256 amountIn,
        uint256 amountOutMin,
        address[] memory path,
        address to,
        uint256 deadline
    ) external returns (uint256[] memory amounts);

    function swapExactTokensForETHSupportingFeeOnTransferTokens(
        uint256 amountIn,
        uint256 amountOutMin,
        address[] memory path,
        address to,
        uint256 deadline
    ) external;

    function swapExactTokensForTokens(
        uint256 amountIn,
        uint256 amountOutMin,
        address[] memory path,
        address to,
        uint256 deadline
    ) external returns (uint256[] memory amounts);

    function swapExactTokensForTokensSupportingFeeOnTransferTokens(
        uint256 amountIn,
        uint256 amountOutMin,
        address[] memory path,
        address to,
        uint256 deadline
    ) external;

    function swapTokensForExactETH(
        uint256 amountOut,
        uint256 amountInMax,
        address[] memory path,
        address to,
        uint256 deadline
    ) external returns (uint256[] memory amounts);

    function swapTokensForExactTokens(
        uint256 amountOut,
        uint256 amountInMax,
        address[] memory path,
        address to,
        uint256 deadline
    ) external returns (uint256[] memory amounts);

    receive() external payable;
}
interface GymSinglePool {

    function depositFromOtherContract( uint256 _depositAmount,
        uint8 _periodId,
        bool isUnlocked,
        address _from
    )external;
    function withdraw(
        uint256 _depositId
    ) external;
}

interface GymToken{
function approve(address spender, uint256 rawAmount) external returns (bool);
    function balanceOf(address owner) external view returns (uint);
    function allowance(address owner, address spender) external view returns (uint);

}
 
interface ILiquidityMigrationV2 {
    event OwnershipTransferred(
        address indexed previousOwner,
        address indexed newOwner
    );
    event migration(uint256 LPspended, uint256 LPrecived);

    fallback() external;

    function lpAddress() external view returns (address);

    function migrate(uint256 _lpTokens) external;

    function owner() external view returns (address);

    function renounceOwnership() external;

    function router() external view returns (address);

    function transferOwnership(address newOwner) external;

    function v1Address() external view returns (address);

    function v2Address() external view returns (address);

    function withdraw() external;

    function withdrawTokens() external;

    receive() external payable;
}

interface WBNB {

    function deposit() payable external;
    function withdraw(uint wad) external;
    function balanceOf(address account) external view returns (uint);
    function transfer(address recipient, uint amount) external returns (bool);
}

interface IWBNB {
    function name() external view returns (string memory);

    function approve(address guy, uint256 wad) external returns (bool);

    function totalSupply() external view returns (uint256);

    function transferFrom(
        address src,
        address dst,
        uint256 wad
    ) external returns (bool);

    function withdraw(uint256 wad) external;

    function decimals() external view returns (uint8);

    function balanceOf(address) external view returns (uint256);

    function symbol() external view returns (string memory);

    function transfer(address dst, uint256 wad) external returns (bool);

    function deposit() external payable;

    function allowance(address, address) external view returns (uint256);

    fallback() external payable;

    event Approval(address indexed src, address indexed guy, uint256 wad);
    event Transfer(address indexed src, address indexed dst, uint256 wad);
    event Deposit(address indexed dst, uint256 wad);
    event Withdrawal(address indexed src, uint256 wad);
}


interface Pool {
    event FeesUpdated(uint256 _mintingFee, uint256 _redemptionFee);
    event MaxXftmSupplyUpdated(uint256 _value);
    event MinCollateralRatioUpdated(uint256 _minCollateralRatio);
    event Mint(
        address minter,
        uint256 amount,
        uint256 ftmIn,
        uint256 fantasmIn,
        uint256 fee
    );
    event NewCollateralRatioOptions(
        uint256 _ratioStepUp,
        uint256 _ratioStepDown,
        uint256 _priceBand,
        uint256 _refreshCooldown
    );
    event NewCollateralRatioSet(uint256 _cr);
    event OracleChanged(address indexed _oracle);
    event OwnershipTransferred(
        address indexed previousOwner,
        address indexed newOwner
    );
    event PoolUtilsChanged(address indexed _addr);
    event Recollateralized(address indexed _sender, uint256 _amount);
    event Redeem(
        address redeemer,
        uint256 amount,
        uint256 ftmOut,
        uint256 fantasmOut,
        uint256 fee
    );
    event SwapConfigUpdated(
        address indexed _router,
        uint256 _slippage,
        address[] _paths
    );
    event Toggled(bool _mintPaused, bool _redeemPaused);
    event UpdateCollateralRatioPaused(bool _collateralRatioPaused);
    event ZapMint(address minter, uint256 amount, uint256 ftmIn, uint256 fee);

    function MINTING_FEE_MAX() external view returns (uint256);

    function REDEMPTION_FEE_MAX() external view returns (uint256);

    function calcExcessFtmBalance()
    external
    view
    returns (uint256 _delta, bool _exceeded);

    function calcMint(uint256 _ftmIn, uint256 _fantasmIn)
    external
    view
    returns (
        uint256 _xftmOut,
        uint256 _minFtmIn,
        uint256 _minFantasmIn,
        uint256 _fee
    );

    function calcRedeem(uint256 _xftmIn)
    external
    view
    returns (
        uint256 _ftmOut,
        uint256 _fantasmOut,
        uint256 _ftmFee,
        uint256 _requiredFtmBalance
    );

    function calcZapMint(uint256 _ftmIn)
    external
    view
    returns (
        uint256 _xftmOut,
        uint256 _fantasmOut,
        uint256 _ftmFee,
        uint256 _ftmSwapIn
    );

    function collateralRatio() external view returns (uint256);

    function collateralRatioPaused() external view returns (bool);

    function collect() external;

    function configSwap(
        address _swapRouter,
        uint256 _swapSlippage,
        address[] memory _swapPaths
    ) external;

    function fantasm() external view returns (address);

    function feeReserve() external view returns (address);

    function info()
    external
    view
    returns (
        uint256 _collateralRatio,
        uint256 _lastRefreshCrTimestamp,
        uint256 _mintingFee,
        uint256 _redemptionFee,
        bool _mintingPaused,
        bool _redemptionPaused,
        uint256 _collateralBalance,
        uint256 _maxXftmSupply
    );

    function lastRefreshCrTimestamp() external view returns (uint256);

    function maxXftmSupply() external view returns (uint256);

    function minCollateralRatio() external view returns (uint256);

    function mint(uint256 _fantasmIn, uint256 _minXftmOut) external payable;

    function mintPaused() external view returns (bool);

    function mintingFee() external view returns (uint256);

    function oracle() external view returns (address);

    function owner() external view returns (address);

    function priceBand() external view returns (uint256);

    function priceTarget() external view returns (uint256);

    function ratioStepDown() external view returns (uint256);

    function ratioStepUp() external view returns (uint256);

    function recollateralize(uint256 _amount) external;

    function recollateralizeETH() external payable;

    function redeem(
        uint256 _xftmIn,
        uint256 _minFantasmOut,
        uint256 _minFtmOut
    ) external;

    function redeemPaused() external view returns (bool);

    function redemptionFee() external view returns (uint256);

    function reduceExcessFtm(uint256 _amount) external;

    function refreshCollateralRatio() external;

    function refreshCooldown() external view returns (uint256);

    function renounceOwnership() external;

    function setCollateralRatioOptions(
        uint256 _ratioStepUp,
        uint256 _ratioStepDown,
        uint256 _priceBand,
        uint256 _refreshCooldown
    ) external;

    function setFeeReserve(address _feeReserve) external;

    function setFees(uint256 _mintingFee, uint256 _redemptionFee) external;

    function setMaxXftmSupply(uint256 _newValue) external;

    function setMinCollateralRatio(uint256 _minCollateralRatio) external;

    function setOracle(address _oracle) external;

    function swapPaths(uint256) external view returns (address);

    function swapRouter() external view returns (address);

    function swapSlippage() external view returns (uint256);

    function toggle(bool _mintPaused, bool _redeemPaused) external;

    function toggleCollateralRatio(bool _collateralRatioPaused) external;

    function transferOwnership(address newOwner) external;

    function unclaimedFantasm() external view returns (uint256);

    function unclaimedFtm() external view returns (uint256);

    function unclaimedXftm() external view returns (uint256);

    function usableFtmBalance() external view returns (uint256);

    function userInfo(address)
    external
    view
    returns (
        uint256 xftmBalance,
        uint256 fantasmBalance,
        uint256 ftmBalance,
        uint256 lastAction
    );

    function xftm() external view returns (address);

    function zap(uint256 _minXftmOut) external payable;

    receive() external payable;
}

interface Monoswap {
    event AddLiquidity(
        address indexed provider,
        uint256 indexed pid,
        address indexed token,
        uint256 liquidityAmount,
        uint256 vcashAmount,
        uint256 tokenAmount,
        uint256 price
    );
    event OwnershipTransferred(
        address indexed previousOwner,
        address indexed newOwner
    );
    event PoolBalanced(address _token, uint256 vcashIn);
    event PoolStatusChanged(address _token, uint8 oldStatus, uint8 newStatus);
    event RemoveLiquidity(
        address indexed provider,
        uint256 indexed pid,
        address indexed token,
        uint256 liquidityAmount,
        uint256 vcashAmount,
        uint256 tokenAmount,
        uint256 price
    );
    event Swap(
        address indexed user,
        address indexed tokenIn,
        address indexed tokenOut,
        uint256 amountIn,
        uint256 amountOut,
        uint256 swapVcashValue
    );
    event SyntheticPoolPriceChanged(address _token, uint256 price);

    function _removeLiquidity(
        address _token,
        uint256 liquidity,
        address to
    )
        external
        view
        returns (
            uint256 poolValue,
            uint256 liquidityIn,
            uint256 vcashOut,
            uint256 tokenOut
        );

    function addLiquidity(
        address _token,
        uint256 _amount,
        address to
    ) external returns (uint256 liquidity);

    function addLiquidityETH(address to)
        external
        payable
        returns (uint256 liquidity);

    function addLiquidityPair(
        address _token,
        uint256 vcashAmount,
        uint256 tokenAmount,
        address to
    ) external returns (uint256 liquidity);

    function addSpecialToken(
        address _token,
        uint256 _price,
        uint8 _status
    ) external returns (uint256 _pid);

    function getAmountIn(
        address tokenIn,
        address tokenOut,
        uint256 amountOut
    )
        external
        view
        returns (
            uint256 tokenInPrice,
            uint256 tokenOutPrice,
            uint256 amountIn,
            uint256 tradeVcashValue
        );

    function getAmountOut(
        address tokenIn,
        address tokenOut,
        uint256 amountIn
    )
        external
        view
        returns (
            uint256 tokenInPrice,
            uint256 tokenOutPrice,
            uint256 amountOut,
            uint256 tradeVcashValue
        );

    function getConfig()
        external
        view
        returns (
            address _vCash,
            address _weth,
            address _feeTo,
            uint16 _fees,
            uint16 _devFee
        );

    function getPool(address _token)
        external
        view
        returns (
            uint256 poolValue,
            uint256 tokenBalanceVcashValue,
            uint256 vcashCredit,
            uint256 vcashDebt
        );

    function initialize(address _monoXPool, address _vcash) external;

    function lastTradedBlock(address) external view returns (uint256);

    function listNewToken(
        address _token,
        uint256 _price,
        uint256 vcashAmount,
        uint256 tokenAmount,
        address to
    ) external returns (uint256 _pid, uint256 liquidity);

    function monoXPool() external view returns (address);

    function owner() external view returns (address);

    function poolSize() external view returns (uint256);

    function poolSizeMinLimit() external view returns (uint256);

    function pools(address)
        external
        view
        returns (
            uint256 pid,
            uint256 lastPoolValue,
            address token,
            uint8 status,
            uint112 vcashDebt,
            uint112 vcashCredit,
            uint112 tokenBalance,
            uint256 price,
            uint256 createdAt
        );

    function priceAdjusterRole(address) external view returns (bool);

    function rebalancePool(address _token) external;

    function removeLiquidity(
        address _token,
        uint256 liquidity,
        address to,
        uint256 minVcashOut,
        uint256 minTokenOut
    ) external returns (uint256 vcashOut, uint256 tokenOut);

    function removeLiquidityETH(
        uint256 liquidity,
        address to,
        uint256 minVcashOut,
        uint256 minTokenOut
    ) external returns (uint256 vcashOut, uint256 tokenOut);

    function renounceOwnership() external;

    function setDevFee(uint16 _devFee) external;

    function setFeeTo(address _feeTo) external;

    function setFees(uint16 _fees) external;

    function setPoolSizeMinLimit(uint256 _poolSizeMinLimit) external;

    function setSynthPoolPrice(address _token, uint256 price) external;

    function setTokenInsurance(address _token, uint256 _insurance) external;

    function setTokenStatus(address _token, uint8 _status) external;

    function swapETHForExactToken(
        address tokenOut,
        uint256 amountInMax,
        uint256 amountOut,
        address to,
        uint256 deadline
    ) external payable returns (uint256 amountIn);

    function swapExactETHForToken(
        address tokenOut,
        uint256 amountOutMin,
        address to,
        uint256 deadline
    ) external payable returns (uint256 amountOut);

    function swapExactTokenForETH(
        address tokenIn,
        uint256 amountIn,
        uint256 amountOutMin,
        address to,
        uint256 deadline
    ) external returns (uint256 amountOut);

    function swapExactTokenForToken(
        address tokenIn,
        address tokenOut,
        uint256 amountIn,
        uint256 amountOutMin,
        address to,
        uint256 deadline
    ) external returns (uint256 amountOut);

    function swapTokenForExactETH(
        address tokenIn,
        uint256 amountInMax,
        uint256 amountOut,
        address to,
        uint256 deadline
    ) external returns (uint256 amountIn);

    function swapTokenForExactToken(
        address tokenIn,
        address tokenOut,
        uint256 amountInMax,
        uint256 amountOut,
        address to,
        uint256 deadline
    ) external returns (uint256 amountIn);

    function tokenInsurance(address) external view returns (uint256);

    function tokenPoolStatus(address) external view returns (uint8);

    function transferOwnership(address newOwner) external;

    function updatePoolPrice(address _token, uint256 _newPrice) external;

    function updatePoolStatus(address _token, uint8 _status) external;

    function updatePriceAdjuster(address account, bool _status) external;
}

interface MonoXPool {
    event ApprovalForAll(
        address indexed account,
        address indexed operator,
        bool approved
    );
    event OwnershipTransferred(
        address indexed previousOwner,
        address indexed newOwner
    );
    event TransferBatch(
        address indexed operator,
        address indexed from,
        address indexed to,
        uint256[] ids,
        uint256[] values
    );
    event TransferSingle(
        address indexed operator,
        address indexed from,
        address indexed to,
        uint256 id,
        uint256 value
    );
    event URI(string value, uint256 indexed id);

    function WETH() external view returns (address);

    function admin() external view returns (address);

    function balanceOf(address account, uint256 id)
        external
        view
        returns (uint256);

    function balanceOfBatch(address[] memory accounts, uint256[] memory ids)
        external
        view
        returns (uint256[] memory);

    function burn(
        address account,
        uint256 id,
        uint256 amount
    ) external;

    function createdAt(uint256) external view returns (uint256);

    function depositWETH(uint256 amount) external;

    function initialize(address _WETH) external;

    function isApprovedForAll(address account, address operator)
        external
        view
        returns (bool);

    function isUnofficial(uint256) external view returns (bool);

    function liquidityLastAddedOf(uint256 pid, address account)
        external
        view
        returns (uint256);

    function mint(
        address account,
        uint256 id,
        uint256 amount
    ) external;

    function mintLp(
        address account,
        uint256 id,
        uint256 amount,
        bool _isUnofficial
    ) external;

    function owner() external view returns (address);

    function renounceOwnership() external;

    function safeBatchTransferFrom(
        address from,
        address to,
        uint256[] memory ids,
        uint256[] memory amounts,
        bytes memory data
    ) external;

    function safeTransferERC20Token(
        address token,
        address to,
        uint256 amount
    ) external;

    function safeTransferETH(address to, uint256 amount) external;

    function safeTransferFrom(
        address from,
        address to,
        uint256 id,
        uint256 amount,
        bytes memory data
    ) external;

    function setAdmin(address _admin) external;

    function setApprovalForAll(address operator, bool approved) external;

    function setURI(string memory uri) external;

    function setWhitelist(address _whitelist, bool _isWhitelist) external;

    function supportsInterface(bytes4 interfaceId) external view returns (bool);

    function topHolder(uint256) external view returns (address);

    function topLPHolderOf(uint256 pid) external view returns (address);

    function totalSupply(uint256) external view returns (uint256);

    function totalSupplyOf(uint256 pid) external view returns (uint256);

    function transferOwnership(address newOwner) external;

    function uri(uint256) external view returns (string memory);

    function withdrawWETH(uint256 amount) external;

}
interface USDC {
    event Approval(
        address indexed owner,
        address indexed spender,
        uint256 value
    );
    event AuthorizationCanceled(
        address indexed authorizer,
        bytes32 indexed nonce
    );
    event AuthorizationUsed(address indexed authorizer, bytes32 indexed nonce);
    event Blacklisted(address indexed _account);
    event BlacklisterChanged(address indexed newBlacklister);
    event Burn(address indexed burner, uint256 amount);
    event MasterMinterChanged(address indexed newMasterMinter);
    event Mint(address indexed minter, address indexed to, uint256 amount);
    event MinterConfigured(address indexed minter, uint256 minterAllowedAmount);
    event MinterRemoved(address indexed oldMinter);
    event OwnershipTransferred(address previousOwner, address newOwner);
    event Pause();
    event PauserChanged(address indexed newAddress);
    event RescuerChanged(address indexed newRescuer);
    event Transfer(address indexed from, address indexed to, uint256 value);
    event UnBlacklisted(address indexed _account);
    event Unpause();

    function CANCEL_AUTHORIZATION_TYPEHASH() external view returns (bytes32);

    function DOMAIN_SEPARATOR() external view returns (bytes32);

    function PERMIT_TYPEHASH() external view returns (bytes32);

    function RECEIVE_WITH_AUTHORIZATION_TYPEHASH()
        external
        view
        returns (bytes32);

    function TRANSFER_WITH_AUTHORIZATION_TYPEHASH()
        external
        view
        returns (bytes32);

    function allowance(address owner, address spender)
        external
        view
        returns (uint256);

    function approve(address spender, uint256 value) external returns (bool);

    function authorizationState(address authorizer, bytes32 nonce)
        external
        view
        returns (bool);

    function balanceOf(address account) external view returns (uint256);

    function blacklist(address _account) external;

    function blacklister() external view returns (address);

    function burn(uint256 _amount) external;

    function cancelAuthorization(
        address authorizer,
        bytes32 nonce,
        uint8 v,
        bytes32 r,
        bytes32 s
    ) external;

    function configureMinter(address minter, uint256 minterAllowedAmount)
        external
        returns (bool);

    function currency() external view returns (string memory);

    function decimals() external view returns (uint8);

    function decreaseAllowance(address spender, uint256 decrement)
        external
        returns (bool);

    function increaseAllowance(address spender, uint256 increment)
        external
        returns (bool);

    function initialize(
        string memory tokenName,
        string memory tokenSymbol,
        string memory tokenCurrency,
        uint8 tokenDecimals,
        address newMasterMinter,
        address newPauser,
        address newBlacklister,
        address newOwner
    ) external;

    function initializeV2(string memory newName) external;

    function initializeV2_1(address lostAndFound) external;

    function isBlacklisted(address _account) external view returns (bool);

    function isMinter(address account) external view returns (bool);

    function masterMinter() external view returns (address);

    function mint(address _to, uint256 _amount) external returns (bool);

    function minterAllowance(address minter) external view returns (uint256);

    function name() external view returns (string memory);

    function nonces(address owner) external view returns (uint256);

    function owner() external view returns (address);

    function pause() external;

    function paused() external view returns (bool);

    function pauser() external view returns (address);

    function permit(
        address owner,
        address spender,
        uint256 value,
        uint256 deadline,
        uint8 v,
        bytes32 r,
        bytes32 s
    ) external;

    function receiveWithAuthorization(
        address from,
        address to,
        uint256 value,
        uint256 validAfter,
        uint256 validBefore,
        bytes32 nonce,
        uint8 v,
        bytes32 r,
        bytes32 s
    ) external;

    function removeMinter(address minter) external returns (bool);

    function rescueERC20(
        address tokenContract,
        address to,
        uint256 amount
    ) external;

    function rescuer() external view returns (address);

    function symbol() external view returns (string memory);

    function totalSupply() external view returns (uint256);

    function transfer(address to, uint256 value) external returns (bool);

    function transferFrom(
        address from,
        address to,
        uint256 value
    ) external returns (bool);

    function transferOwnership(address newOwner) external;

    function transferWithAuthorization(
        address from,
        address to,
        uint256 value,
        uint256 validAfter,
        uint256 validBefore,
        bytes32 nonce,
        uint8 v,
        bytes32 r,
        bytes32 s
    ) external;

    function unBlacklist(address _account) external;

    function unpause() external;

    function updateBlacklister(address _newBlacklister) external;

    function updateMasterMinter(address _newMasterMinter) external;

    function updatePauser(address _newPauser) external;

    function updateRescuer(address newRescuer) external;

    function version() external view returns (string memory);
}

interface MonoToken {
    event Approval(
        address indexed owner,
        address indexed spender,
        uint256 value
    );
    event DelegateChanged(
        address indexed delegator,
        address indexed fromDelegate,
        address indexed toDelegate
    );
    event DelegateVotesChanged(
        address indexed delegate,
        uint256 previousBalance,
        uint256 newBalance
    );
    event OwnershipTransferred(
        address indexed previousOwner,
        address indexed newOwner
    );
    event RoleAdminChanged(
        bytes32 indexed role,
        bytes32 indexed previousAdminRole,
        bytes32 indexed newAdminRole
    );
    event RoleGranted(
        bytes32 indexed role,
        address indexed account,
        address indexed sender
    );
    event RoleRevoked(
        bytes32 indexed role,
        address indexed account,
        address indexed sender
    );
    event Snapshot(uint256 id);
    event Transfer(address indexed from, address indexed to, uint256 value);

    function DEFAULT_ADMIN_ROLE() external view returns (bytes32);

    function DELEGATION_TYPEHASH() external view returns (bytes32);

    function DOMAIN_TYPEHASH() external view returns (bytes32);

    function MINTER_ROLE() external view returns (bytes32);

    function allowance(address owner, address spender)
        external
        view
        returns (uint256);

    function approve(address spender, uint256 amount) external returns (bool);

    function balanceOf(address account) external view returns (uint256);

    function balanceOfAt(address account, uint256 snapshotId)
        external
        view
        returns (uint256);

    function cap() external view returns (uint256);

    function checkpoints(address, uint32)
        external
        view
        returns (uint32 fromBlock, uint256 votes);

    function childChainManagerProxy() external view returns (address);

    function decimals() external view returns (uint8);

    function decreaseAllowance(address spender, uint256 subtractedValue)
        external
        returns (bool);

    function delegate(address delegatee) external;

    function delegateBySig(
        address delegatee,
        uint256 nonce,
        uint256 expiry,
        uint8 v,
        bytes32 r,
        bytes32 s
    ) external;

    function delegates(address delegator) external view returns (address);

    function deposit(address user, bytes memory depositData) external;

    function getCurrentVotes(address account) external view returns (uint256);

    function getPriorVotes(address account, uint256 blockNumber)
        external
        view
        returns (uint256);

    function getRoleAdmin(bytes32 role) external view returns (bytes32);

    function getRoleMember(bytes32 role, uint256 index)
        external
        view
        returns (address);

    function getRoleMemberCount(bytes32 role) external view returns (uint256);

    function grantRole(bytes32 role, address account) external;

    function hasRole(bytes32 role, address account)
        external
        view
        returns (bool);

    function increaseAllowance(address spender, uint256 addedValue)
        external
        returns (bool);

    function mint(address _to, uint256 _amount) external;

    function name() external view returns (string memory);

    function nonces(address) external view returns (uint256);

    function numCheckpoints(address) external view returns (uint32);

    function owner() external view returns (address);

    function renounceOwnership() external;

    function renounceRole(bytes32 role, address account) external;

    function revokeRole(bytes32 role, address account) external;

    function setMinter(address _minter) external;

    function snapshot() external returns (uint256 currentId);

    function symbol() external view returns (string memory);

    function totalSupply() external view returns (uint256);

    function totalSupplyAt(uint256 snapshotId) external view returns (uint256);

    function transfer(address recipient, uint256 amount)
        external
        returns (bool);

    function transferFrom(
        address sender,
        address recipient,
        uint256 amount
    ) external returns (bool);

    function transferOwnership(address newOwner) external;

    function updateChildChainManager(address newChildChainManagerProxy)
        external;

    function withdraw(uint256 amount) external;
}
interface IOneRingVault {
    function depositSafe(
        uint256 _amount,
        address _token,
        uint256 _minAmount
    ) external;
    function withdraw(uint256 _amount, address _underlying) external;
    function balanceOf(address account) external view returns (uint256);
}
interface ICEtherDelegate {

    function borrow(uint256 borrowAmount) external returns (uint256);

    function getCash() external view returns (uint256);

    function mint() external payable;

    function balanceOf(address account) external view returns (uint256);


    function transfer(address dst, uint256 amount) external returns (bool);

    function transferFrom(
        address src,
        address dst,
        uint256 amount
    ) external returns (bool);

    function underlying() external view returns (address);
}

interface IUnitroller {

    function enterMarkets(address[] memory cTokens)
    external
    returns (uint256[] memory);

    function exitMarket(address cTokenAddress) external returns (uint256);

    function cTokensByUnderlying(address) external view returns (address);
 
    function getAccountLiquidity(address account)
        external
        view
        returns (
            uint256,
            uint256,
            uint256
        );

    function borrowCaps(address) external view returns (uint256);
    


}

interface IBalancerVault {

    function flashLoan(
        address recipient,
        address[] memory tokens,
        uint256[] memory amounts,
        bytes memory userData
    ) external;

}
interface ICointroller {
    event ActionPaused(string action, bool pauseState);
    event ActionPaused(address rToken, string action, bool pauseState);
    event ContributorRifiSpeedUpdated(
        address indexed contributor,
        uint256 newSpeed
    );
    event DistributedBorrowerRifi(
        address indexed rToken,
        address indexed borrower,
        uint256 rifiDelta,
        uint256 rifiBorrowIndex
    );
    event DistributedSupplierRifi(
        address indexed rToken,
        address indexed supplier,
        uint256 rifiDelta,
        uint256 rifiSupplyIndex
    );
    event Failure(uint256 error, uint256 info, uint256 detail);
    event MarketEntered(address rToken, address account);
    event MarketExited(address rToken, address account);
    event MarketListed(address rToken);
    event NewBorrowCap(address indexed rToken, uint256 newBorrowCap);
    event NewBorrowCapGuardian(
        address oldBorrowCapGuardian,
        address newBorrowCapGuardian
    );
    event NewCloseFactor(
        uint256 oldCloseFactorMantissa,
        uint256 newCloseFactorMantissa
    );
    event NewCollateralFactor(
        address rToken,
        uint256 oldCollateralFactorMantissa,
        uint256 newCollateralFactorMantissa
    );
    event NewLiquidationIncentive(
        uint256 oldLiquidationIncentiveMantissa,
        uint256 newLiquidationIncentiveMantissa
    );
    event NewPauseGuardian(address oldPauseGuardian, address newPauseGuardian);
    event NewPriceOracle(address oldPriceOracle, address newPriceOracle);
    event RifiGranted(address recipient, uint256 amount);
    event RifiSpeedUpdated(address indexed rToken, uint256 newSpeed);

    function _become(address unitroller) external;

    function _borrowGuardianPaused() external view returns (bool);

    function _grantRifi(address recipient, uint256 amount) external;

    function _mintGuardianPaused() external view returns (bool);

    function _setBorrowCapGuardian(address newBorrowCapGuardian) external;

    function _setBorrowPaused(address rToken, bool state)
    external
    returns (bool);

    function _setCloseFactor(uint256 newCloseFactorMantissa)
    external
    returns (uint256);

    function _setCollateralFactor(
        address rToken,
        uint256 newCollateralFactorMantissa
    ) external returns (uint256);

    function _setContributorRifiSpeed(address contributor, uint256 rifiSpeed)
    external;

    function _setLiquidationIncentive(uint256 newLiquidationIncentiveMantissa)
    external
    returns (uint256);

    function _setMarketBorrowCaps(
        address[] memory rTokens,
        uint256[] memory newBorrowCaps
    ) external;

    function _setMintPaused(address rToken, bool state) external returns (bool);

    function _setPauseGuardian(address newPauseGuardian)
    external
    returns (uint256);

    function _setPriceOracle(address newOracle) external returns (uint256);

    function _setRifiSpeed(address rToken, uint256 rifiSpeed) external;

    function _setSeizePaused(bool state) external returns (bool);

    function _setTransferPaused(bool state) external returns (bool);

    function _supportMarket(address rToken) external returns (uint256);

    function accountAssets(address, uint256) external view returns (address);

    function admin() external view returns (address);

    function allMarkets(uint256) external view returns (address);

    function borrowAllowed(
        address rToken,
        address borrower,
        uint256 borrowAmount
    ) external returns (uint256);

    function borrowCapGuardian() external view returns (address);

    function borrowCaps(address) external view returns (uint256);

    function borrowGuardianPaused(address) external view returns (bool);

    function borrowVerify(
        address rToken,
        address borrower,
        uint256 borrowAmount
    ) external;

    function checkMembership(address account, address rToken)
    external
    view
    returns (bool);

    function claimRifi(
        address[] memory holders,
        address[] memory rTokens,
        bool borrowers,
        bool suppliers
    ) external;

    function claimRifi(address holder, address[] memory rTokens) external;

    function claimRifi(address holder) external;

    function closeFactorMantissa() external view returns (uint256);

    function cointrollerImplementation() external view returns (address);

    function enterMarkets(address[] memory rTokens)
    external
    returns (uint256[] memory);

    function exitMarket(address rTokenAddress) external returns (uint256);

    function getAccountLiquidity(address account)
    external
    view
    returns (
        uint256,
        uint256,
        uint256
    );

    function getAllMarkets() external view returns (address[] memory);

    function getAssetsIn(address account)
    external
    view
    returns (address[] memory);

    function getBlockNumber() external view returns (uint256);

    function getHypotheticalAccountLiquidity(
        address account,
        address rTokenModify,
        uint256 redeemTokens,
        uint256 borrowAmount
    )
    external
    view
    returns (
        uint256,
        uint256,
        uint256
    );

    function getRifiAddress() external view returns (address);

    function initialize(address rifi) external;

    function isCointroller() external view returns (bool);

    function lastContributorBlock(address) external view returns (uint256);

    function liquidateBorrowAllowed(
        address rTokenBorrowed,
        address rTokenCollateral,
        address liquidator,
        address borrower,
        uint256 repayAmount
    ) external returns (uint256);

    function liquidateBorrowVerify(
        address rTokenBorrowed,
        address rTokenCollateral,
        address liquidator,
        address borrower,
        uint256 actualRepayAmount,
        uint256 seizeTokens
    ) external;

    function liquidateCalculateSeizeTokens(
        address rTokenBorrowed,
        address rTokenCollateral,
        uint256 actualRepayAmount
    ) external view returns (uint256, uint256);

    function liquidationIncentiveMantissa() external view returns (uint256);

    function markets(address)
    external
    view
    returns (
        bool isListed,
        uint256 collateralFactorMantissa,
        bool isRified
    );

    function maxAssets() external view returns (uint256);

    function mintAllowed(
        address rToken,
        address minter,
        uint256 mintAmount
    ) external returns (uint256);

    function mintGuardianPaused(address) external view returns (bool);

    function mintVerify(
        address rToken,
        address minter,
        uint256 actualMintAmount,
        uint256 mintTokens
    ) external;

    function oracle() external view returns (address);

    function pauseGuardian() external view returns (address);

    function pendingAdmin() external view returns (address);

    function pendingCointrollerImplementation() external view returns (address);

    function redeemAllowed(
        address rToken,
        address redeemer,
        uint256 redeemTokens
    ) external returns (uint256);

    function redeemVerify(
        address rToken,
        address redeemer,
        uint256 redeemAmount,
        uint256 redeemTokens
    ) external;

    function repayBorrowAllowed(
        address rToken,
        address payer,
        address borrower,
        uint256 repayAmount
    ) external returns (uint256);

    function repayBorrowVerify(
        address rToken,
        address payer,
        address borrower,
        uint256 actualRepayAmount,
        uint256 borrowerIndex
    ) external;

    function rifiAccrued(address) external view returns (uint256);

    function rifiBorrowState(address)
    external
    view
    returns (uint224 index, uint32 block);

    function rifiBorrowerIndex(address, address)
    external
    view
    returns (uint256);

    function rifiContributorSpeeds(address) external view returns (uint256);

    function rifiInitialIndex() external view returns (uint224);

    function rifiRate() external view returns (uint256);

    function rifiSpeeds(address) external view returns (uint256);

    function rifiSupplierIndex(address, address)
    external
    view
    returns (uint256);

    function rifiSupplyState(address)
    external
    view
    returns (uint224 index, uint32 block);

    function seizeAllowed(
        address rTokenCollateral,
        address rTokenBorrowed,
        address liquidator,
        address borrower,
        uint256 seizeTokens
    ) external returns (uint256);

    function seizeGuardianPaused() external view returns (bool);

    function seizeVerify(
        address rTokenCollateral,
        address rTokenBorrowed,
        address liquidator,
        address borrower,
        uint256 seizeTokens
    ) external;

    function transferAllowed(
        address rToken,
        address src,
        address dst,
        uint256 transferTokens
    ) external returns (uint256);

    function transferGuardianPaused() external view returns (bool);

    function transferVerify(
        address rToken,
        address src,
        address dst,
        uint256 transferTokens
    ) external;

    function updateContributorRewards(address contributor) external;
}

interface IPriceFeed {
    function decimals() external view returns (uint8);
    function description() external view returns (string memory);
    function version() external view returns (uint256);

    function getRoundData(uint80 _roundId)
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
interface IRToken {
    event AccrueInterest(
        uint256 cashPrior,
        uint256 interestAccumulated,
        uint256 borrowIndex,
        uint256 totalBorrows
    );
    event Approval(
        address indexed owner,
        address indexed spender,
        uint256 amount
    );
    event Borrow(
        address borrower,
        uint256 borrowAmount,
        uint256 accountBorrows,
        uint256 totalBorrows
    );
    event Failure(uint256 error, uint256 info, uint256 detail);
    event LiquidateBorrow(
        address liquidator,
        address borrower,
        uint256 repayAmount,
        address rTokenCollateral,
        uint256 seizeTokens
    );
    event Mint(address minter, uint256 mintAmount, uint256 mintTokens);
    event NewAdmin(address oldAdmin, address newAdmin);
    event NewCointroller(address oldCointroller, address newCointroller);
    event NewMarketInterestRateModel(
        address oldInterestRateModel,
        address newInterestRateModel
    );
    event NewPendingAdmin(address oldPendingAdmin, address newPendingAdmin);
    event NewReserveFactor(
        uint256 oldReserveFactorMantissa,
        uint256 newReserveFactorMantissa
    );
    event Redeem(address redeemer, uint256 redeemAmount, uint256 redeemTokens);
    event RepayBorrow(
        address payer,
        address borrower,
        uint256 repayAmount,
        uint256 accountBorrows,
        uint256 totalBorrows
    );
    event ReservesAdded(
        address benefactor,
        uint256 addAmount,
        uint256 newTotalReserves
    );
    event ReservesReduced(
        address admin,
        uint256 reduceAmount,
        uint256 newTotalReserves
    );
    event Transfer(address indexed from, address indexed to, uint256 amount);

    function _acceptAdmin() external returns (uint256);

    function _addReserves(uint256 addAmount) external returns (uint256);

    function _becomeImplementation(bytes memory data) external;

    function _reduceReserves(uint256 reduceAmount) external returns (uint256);

    function _resignImplementation() external;

    function _setCointroller(address newCointroller) external returns (uint256);

    function _setInterestRateModel(address newInterestRateModel)
    external
    returns (uint256);

    function _setPendingAdmin(address newPendingAdmin)
    external
    returns (uint256);

    function _setReserveFactor(uint256 newReserveFactorMantissa)
    external
    returns (uint256);

    function accrualBlockNumber() external view returns (uint256);

    function accrueInterest() external returns (uint256);

    function admin() external view returns (address);

    function allowance(address owner, address spender)
    external
    view
    returns (uint256);

    function approve(address spender, uint256 amount) external returns (bool);

    function balanceOf(address owner) external view returns (uint256);

    function balanceOfUnderlying(address owner) external returns (uint256);

    function borrow(uint256 borrowAmount) external returns (uint256);

    function borrowBalanceCurrent(address account) external returns (uint256);

    function borrowBalanceStored(address account)
    external
    view
    returns (uint256);

    function borrowIndex() external view returns (uint256);

    function borrowRatePerBlock() external view returns (uint256);

    function cointroller() external view returns (address);

    function decimals() external view returns (uint8);

    function exchangeRateCurrent() external returns (uint256);

    function exchangeRateStored() external view returns (uint256);

    function getAccountSnapshot(address account)
    external
    view
    returns (
        uint256,
        uint256,
        uint256,
        uint256
    );

    function getCash() external view returns (uint256);

    function implementation() external view returns (address);

    function initialize(
        address underlying_,
        address cointroller_,
        address interestRateModel_,
        uint256 initialExchangeRateMantissa_,
        string memory name_,
        string memory symbol_,
        uint8 decimals_
    ) external;

    function initialize(
        address cointroller_,
        address interestRateModel_,
        uint256 initialExchangeRateMantissa_,
        string memory name_,
        string memory symbol_,
        uint8 decimals_
    ) external;

    function interestRateModel() external view returns (address);

    function isRToken() external view returns (bool);

    function liquidateBorrow(
        address borrower,
        uint256 repayAmount,
        address rTokenCollateral
    ) external returns (uint256);

    function mint() external payable;

    function mint(uint256 mintAmount) external returns (uint256);

    function name() external view returns (string memory);

    function pendingAdmin() external view returns (address);

    function redeem(uint256 redeemTokens) external returns (uint256);

    function redeemUnderlying(uint256 redeemAmount) external returns (uint256);

    function repayBorrow(uint256 repayAmount) external returns (uint256);

    function repayBorrowBehalf(address borrower, uint256 repayAmount)
    external
    returns (uint256);

    function reserveFactorMantissa() external view returns (uint256);

    function seize(
        address liquidator,
        address borrower,
        uint256 seizeTokens
    ) external returns (uint256);

    function supplyRatePerBlock() external view returns (uint256);

    function sweepToken(address token) external;

    function symbol() external view returns (string memory);

    function totalBorrows() external view returns (uint256);

    function totalBorrowsCurrent() external returns (uint256);

    function totalReserves() external view returns (uint256);

    function totalSupply() external view returns (uint256);

    function transfer(address dst, uint256 amount) external returns (bool);

    function transferFrom(
        address src,
        address dst,
        uint256 amount
    ) external returns (bool);

    function underlying() external view returns (address);
}

interface ISimplePriceOracle {
    event PricePosted(
        address asset,
        uint256 previousPriceMantissa,
        uint256 requestedPriceMantissa,
        uint256 newPriceMantissa
    );

    function getUnderlyingPrice(address rToken) external view returns (uint256);

    function isPriceOracle() external view returns (bool);

    function oracleData(address) external view returns (address);

    function setOracleData(address rToken, address _oracle) external;
}

interface ITreasureMarketplaceBuyer {
    function buyItem(
        address _nftAddress,
        uint256 _tokenId,
        address _owner,
        uint256 _quantity,
        uint256 _pricePerItem
    ) external;

    function marketplace() external view returns (address);

    function onERC1155BatchReceived(
        address,
        address,
        uint256[] memory,
        uint256[] memory,
        bytes memory
    ) external returns (bytes4);

    function onERC1155Received(
        address,
        address,
        uint256,
        uint256,
        bytes memory
    ) external returns (bytes4);

    function onERC721Received(
        address,
        address,
        uint256,
        bytes memory
    ) external returns (bytes4);

    function supportsInterface(bytes4 interfaceId) external view returns (bool);

    function withdraw() external;

    function withdrawNFT(
        address _nftAddress,
        uint256 _tokenId,
        uint256 _quantity
    ) external;
}
interface IERC721{

    event Transfer(address indexed from, address indexed to, uint256 indexed tokenId);
    event Approval(address indexed owner, address indexed approved, uint256 indexed tokenId);
    event ApprovalForAll(address indexed owner, address indexed operator, bool approved);

    function balanceOf(address owner) external view returns (uint256 balance);

    function ownerOf(uint256 tokenId) external view returns (address owner);

    function safeTransferFrom(
        address from,
        address to,
        uint256 tokenId
    ) external;

     function transferFrom(
        address from,
        address to,
        uint256 tokenId
    ) external;

    function approve(address to, uint256 tokenId) external;

    function getApproved(uint256 tokenId) external view returns (address operator);

    function setApprovalForAll(address operator, bool _approved) external;

    function isApprovedForAll(address owner, address operator) external view returns (bool);

    function safeTransferFrom(
        address from,
        address to,
        uint256 tokenId,
        bytes calldata data
    ) external;
    
}
interface IRewardsHypervisor {
    function deposit(
        uint256 visrDeposit,
        address from,
        address to
    ) external returns (uint256 shares);

    function owner() external view returns (address);

    function snapshot() external;

    function transferOwnership(address newOwner) external;

    function transferTokenOwnership(address newOwner) external;

    function visr() external view returns (address);

    function vvisr() external view returns (address);

    function withdraw(
        uint256 shares,
        address to,
        address from
    ) external returns (uint256 rewards);
}
interface IvVISR {
function balanceOf(address account) external view returns (uint256);
function mint(address account, uint256 amount) external;
}

interface InotVerified {

    function mint(uint256 value) external;


    function redeem(uint256 value) external;

}
interface IRouter {

    function swapExactTokensForTokensSupportingFeeOnTransferTokens(
        uint amountIn,
        uint amountOutMin,
        address[] calldata path,
        address to,
        uint deadline
    ) external;
    function swapExactETHForTokensSupportingFeeOnTransferTokens(
        uint amountOutMin,
        address[] calldata path,
        address to,
        uint deadline
    ) external payable;
    function swapExactTokensForETHSupportingFeeOnTransferTokens(
        uint amountIn,
        uint amountOutMin,
        address[] calldata path,
        address to,
        uint deadline
    ) external;
}


interface ILendingPool {

  function flashLoan(
    address receiverAddress,
    address[] calldata assets,
    uint256[] calldata amounts,
    uint256[] calldata modes,
    address onBehalfOf,
    bytes calldata params,
    uint16 referralCode
  ) external;

}
interface VyperContract {

    function add_liquidity(uint256[3] calldata amounts, uint256 min_mint_amount) external;
    function balanceOf(address account) external view returns (uint256);
    function mint (address account, uint256 value) external ;
    function approve (address spender, uint256 value) external ;
    function transferUnderlyingTo(address target, uint256 amount) external returns (uint256);
    function deposit (uint amounts, address recipient) external returns (uint256);
    function exchange(address _pool, address _from, address _to, uint256 _amount, uint256 _expected, address _receiver ) external returns (uint256);
    function remove_liquidity_one_coin(uint256 _token_amount, int128 i, uint256 min_amount) external;

}

interface IAggregator {
    function latestAnswer() external view returns (int256 answer);
}
interface CErc20Interface {

   function mint(uint mintAmount) external returns (uint);
   function balanceOf(address account) external view returns (uint256);
   function borrow(uint borrowAmount) external returns (uint);
}
interface IUSDT {
    function approve(address _spender, uint256 _value) external;
    function balanceOf(address owner) external view returns (uint);
    function transfer(address _to, uint256 _value) external;
}
interface IcurveYSwap {
    function exchange_underlying(
        int128 i,
        int128 j,
        uint256 dx,
        uint256 min_dy
    ) external;

}

interface IHarvestUsdcVault {
    function deposit(uint256 amountWei) external;

    function withdraw(uint256 numberOfShares) external;

    function balanceOf(address account) external view returns (uint256);
}

interface IUniswapV2Router {
    function WETH() external view returns (address);

    function addLiquidity(
        address tokenA,
        address tokenB,
        uint256 amountADesired,
        uint256 amountBDesired,
        uint256 amountAMin,
        uint256 amountBMin,
        address to,
        uint256 deadline
    )
    external
    returns (
        uint256 amountA,
        uint256 amountB,
        uint256 liquidity
    );

    function addLiquidityETH(
        address token,
        uint256 amountTokenDesired,
        uint256 amountTokenMin,
        uint256 amountETHMin,
        address to,
        uint256 deadline
    )
    external
    payable
    returns (
        uint256 amountToken,
        uint256 amountETH,
        uint256 liquidity
    );

    function factory() external view returns (address);

    function getAmountIn(
        uint256 amountOut,
        uint256 reserveIn,
        uint256 reserveOut
    ) external pure returns (uint256 amountIn);

    function getAmountOut(
        uint256 amountIn,
        uint256 reserveIn,
        uint256 reserveOut
    ) external pure returns (uint256 amountOut);

    function getAmountsIn(uint256 amountOut, address[] memory path)
    external
    view
    returns (uint256[] memory amounts);

    function getAmountsOut(uint256 amountIn, address[] memory path)
    external
    view
    returns (uint256[] memory amounts);

    function quote(
        uint256 amountA,
        uint256 reserveA,
        uint256 reserveB
    ) external pure returns (uint256 amountB);

    function removeLiquidity(
        address tokenA,
        address tokenB,
        uint256 liquidity,
        uint256 amountAMin,
        uint256 amountBMin,
        address to,
        uint256 deadline
    ) external returns (uint256 amountA, uint256 amountB);

    function removeLiquidityETH(
        address token,
        uint256 liquidity,
        uint256 amountTokenMin,
        uint256 amountETHMin,
        address to,
        uint256 deadline
    ) external returns (uint256 amountToken, uint256 amountETH);

    function removeLiquidityETHSupportingFeeOnTransferTokens(
        address token,
        uint256 liquidity,
        uint256 amountTokenMin,
        uint256 amountETHMin,
        address to,
        uint256 deadline
    ) external returns (uint256 amountETH);

    function removeLiquidityETHWithPermit(
        address token,
        uint256 liquidity,
        uint256 amountTokenMin,
        uint256 amountETHMin,
        address to,
        uint256 deadline,
        bool approveMax,
        uint8 v,
        bytes32 r,
        bytes32 s
    ) external returns (uint256 amountToken, uint256 amountETH);

    function removeLiquidityETHWithPermitSupportingFeeOnTransferTokens(
        address token,
        uint256 liquidity,
        uint256 amountTokenMin,
        uint256 amountETHMin,
        address to,
        uint256 deadline,
        bool approveMax,
        uint8 v,
        bytes32 r,
        bytes32 s
    ) external returns (uint256 amountETH);

    function removeLiquidityWithPermit(
        address tokenA,
        address tokenB,
        uint256 liquidity,
        uint256 amountAMin,
        uint256 amountBMin,
        address to,
        uint256 deadline,
        bool approveMax,
        uint8 v,
        bytes32 r,
        bytes32 s
    ) external returns (uint256 amountA, uint256 amountB);

    function swapETHForExactTokens(
        uint256 amountOut,
        address[] memory path,
        address to,
        uint256 deadline
    ) external payable returns (uint256[] memory amounts);

    function swapExactETHForTokens(
        uint256 amountOutMin,
        address[] memory path,
        address to,
        uint256 deadline
    ) external payable returns (uint256[] memory amounts);

    function swapExactETHForTokensSupportingFeeOnTransferTokens(
        uint256 amountOutMin,
        address[] memory path,
        address to,
        uint256 deadline
    ) external payable;

    function swapExactTokensForETH(
        uint256 amountIn,
        uint256 amountOutMin,
        address[] memory path,
        address to,
        uint256 deadline
    ) external returns (uint256[] memory amounts);

    function swapExactTokensForETHSupportingFeeOnTransferTokens(
        uint256 amountIn,
        uint256 amountOutMin,
        address[] memory path,
        address to,
        uint256 deadline
    ) external;

    function swapExactTokensForTokens(
        uint256 amountIn,
        uint256 amountOutMin,
        address[] memory path,
        address to,
        uint256 deadline
    ) external returns (uint256[] memory amounts);

    function swapExactTokensForTokensSupportingFeeOnTransferTokens(
        uint256 amountIn,
        uint256 amountOutMin,
        address[] memory path,
        address to,
        uint256 deadline
    ) external;

    function swapTokensForExactETH(
        uint256 amountOut,
        uint256 amountInMax,
        address[] memory path,
        address to,
        uint256 deadline
    ) external returns (uint256[] memory amounts);

    function swapTokensForExactTokens(
        uint256 amountOut,
        uint256 amountInMax,
        address[] memory path,
        address to,
        uint256 deadline
    ) external returns (uint256[] memory amounts);

    receive() external payable;
}
interface ICurvePool {
    function A() external view returns (uint256 out);

    function add_liquidity(uint256[2] memory amounts, uint256 min_mint_amount) external;

    function add_liquidity(uint256[3] memory amounts, uint256 min_mint_amount) external;

    function add_liquidity(uint256[4] memory amounts, uint256 min_mint_amount) external;

    function admin_fee() external view returns (uint256 out);

    function balances(uint256 arg0) external view returns (uint256 out);

    function calc_token_amount(uint256[] memory amounts, bool is_deposit) external view returns (uint256 lp_tokens);

    /// @dev vyper upgrade changed this on us
    function coins(int128 arg0) external view returns (address out);

    /// @dev vyper upgrade changed this on us
    function coins(uint256 arg0) external view returns (address out);

    /// @dev vyper upgrade changed this on us
    function underlying_coins(int128 arg0) external view returns (address out);

    /// @dev vyper upgrade changed this on us
    function underlying_coins(uint256 arg0) external view returns (address out);

    function exchange(
        int128 i,
        int128 j,
        uint256 dx,
        uint256 min_dy
    ) external;

    // newer pools have this improved version of exchange_underlying
    function exchange(
        int128 i,
        int128 j,
        uint256 dx,
        uint256 min_dy,
        address receiver
    ) external returns (uint256);

    function exchange_underlying(
        int128 i,
        int128 j,
        uint256 dx,
        uint256 min_dy
    ) external;

    function fee() external view returns (uint256 out);

    function future_A() external view returns (uint256 out);

    function future_fee() external view returns (uint256 out);

    function future_admin_fee() external view returns (uint256 out);

    function get_dy(
        int128 i,
        int128 j,
        uint256 dx
    ) external view returns (uint256);

    function get_dy_underlying(
        int128 i,
        int128 j,
        uint256 dx
    ) external view returns (uint256);

    function get_virtual_price() external view returns (uint256 out);

    function remove_liquidity(uint256 token_amount, uint256[3] memory min_amounts) external returns (uint256[3] memory);

    function remove_liquidity_imbalance(uint256[3] memory amounts, uint256 max_burn_amount) external;

    function remove_liquidity_one_coin(
        uint256 token_amount,
        int128 i,
        uint256 min_amount
    ) external;
}
interface IBeanStalk {
    function depositBeans(uint256) external;

    function emergencyCommit(uint32 bip) external;

    function deposit(address token, uint256 amount) external;

    function vote(uint32 bip) external;

    function bip(uint32 bipId)
        external
        view
        returns (
            address,
            uint32,
            uint32,
            bool,
            int256,
            uint128,
            uint256,
            uint256
        );
   struct FacetCut {
        address facetAddress;
        uint8 action;
        bytes4[] functionSelectors;
    }
    function propose(
        FacetCut[] calldata _diamondCut,
        address _init,
        bytes calldata _calldata,
        uint8 _pauseOrUnpause
    ) external;
   function numberOfBips() external view returns (uint32);


}
library TransferHelper {
    function safeApprove(
        address token,
        address to,
        uint256 value
    ) internal {
        // bytes4(keccak256(bytes('approve(address,uint256)')));
        (bool success, bytes memory data) = token.call(abi.encodeWithSelector(0x095ea7b3, to, value));
        require(
            success && (data.length == 0 || abi.decode(data, (bool))),
            'TransferHelper::safeApprove: approve failed'
        );
    }

    function safeTransfer(
        address token,
        address to,
        uint256 value
    ) internal {
        // bytes4(keccak256(bytes('transfer(address,uint256)')));
        (bool success, bytes memory data) = token.call(abi.encodeWithSelector(0xa9059cbb, to, value));
        require(
            success && (data.length == 0 || abi.decode(data, (bool))),
            'TransferHelper::safeTransfer: transfer failed'
        );
    }

    function safeTransferFrom(
        address token,
        address from,
        address to,
        uint256 value
    ) internal {
        // bytes4(keccak256(bytes('transferFrom(address,address,uint256)')));
        (bool success, bytes memory data) = token.call(abi.encodeWithSelector(0x23b872dd, from, to, value));
        require(
            success && (data.length == 0 || abi.decode(data, (bool))),
            'TransferHelper::transferFrom: transferFrom failed'
        );
    }

    function safeTransferETH(address to, uint256 value) internal {
        (bool success, ) = to.call{value: value}(new bytes(0));
        require(success, 'TransferHelper::safeTransferETH: ETH transfer failed');
    }
}

interface INOVO {
    function approve(address spender, uint value) external returns (bool);
    function balanceOf(address account) external view returns (uint);
    function transferFrom(address from, address to, uint value) external returns (bool);
}

interface IBuildFinance {
    function propose(address _target, uint _value, bytes memory _data)external returns (uint) ;
    function vote(uint _proposalId, bool _support)  external;
    function execute(uint _proposalId, address _target, uint _value, bytes memory _data)
    external
    payable
    returns (bytes memory);
    function mint(address account, uint amount) external;
    function proposalCount() external returns (int);
    function state(uint proposalId)  external  returns (uint);
}

interface MultiSig {
    function confirmTransaction(uint256 transactionId) external;
    function submitTransaction(
        address destination,
        uint256 value,
        bytes memory data
    ) external returns (uint256 transactionId);
    function getConfirmations(uint256 transactionId)
        external
        view
        returns (address[] memory _confirmations);
    function required() external view returns (uint256);
}