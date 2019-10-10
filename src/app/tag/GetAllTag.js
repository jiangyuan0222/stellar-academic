const Operation = require('src/app/Operation');
const joi = require('joi');

class GetAllTag extends Operation {
  constructor({ tagsRepository }) {
    super();
    this.tagsRepository = tagsRepository;
  }

  async execute({ user, auth, body }) {
    const { SUCCESS, ERROR, VALIDATION_ERROR } = this.outputs;

    try {

      let tagData = await this.tagsRepository._getAllByArgs({})

      this.emit(SUCCESS, tagData);

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
