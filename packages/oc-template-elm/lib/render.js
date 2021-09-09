const createPredicate = require('./to-be-published/get-js-from-url');
const tryGetCached = require('./to-be-published/try-get-cached');

module.exports = (options, callback) => {
  try {
    const url = options.model.elmComponent.src;
    const key = options.model.elmComponent.key;
    const flags = options.model.elmComponent.flags;
    const extractor = (key, context) => context.oc.elmComponents[key];
    const getJsFromUrl = createPredicate({
      key,
      url,
      extractor,
    });

    tryGetCached('elmComponent', key, getJsFromUrl, (err, CachedApp) => {
      if (err) return callback(err);
      try {
        // Render IT;
        const reactHtml = `${CachedApp}-${flags}`;

        const html = options.template(
          Object.assign({}, options.model, {
            __html: reactHtml,
          })
        );
        return callback(null, html);
      } catch (error) {
        return callback(error);
      }
    });
  } catch (err) {
    return callback(err);
  }
};
