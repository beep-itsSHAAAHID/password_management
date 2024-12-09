const NotesContract = artifacts.require("PasswordManager");

module.exports = function (deployer){
deployer.deploy(NotesContract);
};