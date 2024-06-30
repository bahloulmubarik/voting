module.exports = {
  networks: {
    development: {
      host: "127.0.0.1",
      port: 7545,
      network_id: "5777", // Match Ganache network ID
    },
  },
  compilers: {
    solc: {
      version: "0.8.26", // Fetch exact version from solc-bin
    },
  },
};