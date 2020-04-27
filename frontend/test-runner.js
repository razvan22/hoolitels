// run with npm test
// or npm --feature=featureFileName test
// for only running specific feature

let whatFeature = process.env.npm_config_feature;
if (whatFeature && !whatFeature.includes('.feature')) {
  whatFeature += '.feature';
}
//"test:selenium": "node node_modules/selenium-cucumber-js/index.js -f ./tests/selenium/features/ & exit 0",
let toRun = `./node_modules/selenium-cucumber-js/index.js -f ./tests/selenium/features/ & exit 0`

process.argv.push('-b', 'phantomjs')
if (whatFeature) {
  process.argv.push('-f', 'features/' + whatFeature);
}
require(toRun);