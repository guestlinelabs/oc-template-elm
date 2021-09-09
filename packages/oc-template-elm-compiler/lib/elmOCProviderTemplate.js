const elmOCProviderTemplate = ({ viewPath }) => `
  import Elm from '${viewPath}';

  export default Elm;
`;

module.exports = elmOCProviderTemplate;
