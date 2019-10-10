let admin = require("firebase-admin");

var serviceAccount = require("sailawayeducation-firebase-adminsdk-or6k5-9553f4c22e.json");

let app = admin.initializeApp({
    credential: admin.credential.cert(serviceAccount),
    databaseURL: "https://sailawayeducation.firebaseio.com"
});

module.exports = ({ logger, config }) => {
    return sendNotification = async (to, isTopic, collapse_key, notification, data) => {

        let sendType = isTopic ? "topic" : "tokens";

        let message = {
            [sendType]: to,
            // collapse_key,
            // priority: 'high',
            // delay_while_idle: true,
            // dry_run: false,
            // badge: "1",
            // mutable_content: notification.mutable_content || false,
            // content_available: notification.content_available || false,
            // show_in_foreground: true,
            notification: {
                title: notification.title || config.appName,
                body: notification.body,
                // sound: notification.sound || 'default',
                // click_action: notification.click_action,
                // icon: "http://stellars.igeektech.com/assets/media/logos/logo-4.png",
            },
            data
        };

        app.messaging().send(message)
            .then((response) => {
                // Response is a message ID string.
                logger.info('Successfully sent message:', response);
            })
            .catch((error) => {
                logger.error('Error sending message:', error);
            });
    }
}