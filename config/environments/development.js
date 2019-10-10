const path = require('path');
const logPath = path.join(__dirname, '../../logs/development.log');

module.exports = {
  web: {
    port: 3001
  },

  appName: "Sailaway Education",

  logging: {
    appenders: {
      stdout: { type: 'stdout' },
      stderr: { type: 'stderr' },
      errors: { type: 'file', filename: logPath },
      fileFilter: { type: 'logLevelFilter', appender: 'errors', level: 'ERROR' },
      stderrFilter: { type: 'logLevelFilter', appender: 'stderr', level: 'ERROR' }
    },
    categories: {
      default: { appenders: ['fileFilter', 'stderrFilter', 'stdout'], level: 'DEBUG' }
    }
  },

  nodeMailer: {
    from: '"Stellar Academic" <stellaracademic@gmail.cab>',
    // host: "smtp-relay.gmail.com",
    // host: 'smtp.ethereal.email',
    host: 'smtp.mandrillapp.com',
    // port: 465,
    // secure: true,
    port: 587,
    secure: false,
    // service: 'Gmail',
    auth: {
      // user: "bobby@stellaracademic.com",
      // pass: "Ian031912!"
      user: "Stellar Academic",
      pass: "0yXvcMVjxB8acSB8wL6eGw"
    }
  },

  twilio: {
    accountSid: process.env.TWILIO_ACCOUNT_SID,
    authToken: process.env.TWILIO_AUTH_TOKEN
  }
};