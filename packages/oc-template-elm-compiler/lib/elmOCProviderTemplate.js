const extractName = (path) => path.match(/(\w+)\.elm$/)[1];

const elmOCProviderTemplate = ({ viewPath }) => `
  import Component from '${viewPath}';

  function getData(providerProps, parameters, cb) {
    return window.oc.getData({
      name: providerProps._componentName,
      version: providerProps._componentVersion,
      baseUrl: providerProps._baseUrl,
      parameters
    }, (err, data) => {
      if (err) {
        return cb(err);
      }
      const { _staticPath, _baseUrl, _componentName, _componentVersion, ...rest } = data.elmComponent.flags; 
      cb(null, rest);
    });
  }

  function init({ node, flags: { _baseUrl, _componentName, _componentVersion, _staticPath, ...flags } }) {
    const app = Component.Elm["${extractName(viewPath)}"].init({ node, flags });

    if (app.ports) {
      if (app.ports.requestData) {
        app.ports.requestData.subscribe(parameters => {
          getData({ _baseUrl, _componentName, _componentVersion }, parameters, (err, data) => {
            if (!err && app.ports.dataReceiver) {
              app.ports.dataReceiver.send(data);
            }
          });
        });
      }
    }

    return app;
  }

  export default init;
`;

module.exports = elmOCProviderTemplate;
