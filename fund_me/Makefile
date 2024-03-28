-include .env

build: 
	forge build
clean: 
	forge clean
deploy_sepolia:
	forge script script/DeployFundMe.s.sol:DeployFundMe --rpc-url $(SEPOLIA_RPC_URL) --account sepoliakey --sender 0x78961cDf31009Dd8E53aaEde7225Dc79475c6B83 --broadcast --verify --etherscan-api-key $(ETHERSCAN_API_KEY) -vvvv
