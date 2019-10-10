"use strict";
const nodemailer = require("nodemailer");
const Email = require('email-templates');
const moment = require('moment');

module.exports = ({ config, logger }) => {
    let transporter = nodemailer.createTransport(config.nodeMailer);

    // verify connection configuration
    transporter.verify(function (error, success) {
        if (error) {
            console.log(error);
        } else {
            console.log("Server is ready to take our messages");
        }
    });


    const email = new Email({
        message: {
            from: config.nodeMailer.from || 'pradipbhuvani.ibl@gmail.com'
        },
        // uncomment below to send emails in development/test env:
        send: true,
        preview: false,
        transport: transporter
    });

    const sendMail = async (to, subject, text) => {
        let { error, data } = await transporter.sendMail({
            from: config.nodeMailer.from || '"Fred Foo 👻" <foo@example.com>', // sender address
            to: to || "bar@example.com, baz@example.com", // list of receivers
            subject: subject || "Hello ✔", // Subject line
            text: text || "Hello world?", // plain text body
        });

        if (error) {
            logger.error(`Error in sending email to ${to} : ${error}`);
        }

        console.log(data);
        console.log(error);

        logger.info(`Mail sent to ${to}`);
    }

    const sendMailTemplate = async (to, template, locals) => {
        let { error, res } = await email
            .send({
                template: template || "test",
                message: {
                    to: to
                },
                locals: locals || 'en'
            })
        if (error) {
            logger.error(`Error in sending email to ${to} : ${error}`);
        }

        logger.info(`Mail sent to ${to}`);
    }

    var mandrill = require('mandrill-api/mandrill');
    var mandrill_client = new mandrill.Mandrill("0yXvcMVjxB8acSB8wL6eGw");
    // let mandrill = require('node-mandrill')("0yXvcMVjxB8acSB8wL6eGw");

    const sendMandrillEmail = async () => {
        // mandrill('/messages/send', {
        //     message: {
        //         to: [{
        //             email: "kirangadhiya.ibl@gmail.com"
        //         }],
        //         from_email: 'stellaracademic@gmail.cab',
        //         subject: "Verification",
        //         text: "Your verification code for login in NEPTOON is 4545."
        //     }
        // }, (error, response) => {
        //     //uh oh, there was an error
        //     if (error) {
        //         console.log(error);
        //         // console.log(JSON.stringify(error));
        //         // return reject();
        //     }

        //     //everything's good, lets see what mandrill said
        //     else {
        //         console.log(response);
        //         // console.log(response);
        //         // return resolve();
        //     }
        // });



        var message = {
            "html": "<p>Example HTML content</p>",
            "text": "Example text content",
            "subject": "example subject",
            "from_email": "message.from_email@example.com",
            "from_name": "Example Name",
            "to": [{
                "email": "pradipb255@gmail.com",
                "name": "Pradip bhuvani",
                "type": "to"
            }],
            "headers": {
                "Reply-To": "message.reply@example.com"
            },
            "important": false,
            "track_opens": null,
            "track_clicks": null,
            "auto_text": null,
            "auto_html": null,
            "inline_css": null,
            "url_strip_qs": null,
            "preserve_recipients": null,
            "view_content_link": null,
            "bcc_address": "message.bcc_address@example.com",
            "tracking_domain": null,
            "signing_domain": null,
            "return_path_domain": null,
            "merge": true,
            "merge_language": "mailchimp",
            "global_merge_vars": [{
                "name": "merge1",
                "content": "merge1 content"
            }],
            "merge_vars": [{
                "rcpt": "recipient.email@example.com",
                "vars": [{
                    "name": "merge2",
                    "content": "merge2 content"
                }]
            }],
            "tags": [
                "password-resets"
            ],
            "subaccount": "customer-123",
            "google_analytics_domains": [
                "example.com"
            ],
            "google_analytics_campaign": "message.from_email@example.com",
            "metadata": {
                "website": "www.example.com"
            },
            "recipient_metadata": [{
                "rcpt": "recipient.email@example.com",
                "values": {
                    "user_id": 123456
                }
            }],
            "attachments": [{
                "type": "text/plain",
                "name": "myfile.txt",
                "content": "ZXhhbXBsZSBmaWxl"
            }],
            "images": [{
                "type": "image/png",
                "name": "IMAGECID",
                "content": "ZXhhbXBsZSBmaWxl"
            }]
        };
        var async = false;
        var ip_pool = "Main Pool";
        var send_at = "example send_at";
        mandrill_client.messages.send({
            "message": message,
            "async": async,
            "ip_pool": ip_pool,
            "send_at": moment().utc().toString()
        }, function (result) {
            console.log(result);
            /*
            [{
                    "email": "recipient.email@example.com",
                    "status": "sent",
                    "reject_reason": "hard-bounce",
                    "_id": "abc123abc123abc123abc123abc123"
                }]
            */
        }, function (e) {
            // Mandrill returns the error as an object with name and message keys
            console.log('A mandrill error occurred: ' + e.name + ' - ' + e.message);
            // A mandrill error occurred: Unknown_Subaccount - No subaccount exists with the id 'customer-123'
        });
    }

    return {
        sendMail,
        sendMailTemplate,
        sendMandrillEmail
    }
}
