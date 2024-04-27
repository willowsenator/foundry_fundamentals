-include .env

build: 
	forge build
clean: 
	forge clean
deploy_sepolia:
	forge script script/DeployFundMe.s.sol:DeployFundMe --rpc-url $(SEPOLIA_RPC_URL) --account sepoliakey --sender $(SENDER) --broadcast --verify --etherscan-api-key $(ETHERSCAN_API_KEY) -vvvv
