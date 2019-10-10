const Operation = require('src/app/Operation');

class GetProfile extends Operation {
  constructor({ usersRepository }) {
    super();
    this.usersRepository = usersRepository;
  }

  async execute({ auth, user }) {
    const { SUCCESS, NOT_FOUND } = this.outputs;

    try {
      // const user = await this.usersRepository.getById(userId);
      this.emit(SUCCESS, user);
    } catch (error) {
      throw error;
    }
  }
}
GetProfile.setOutputs(['SUCCESS', 'ERROR', 'NOT_FOUND']);

module.exports = GetProfile;
