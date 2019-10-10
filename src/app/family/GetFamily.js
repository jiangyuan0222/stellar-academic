const Operation = require('src/app/Operation');

class GetFamily extends Operation {
  constructor({ familiesRepository, UserModel }) {
    super();
    this.familiesRepository = familiesRepository,
      this.UserModel = UserModel;
  }

  async execute({ user }) {
    const { SUCCESS, ERROR, FAMILY_NOT_EXIST } = this.outputs;

    try {

      let familyData = await this.familiesRepository._getCustom({
        include: [{
          model: this.UserModel,
          attributes: ['first_name', 'last_name', 'email',
            'phone', 'name', 'logo', 'paypal_client_id',
            'paypal_client_secret'],
          as: 'school'
        }],
        where: {
          user_id: user.id
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

GetFamily.setOutputs(['SUCCESS', 'ERROR', 'FAMILY_NOT_EXIST']);

module.exports = GetFamily;
