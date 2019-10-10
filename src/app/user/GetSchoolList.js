const Operation = require('src/app/Operation');

class GetSchoolList extends Operation {
  constructor({ usersRepository }) {
    super();
    this.usersRepository = usersRepository;
  }

  async execute(userData) {
    const { SUCCESS, ERROR } = this.outputs;
    try {

      let schoolList = await this.usersRepository._getAllByArgs({
        attributes: ['id', 'first_name', 'last_name', 'email', 'phone'],
        where: {
          user_type: 'school_admin'
        }
      })

      this.emit(SUCCESS, schoolList);
    } catch (error) {
      switch (error.message) {
        default:
          this.emit(ERROR, error);
          break;
      }
    }
  }
}

GetSchoolList.setOutputs(['SUCCESS', 'ERROR']);

module.exports = GetSchoolList;
