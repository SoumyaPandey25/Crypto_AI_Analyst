import { ethers } from 'hardhat';

async function main() {
  const PrivacyPreferences = await ethers.getContractFactory('PrivacyPreferences');
  const privacy = await PrivacyPreferences.deploy();
  await privacy.deployed();
  console.log('PrivacyPreferences deployed to:', privacy.address);
}

main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
