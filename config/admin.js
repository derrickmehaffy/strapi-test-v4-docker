module.exports = ({ env }) => ({
  auth: {
    secret: env('ADMIN_JWT_SECRET', 'test1234'),
  },
  url: env('ADMIN_URL'),
  apiToken: {
    salt: env('API_TOKEN_SALT', 'test1234'),
  },
});
