module.exports = {
  networks: {
    development: {
      host: "127.0.0.1",
      port: 7545,
      network_id: "*", // Match any network id
      gas: 6721975,    // Adjust gas limit if necessary
    },
    goerli: {
      provider: () => new HDWalletProvider(MNEMONIC, `https://goerli.infura.io/v3/${PROJECT_ID}`),
      network_id: 5,       // Goerli's id
      confirmations: 2,    // Wait for 2 confirmations
      timeoutBlocks: 200,  // Wait 200 blocks before deployment times out
      skipDryRun: true     // Skip dry run
    }
  },
  compilers: {
    solc: {
      version: "0.8.19"
    }
  }
};
