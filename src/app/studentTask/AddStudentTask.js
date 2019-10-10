const Operation = require('src/app/Operation');
const joi = require('joi');
const i18n = require('i18n');

class AddStudentTask extends Operation {
  constructor({ studentTasksRepository, studentsRepository,
    notificationsRepository, push, nodeMailer, usersRepository, familiesRepository }) {
    super();
    this.studentTasksRepository = studentTasksRepository,
      this.studentsRepository = studentsRepository,
      this.usersRepository = usersRepository,
      this.familiesRepository = familiesRepository,
      this.push = push,
      this.Op = require('sequelize').Op,
      this.nodeMailer = nodeMailer,
      this.notificationsRepository = notificationsRepository,
      this.familyValidationSchema = joi.object().keys({
        student_id: joi.string().required(),
        activity: joi.string().required(),
        title: joi.string().required(),
        desc: joi.string().required(),
        due_date: joi.date().iso().required()
      }),
      this.adminValidationSchema = joi.object().keys({
        students: joi.array().items(joi.object({
          student_id: joi.string().required(),
          user_id: joi.string().required(),
          email: joi.string().required()
        })).required(),
        activity: joi.string().required(),
        title: joi.string().required(),
        desc: joi.string().required(),
        due_date: joi.date().iso().required()
      });
  }

  async execute({ body, user, auth }) {
    const { SUCCESS, ERROR, VALIDATION_ERROR, STUDENT_NOT_EXIST, FAMILY_NOT_EXIST } = this.outputs;
    let userType = auth.strategy;

    try {
      let obj, studentBulkData = [], studentTaskData,
        notificationData, notificationBulkData = [],
        familyIds = [], familyData;

      switch (userType) {
        case 'family':
          obj = joi.validate(body, this.familyValidationSchema);

          if (obj.error) {
            const error = new Error('ValidationError');
            error.details = obj.error.details[0].message;

            throw error;
          }

          let isStudent = await this.studentsRepository._getByArgs({
            where: {
              id: body.student_id,
              user_id: user.id
            }
          })

          if (!isStudent) {
            const error = new Error(STUDENT_NOT_EXIST);
            throw error;
          }

          studentTaskData = await this.studentTasksRepository.add({ ...body, user_id: user.id });

          notificationData = await this.notificationsRepository.add({
            user_id: user.id,
            type: 'New Student Task',
            object_id: studentTaskData.id,
            object_type: 'student task'
          })

          this.push(`${user.id}`, true, "StudentTask", {
            title: i18n.__("notifications")["newStudentTask"].title,
            body: i18n.__("notifications")["newStudentTask"].body,
          }, {
              status: "newStudentTask",
              title: studentTaskData.title,
              desc: studentTaskData.desc
            })

          this.nodeMailer.sendMailTemplate.sendMail(
            user.email,
            "school_admin/student_task",
            {});

          this.emit(SUCCESS, studentTaskData);
          break;
        case 'school_admin':
        case 'school_manager':
        case 'school_staff':
          obj = joi.validate(body, this.adminValidationSchema);
          console.log(body);
          if (obj.error) {
            const error = new Error('ValidationError');
            error.details = obj.error.details[0].message;

            throw error;
          }
          for (const index in body.students) {
            console.log(body.students[index].user_id);
            let testFamly = await this.familiesRepository._getCustom({
              where: {
                user_id: body.students[index].user_id
              }
            })
            if (!testFamly) {
              const error = new Error(FAMILY_NOT_EXIST);
              throw error;
            }
            let emailData = {
              taskTitle: body.title,
              taskDescription: body.desc,
              dueDate: body.due_date
             }
          this.sendMail(testFamly.dataValues.f_email, emailData);
          }
          // let isStudent = await this.studentsRepository._getByArgs({
          //   where: {
          //     id: body.student_id,
          //     user_id: user.id
          //   }
          // })

          // if (!isStudent) {
          //   const error = new Error(STUDENT_NOT_EXIST);
          //   throw error;
          // }

          for (const index in body.students) {
            if (body.students.hasOwnProperty(index)) {
              const element = body.students[index];
              studentBulkData.push({
                student_id: element.student_id,
                activity: body.activity,
                title: body.title,
                desc: body.desc,
                due_date: body.due_date,
                user_id: element.user_id
              })
            }
          }

          studentTaskData = await this.studentTasksRepository.addBulk(studentBulkData);

          studentTaskData.forEach(element => {
            notificationBulkData.push({
              user_id: element.user_id,
              type: 'New Student Task',
              object_id: element.id,
              object_type: 'student task'
            })
            // familyIds.push("element.user_id");
          });
          console.log(studentTaskData);
          notificationData = await this.notificationsRepository.addBulk(notificationBulkData);

          // familyData = await this.usersRepository._getAllByArgs({
          //   where: {
          //     id: {
          //       [this.Op.in]: familyIds
          //     }
          //   }
          // })

          studentTaskData.forEach(async element => {
            this.push(`${element.user_id}`, true, "StudentTask", {
              title: i18n.__("notifications")["newStudentTask"].title,
              body: i18n.__("notifications")["newStudentTask"].body,
            }, {
                status: "newStudentTask",
                title: element.title,
                desc: element.desc
              });
          });

          // familyData.forEach(user => {
          //   this.sendMailTemplate.sendMail(
          //     user.email,
          //     "school_admin/student_task",
          //     {});
          // });

          body.students.forEach(async element => {
            await this.nodeMailer.sendMailTemplate(element.email, "family/student_task", {});
          });

          this.emit(SUCCESS, studentTaskData);
          break;
        default:
          break;
      }

    } catch (error) {
      switch (error.message) {
        case 'ValidationError':
          return this.emit(VALIDATION_ERROR, error);
        case STUDENT_NOT_EXIST:
          return this.emit(STUDENT_NOT_EXIST, error);
        case FAMILY_NOT_EXIST:
          return this.emit(FAMILY_NOT_EXIST, error);
        default:
          return this.emit(ERROR, error);
      }
    }
  }

  sendMail(emailTo, emailData) {
    var nodemailer = require('nodemailer');
    var mandrillTransport = require('nodemailer-mandrill-transport');

    /*
    * Configuring mandrill transport.
    * Copy your API key here.
    */

    var smtpTransport = nodemailer.createTransport(mandrillTransport({
      auth: {
        apiKey: '0yXvcMVjxB8acSB8wL6eGw'
      }
    }));

    // Put in email details.

    let mailOptions = {
      from: 'bobby@stellaracademic.com',
      to: emailTo,
      subject: 'New Task from school',
      html: 'You received a new task from school.<br>' + 'Task title: ' + emailData.taskTitle + '<br>'+ 'Task Description: ' + emailData.taskDescription + '<br>Due data: ' + emailData.dueDate,

    };
    // let mandrillOptions = {
    //   template_name: 'new-family-created'
    // }
    // Sending email.
    smtpTransport.sendMail(mailOptions, function (error, response) {
      if (error) {
        throw new Error('Error in sending email');
      }
      console.log('Message sent: ' + JSON.stringify(response));
      // res.send({ "msg": "message sent successfully" });
    });
  }
}

AddStudentTask.setOutputs(['SUCCESS', 'ERROR', 'VALIDATION_ERROR', 'STUDENT_NOT_EXIST', 'FAMILY_NOT_EXIST']);

module.exports = AddStudentTask;
