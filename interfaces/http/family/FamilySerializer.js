const FamilySerializer = {
  serialize({ id, m_category, m_first_name }) {
    return {
      id,
      m_category,
      m_first_name
    };
  }
};

module.exports = FamilySerializer;
