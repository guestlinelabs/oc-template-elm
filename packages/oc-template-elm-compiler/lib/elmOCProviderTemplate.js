const extractName = (path) => path.match(/(\w+)\.elm$/)[1];

const elmOCProviderTemplate = ({ viewPath }) => `
  import Component from '${viewPath}';

  export default Component.Elm["${extractName(viewPath)}"];
`;

module.exports = elmOCProviderTemplate;
