const Operation = require('src/app/Operation');

class GetAllSchool extends Operation {
  constructor({ usersRepository }) {
    super();
    this.usersRepository = usersRepository;
  }

  async execute() {
    const { SUCCESS, ERROR } = this.outputs;

    try {
      const schoolsData = await this.usersRepository.getAll({
        where: {
          user_type: "school_admin"
        }
      });

      this.emit(SUCCESS, schoolsData);
    } catch (error) {
      this.emit(ERROR, error);
    }
  }
}

GetAllSchool.setOutputs(['SUCCESS', 'ERROR']);

module.exports = GetAllSchool;
