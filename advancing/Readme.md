# Key notes

## `Block`

```sh
block.basefee (uint256) # Current block’s base fee (EIP-3198 and EIP-1559)
block.chainid (uint256) # Current chain id
block.coinbase (address payable) # Current block miner’s address
block.difficulty(uint256) # Outdated old block difficulty, but since the Ethereum mainnet upgrade called Paris as part of ‘The Merge’ in September 2022 it is now deprecated and represents prevrandao : a value from the randomness generation process called Randao (see EIP-4399 for details)
block.gaslimit (uint256) # Current block gaslimit
block.number (uint256)# Current block number
block.timestamp(uint256) # Current block timestamp in seconds since Unix epoch
blockhash(uint256 blockNumber) returns(bytes32) # Hash of the given block - only works for 256 most recent blocks
```

```sh
gasleft() returns(uint256) # Remaining gas
msg.data (bytes) # Complete calldata
msg.sender(address) # Sender of the message (current call)
msg.sig (bytes4) # First four bytes of the calldata (i.e. function identifier)
msg.value(uint256) # Number of wei sent with the message
tx.gasprice(uint256) # Gas price of the transaction
tx.origin(address) # Sender of the transaction (full call chain)
```

## `ABI`

```sh
abi.decode(bytes memory encodedData, (...)) returns (...)   # ABI-decodes the provided data. The types are given in parentheses as second argument. Example: (uint256 a, uint256[2]
memory b, bytes memory c) = abi.decode(data, (uint256, uint256[2], bytes)) abi.encode(...) returns (bytes memory) # ABI-encodes the given arguments abi.encodePacked(...) returns
(bytes memory) # Performs packed encoding of the given arguments. Note that this encoding can be ambiguous!
abi.encodeWithSelector(bytes4 selector, ...) returns (bytes memory) # ABI-encodes the given arguments starting from the second and prepends the given four-byte selector
abi.encodeCall(function functionPointer, (...)) returns (bytes memory) # ABI-encodes a call to functionPointer with the arguments found in the tuple. Performs a full type-check, ensuring the types match the function signature. Result equals abi.encodeWithSelector(functionPointer.selector, (...))
abi.encodeWithSignature(string memory signature, ...) returns(bytes memory) # Equivalent to abi.encodeWithSelector(bytes4(keccak256(bytes(signature)), ...)
```

## `Type`

```sh
type(C).name (string) # The name of the contract
type(C).creationCode (bytes memory) # Creation bytecode of the given contract.
type(C).runtimeCode (bytes memory) # Runtime bytecode of the given contract.
13type(I).interfaceId (bytes4) # Value containing the EIP-165 interface identifier of the given
type(T).min (T) # The minimum value representable by the integer type T.
type(T).max (T) # The maximum value representable by the integer type T.
```

## `Cryptography`

```sh
keccak256(bytes memory) returns(bytes32)
# Compute the Keccak-256 hash of the input
```

```sh
sha256(bytes memory) returns(bytes32)
# Compute the SHA-256 hash of the input
```

```sh
ripemd160(bytes memory) returns(bytes20)
# Compute the RIPEMD-160 hash of the input
```

```sh
ecrecover(bytes32 hash, uint8 v, bytes32 r, bytes32 s) returns(address)
# Recover address associated with the public key from elliptic curve signature, return zero on error
```

```sh
addmod(uint256 x, uint256 y, uint256 k) returns (uint256)
# Compute (x + y) % k where the addition is performed with
# arbitrary precision and does not wrap around at 2··256.
# Assert that k != 0.
```

```sh
mulmod(uint256 x, uint256 y, uint256 k) returns (uint256)
# Compute (x * y) % k where the multiplication is performed
# with arbitrary precision and does not wrap around at 2··256.
# Assert that k != 0.
```

## `Misc`

```sh
bytes.concat(...) returns(bytes memory)
# Concatenates variable number of arguments to one byte array
```

```sh
string.concat(...) returns(string memory)
# Concatenates variable number of arguments to one string array this (current contract’s
# type)The current contract, explicitly convertible to address or address payable
```

```sh
super
# The contract one level higher in the inheritance hierarchy
```

```sh
selfdestruct(address
payable recipient)
# Destroy the current contract, sending its funds to the given address. Does not give gas refunds anymore since LONDON hardfork.
```
