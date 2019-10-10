const Operation = require('src/app/Operation');
const joi = require('joi');

class GetAllTag extends Operation {
  constructor({ resourcesRepository }) {
    super();
    this.resourcesRepository = resourcesRepository,
      this.Op = require('sequelize').Op,
      this.familyValidationSchema = joi.object().keys({
        orderBy: joi.string().valid('created_at', 'updated_at').optional(),
        orderType: joi.string().valid('DESC', 'ASC').optional(),
        searchText: joi.string().optional(),
        limit: joi.number().min(5).optional(),
        skip: joi.number().optional()
      }),
      this.schoolAdminValidationSchema = joi.object().keys({
        orderBy: joi.string().valid('created_at', 'updated_at').optional(),
        orderType: joi.string().valid('DESC', 'ASC').optional(),
        searchText: joi.string().optional(),
        limit: joi.number().min(5).optional(),
        skip: joi.number().optional()
      });
  }

  async execute({ user, auth, body }) {
    const { SUCCESS, ERROR, VALIDATION_ERROR } = this.outputs;
    let query_obj, tagData,
      userType = auth.strategy,
      orderBy = body.orderBy || 'created_at',
      orderType = body.orderType || 'DESC',
      obj, resourceData;

    try {

      switch (userType) {
        case 'school_admin':
          obj = joi.validate(body, this.schoolAdminValidationSchema);

          if (obj.error) {
            const error = new Error('ValidationError');
            error.details = obj.error.details[0].message;

            throw error;
          }

          query_obj = {
            order: [
              [orderBy, orderType]
            ],
            where: {
              created_by: user.id
            }
          };

          if (body.skip) {
            query_obj.offset = body.skip;
          }

          if (body.limit) {
            query_obj.limit = body.limit;
          }

          if (body.searchText) {
            query_obj.where[this.Op.or] = [{
              name: {
                [this.Op.like]: `%${body.searchText}%`
              }
            }, {
              source: {
                [this.Op.like]: `%${body.searchText}%`
              }
            }, {
              desc: {
                [this.Op.like]: `%${body.searchText}%`
              }
            }]
          }

          resourceData = await this.resourcesRepository._getAllByArgs(query_obj)

          this.emit(SUCCESS, resourceData);

          break;
        case 'family':

          obj = joi.validate(body, this.familyValidationSchema);

          if (obj.error) {
            const error = new Error('ValidationError');
            error.details = obj.error.details[0].message;

            throw error;
          }

          query_obj = {
            order: [
              [orderBy, orderType]
            ],
            where: {
              created_by: user.family.school_id
            }
          };

          if (body.skip) {
            query_obj.offset = body.skip;
          }

          if (body.limit) {
            query_obj.limit = body.limit;
          }

          if (body.searchText) {
            query_obj.where[this.Op.or] = [{
              name: {
                [this.Op.like]: `%${body.searchText}%`
              }
            }, {
              source: {
                [this.Op.like]: `%${body.searchText}%`
              }
            }, {
              desc: {
                [this.Op.like]: `%${body.searchText}%`
              }
            }]
          }

          tagData = await this.resourcesRepository._getAllByArgs(query_obj)

          this.emit(SUCCESS, tagData);
          break;
        default:
          break;
      }

    } catch (error) {
      switch (error.message) {
        case 'ValidationError':
          return this.emit(VALIDATION_ERROR, error);
        default:
          return this.emit(ERROR, error);
      }
    }
  }
}

GetAllTag.setOutputs(['SUCCESS', 'ERROR', 'VALIDATION_ERROR']);

module.exports = GetAllTag;
