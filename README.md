# ethereum-private-node

Collection of hints and shell scripts that can be followed & used for creating & running a private Ethereum node.

## Setup Environment.

* Install latest version of [Node.JS](https://nodejs.org/en/).

* Install `Go-Ethereum` or [Geth](https://github.com/ethereum/go-ethereum/wiki/Installing-Geth).


## How to create a private Ethereum node.

* Open a terminal box, go to your home directory (e.g. Type `cd ~`, `cd $HOME`) and create a new directory (e.g. `mkdir -p ethereum/MyEthNode`).

* Go to the created new directory (e.g. `cd ethereum/MyEthNode`).

* Clone this repository, by running `git clone` command.

* Rename the cloned repository's directory to `private` (e.g. `mv ethereum-private-node private`).

* Run `./init.sh <name of network>` command (e.g. `./init.sh MyEthNode.json`).

* On the shown wizard menu, do:

	* On `What would you like to do?` menu, choose `2. Configure new genesis`

	* On `Which consensus engine to use?` menu, choose `1. Ethash - proof-of-work`

	* On `Which accounts should be pre-funded?`, press Enter.

	* On `Specify your chain/network ID if you want an explicit one`, enter any number (e.g. 4424) and make note the entered Network ID.

	* On `What would you like to do?` menu, choose `2. Manage existing genesis`, then choose `2. Export genesis configuration`.

	* On `Which file to save the genesis into?` menu, press Enter.

	* Press `CTL`+`C` to quit this wizard. Confirm that there is a .JSON file, `geth` and `keystore` directories are created in current directory.

* Run `./newacc.sh` to create 1st account. Make note the entered password. Repeat this step multiple times to create as many accounts as you desire.

* Edit the `password.sec` file and replace the text with password of 1st account that you've created in prior step. 

* Open & edit `startnode.sh` file, change the `NETWORKID` variable with the Network ID you've noted from prior step. Save the changed file.

* Run `./startnode.sh` to run the Ethereum node. 

## How to interact with the private Ethereum node.

Run `geth attach` command, to interact with running private node. If running the command is succeded, there will be a shell prompt appear. Below are things that we could do by running commands on the shell prompt.

### Accounts and Balance.

* Run `eth.accounts` command for displaying an array of account addresses.

* Run `eth.coinbase` command to display the address of account's coinbase (account which take Ethers from mining processes).

* Run `eth.getBalance(eth.coinbase)` command for displaying coinbase account's balance, in `wei`.

* Run `web3.fromWei(eth.getBalance(eth.coinbase))` command for displaying coinbase account's balance, in `ether`.

* Run `eth.getBalance(eth.accounts[2])` command for displaying the balance of account #3, in `wei`.

* Run `web3.fromWei(eth.getBalance(eth.accounts[2]))` command for displaying the balance of account #3, in `ether`.

* Run `personal.unlockAccount(eth.accounts[2])` command to unlock account #3. Note: unlocking an account is needed for sending ether from the target account.

* Run `personal.unlockAccount(eth.accounts[2], "test1234", 300)` command to unlock account #3 whose password is `test1234`, for 300 seconds.

* Run `personal.lockAccount(eth.accounts[2])` command to lock account #3, preventing it from being used for sending ether. 


### Miner.

* Run `miner.stop` to stop the mining process.

* Run `miner.start(2)` to start the mining process which occupy 2 CPU threads.

### Sending Ether from Coinbase account to other account.

* Run `eth.sendTransaction({from: eth.coinbase, to: eth.accounts[2], value: web3.toWei('40', 'ether')})` to send `40 Ether` from coinbase account to account #3.

### Sending Ether from an account to another account.

* Run `personal.unlockAccount(eth.accounts[1], "test1234", 300)` command to unlock account #2 whose password is `test1234`, for 300 seconds.

* Run `eth.sendTransaction({from: eth.accounts[1], to: eth.accounts[2], value: web3.toWei('5', 'ether')})` command to send `5 ether` from account #2 to account account #3.

## How to connect metamask to the private Ethereum network

TBD

