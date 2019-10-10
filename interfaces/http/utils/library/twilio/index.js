module.exports = ({ logger, config }) => {
    var accountSid = config.accountSid; // Your Account SID from www.twilio.com/console
    var authToken = config.authToken;   // Your Auth Token from www.twilio.com/console

    var twilio = require('twilio');
    var client = new twilio(accountSid, authToken);


    const sendSMS = async (to, body) => {
        let { error, res } = client.messages.create({
            body,
            to,  // Text this number
            from: '+12345678901' // From a valid Twilio number
        })

        if (error) {
            logger.error(`Error in sending SMS to ${to} : ${error}`);
        }

        logger.info(`SMS sent to ${to}`);
    }
}