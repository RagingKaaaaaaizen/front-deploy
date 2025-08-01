declare const process: any;

export const environment = {
  production: true,
  apiUrl: process.env['API_URL'] || 'http://localhost:4000'
};
