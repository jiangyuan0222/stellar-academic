const path = require('path');
const i18n = require('i18n');

module.exports = i18n.configure({
    locales: ['en'],
    directory: __dirname,
    defaultLocale: 'en'
});