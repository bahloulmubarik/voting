// migrations/2_deploy_contracts.js
const VotingSystem = artifacts.require("VotingSystem");

module.exports = function(deployer) {
    deployer.deploy(VotingSystem);
};
