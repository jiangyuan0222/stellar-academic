const Operation = require("src/app/Operation");

class GetAllSchoolStaff extends Operation {
  constructor({ schoolStaffRepository, usersRepository }) {
    super();
    this.schoolStaffRepository = schoolStaffRepository;
    this.usersRepository = usersRepository;
    this.Op = require('sequelize').Op;
  }

  async execute() {
    const { SUCCESS, ERROR } = this.outputs;
    try {
      const schoolStaffsData = await this.usersRepository._getAllByArgs({
        where: {
          name: 'Sailaway Learning6',
          user_type: {
            [this.Op.not]: 'family'
          }
        }
      });

      this.emit(SUCCESS, schoolStaffsData);
    } catch (error) {
      this.emit(ERROR, error);
    }
  }
}

GetAllSchoolStaff.setOutputs(['SUCCESS', 'ERROR']);

module.exports = GetAllSchoolStaff;
