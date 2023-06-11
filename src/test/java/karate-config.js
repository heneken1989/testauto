function fn() {
  var env = karate.env; // get system property 'karate.env'
  karate.log('karate.env system property was:', env);
  if (!env) {
    env = 'dev';
  }
  var config = {
    env: env,
    myVarName: 'someValue'
  }
  if (env == 'dev') {
    // customize
    // e.g. config.foo = 'bar';
  } else if (env == 'e2e') {
    // customize
  }
  config.baseUrl = "http://localhost/2208M0/ProjectGroup4/public/test/checkout/"

  karate.configure('logPrettyRequest',true);
  karate.configure('logPrettyResponse',true);
  karate.configure('headers', { Accept: 'application/json' });
  
  return config;
}