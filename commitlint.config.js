module.exports = {
    extends: ['@commitlint/config-conventional'],
    rules: {
        'type-enum': [2, 'always', ['enhancement', 'feat', 'fix', 'refactor','update','revert', 'release']],
      },
};