const Operation = require('src/app/Operation');

class GetProgram extends Operation {
  constructor({ programsRepository }) {
    super();
    this.programsRepository = programsRepository;
  }

  async execute() {
    const { SUCCESS, ERROR, PROGRAM_NOT_EXIST } = this.outputs;

    try {

      let ProgramData = await this.programsRepository.getAll()

      if (!(ProgramData.length > 0)) {
        throw new Error(PROGRAM_NOT_EXIST);
      }

      this.emit(SUCCESS, ProgramData);
    } catch (error) {
      switch (error.message) {
        case 'PROGRAM_NOT_EXIST':
          return this.emit(PROGRAM_NOT_EXIST, error);
        default:
          return this.emit(ERROR, error);
      }
    }
  }
}

GetProgram.setOutputs(['SUCCESS', 'ERROR', 'PROGRAM_NOT_EXIST']);

module.exports = GetProgram;
