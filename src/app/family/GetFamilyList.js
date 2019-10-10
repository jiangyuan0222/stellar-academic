const Operation = require('src/app/Operation');
const joi = require('joi');

class GetFamilyList extends Operation {
  constructor({ familiesRepository, logger, UserModel, StudentModel, database }) {
    super();
    this.familiesRepository = familiesRepository,
      this.UserModel = UserModel,
      this.StudentModel = StudentModel,
      this.database = database,
      this.logger = logger,
      this.schoolAdminValidationSchema = joi.object().keys({
        orderBy: joi.string().valid('created_at', 'updated_at').optional(),
        orderType: joi.string().valid('DESC', 'ASC').optional(),
        student: joi.boolean().optional(),
        status: joi.string().valid('Active', 'Banned', 'graduated',
          'withdrawn',
          'pending_approval',
          'pending_re_enrollment').optional(),
        limit: joi.number().min(5).optional(),
        skip: joi.number().optional()
      });
  }

  async execute({ user, auth, body }) {
    const { SUCCESS, ERROR, FAMILY_NOT_EXIST } = this.outputs;
    console.log(auth.value.school_id);
    let userType = auth.strategy, query_obj,
      orderBy = body.orderBy || 'created_at',
      orderType = body.orderType || 'DESC';

    try {
      let familyData, totalFamilyCount;
      switch (userType) {
        case 'super_admin':
          query_obj = {
            include: [{
              model: this.UserModel
            }]
          };

          if (body.status) query_obj.where.status = body.status;

          if (body.skip) {
            query_obj.offset = body.skip;
          }

          if (body.limit) {
            query_obj.limit = body.limit;
          }

          familyData = await this.familiesRepository._getAllByArgs(query_obj);

          if (!familyData) {
            throw new Error(FAMILY_NOT_EXIST);
          }

          this.emit(SUCCESS, familyData);
          break;
        case 'school_admin':
        case 'school_manager':
        case 'school_staff':
          console.log("here");
          query_obj = {
            subQuery: false,
            attributes: {
              include: [
                [
                  this.database.fn("COUNT", this.database.col("students.id")),
                  "total_student"
                ]
              ]
            },
            include: [
              {
                model: this.UserModel
              },
              {
                model: this.StudentModel,
                attributes: [],
                as: "students"
              }
              // {
              //   model: this.StudentModel,
              //   attributes: [],
              //   separate: true,
              //   as: 'students'
              // }
            ],
            order: [[orderBy, orderType]],
            group: ["families.id"],
            where: {
              school_id: auth.value.school_id
            }
          };

          if (body.status) query_obj.where.status = body.status;

          if (body.skip) {
            query_obj.offset = body.skip;
          }

          if (body.limit) {
            query_obj.limit = body.limit;
          }

          if (body.student) {
            query_obj.include[1].attributes =
              query_obj.include[1].attributes.concat(['first_name', 'last_name', 'gender', 'grade_level']);
          }

          familyData = await this.familiesRepository._getAllByArgs(query_obj);

          // if (!familyData) {
          //   throw new Error(FAMILY_NOT_EXIST);
          // }

          delete query_obj.limit;
          delete query_obj.offset;
          delete query_obj.include;
          delete query_obj.order;
          delete query_obj.group;

          totalFamilyCount = await this.familiesRepository._countByArgs(query_obj)

          this.emit(SUCCESS, {
            data: familyData,
            total_count: totalFamilyCount
          });
          break;
        default:
          this.logger.error(`Invalid user type : ${userType}`);
          break;
      }

    } catch (error) {
      if (error.message === 'FAMILY_NOT_EXIST') {
        return this.emit(FAMILY_NOT_EXIST, error);
      }
      this.emit(ERROR, error);
    }
  }
}

GetFamilyList.setOutputs(['SUCCESS', 'ERROR', 'FAMILY_NOT_EXIST']);

module.exports = GetFamilyList;
