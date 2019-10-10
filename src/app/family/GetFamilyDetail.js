const Operation = require('src/app/Operation');

class GetFamilyDetail extends Operation {
  constructor({ familiesRepository, StudentModel, UserRequestModel,
    UserOrderModel, UserModel, TransactionModel, FamilyModel, UserFileModel, FamilyNoteModel }) {
    super();
    this.familiesRepository = familiesRepository,
      this.StudentModel = StudentModel,
      this.UserModel = UserModel,
      this.UserFileModel = UserFileModel,
      this.UserOrderModel = UserOrderModel,
      this.TransactionModel = TransactionModel,
      this.FamilyNoteModel = FamilyNoteModel,
      this.UserRequestModel = UserRequestModel;
  }

  async execute({ user, params }) {
    const { SUCCESS, ERROR, FAMILY_NOT_EXIST } = this.outputs;

    try {

      let familyData = await this.familiesRepository._getByArgs({
        include: [{
          model: this.UserFileModel,
          as: 'user_files'
        }, {
          model: this.StudentModel,
          as: 'students'
        }, {
          model: this.UserRequestModel,
          as: 'user_requests'
        }, {
          model: this.FamilyNoteModel,
          as: 'family_notes'
        }, {
          model: this.UserOrderModel,
          as: 'user_orders',
          include: [{
            model: this.StudentModel,
            as: 'student',
          }, {
            model: this.TransactionModel,
            as: 'transaction'
          }]
        }, {
          model: this.UserModel,
          attributes: ['username', 'first_name', 'last_name', 'phone', 'created_at']
        }],
        where: {
          user_id: params.id
        }
      })

      if (!familyData) {
        throw new Error(FAMILY_NOT_EXIST);
      }

      this.emit(SUCCESS, familyData);
    } catch (error) {
      if (error.message === 'FAMILY_NOT_EXIST') {
        return this.emit(FAMILY_NOT_EXIST, error);
      }
      this.emit(ERROR, error);
    }
  }
}

GetFamilyDetail.setOutputs(['SUCCESS', 'ERROR', 'FAMILY_NOT_EXIST']);

module.exports = GetFamilyDetail;
