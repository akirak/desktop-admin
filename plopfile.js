module.exports = function (plop) {
    plop.setGenerator('role', {
        description: 'Add an Ansible role',
        prompts:
        [ { type: 'input',
            name: 'name',
            message: 'Name of the new role'
          }
        ],
        actions:
        [ { type: 'add',
            path: 'roles/{{ name }}/meta/main.yml',
            templateFile: 'plop/role/meta.yml'
          }
        ]
    });
};
