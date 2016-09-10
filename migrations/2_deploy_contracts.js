module.exports = function(deployer) {
  deployer.deploy(GovContracts);
  deployer.autolink();
};
